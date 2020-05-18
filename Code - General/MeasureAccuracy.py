import os
import glob
import populate
import subprocess
import csv
import re
import time
import difflib

# Read and format the length data file
lengthh = populate.read("../Ground Truth/GroundTruthLengths.csv")
lengthIDs = []
lengthFile=[]
for row in lengthh:
  if row:
    lengthIDs.append(row[0])
    lengthFile.append(row[1])

for file in glob.glob("../*/Results*/*/*/*/*.csv"):

  # Exclude files with the full map matching results, accuracy is based only on the series of link IDs
  if "full" in file:
    None

  else:
    # print file

    # Read and format the map matched data file
    matched = populate.read(file)
    matchedd=[]
    for row in matched:
      if row:
        matchedd.append(row[0])

    # Determine the scenario from the file name
    scen = file[file.find("Scenario"):file.find("Scenario") + 11].rstrip('/')

    # Read and format the ground truth data file
    truth = populate.read("../Ground Truth/" + scen + ".csv")
    truthh=[]
    for row in truth:
      if row:
        truthh.append(row[0])

    # Determine the map matching accuracy
    results = difflib.SequenceMatcher(None, tuple(matchedd), tuple(truthh))

    nMatches = sum([m.size for m in results.get_matching_blocks()])
    nMissed = len(tuple(truthh))-nMatches
    nFalse = len(tuple(matchedd))-nMatches
    
    accuracy = results.ratio()*100
    if len(tuple(matchedd)) > 0:
      false = float(nFalse)/len(tuple(matchedd))*100
    else:
      false = 0
    missed = float(nMissed)/len(tuple(truthh))*100
    
    # -----------------------------------
    # Distance-weighted accuracy measures
    # -----------------------------------
    t = results.get_matching_blocks()
    correctLength = 0
    
    # Calculate sum of lengths for correctly matched segments
    for block in t:
      startMatched = block[0] 
      startTruth = block[1]
      blockLength = block[2]
      
      if startTruth < len(lengthFile) and blockLength >0:
        for i in truthh[startTruth:startTruth+blockLength]: 
          if i in lengthIDs:
            correctLength += float(lengthFile[lengthIDs.index(i)])
          else: correctLength += 100
    
    # Calculate total length of ground truth for the scenario
    trueLength = 0      
    for i in truthh:
      if i in lengthIDs:
        trueLength += float(lengthFile[lengthIDs.index(i)])
      else: trueLength += 100

    # Calculate total length of map matched result
    matchedLength = 0      
    for i in matchedd:
      if i in lengthIDs:
        matchedLength += float(lengthFile[lengthIDs.index(i)])
      else: matchedLength += 100
    
    # Distance-weighted % correct matches
    distCorrect = correctLength/trueLength*100
    
    # Distance-weighted % missed links
    distMissed = 100 - distCorrect
    
    # Distance-weighted % false links
    if matchedLength > 0:
      distFalse = (matchedLength-correctLength)/matchedLength*100
    else: dist = 0
    
    # Output results
    accuracyFile = open(file.replace('.csv','_accuracy.txt'),"w")
    accuracyFile.write("%s, %s, %s, %s, %s, %s, %s, %s, %s" % (accuracy, missed, false, distCorrect, distMissed, distFalse, nMatches, len(tuple(truthh)), len(tuple(matched))))
    accuracyFile.close()


# results = difflib.SequenceMatcher(None, "abcdefghij", "abcdefghij")
# accuracy = results.ratio()*100
# print accuracy

    
