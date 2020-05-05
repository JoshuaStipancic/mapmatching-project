import os
import glob
import populate
import subprocess
import csv
import re
import time
import  difflib

for file in glob.glob("../*/Results*/*/*/*/*.csv"):
  
  # Exclude files with the full map matching results, accuracy is based only on the series of link IDs
  if "full" in file:
    None
    
  else:
    print file
    
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
    results=difflib.SequenceMatcher(None, tuple(matchedd), tuple(truthh))
    accuracy = results.ratio()*100
    
    accuracyFile = open(file.replace('.csv','_accuracy.txt'),"w")
    accuracyFile.write("%s" % accuracy)
    accuracyFile.close()


    
