import os
import glob
import populate
import subprocess
import csv
import re
import time
import difflib

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


    accuracyFile = open(file.replace('.csv','_accuracy.txt'),"w")
    accuracyFile.write("%s, %s, %s, %s, %s, %s" % (accuracy, missed, false, nMatches, len(tuple(truthh)), len(tuple(matched))))
    #accuracyFile.write("%s" % accuracy)
    accuracyFile.close()


# results = difflib.SequenceMatcher(None, "abcdefghij", "abcdefghij")
# accuracy = results.ratio()*100
# print accuracy

    
