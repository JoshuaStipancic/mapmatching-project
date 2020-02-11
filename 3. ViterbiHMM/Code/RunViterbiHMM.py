import os
import glob
import populate
import subprocess
import csv
import re
import time
import subprocess

for file in glob.glob("../../Data/*/*/*/*.gpx"):
  
  # Output current filename to terminal
  print file
  
  # Read file
  raw = populate.read(file)
  sequence=[]
  
  # Format filename and create appropriate directory
  resultsDir = str(file).replace('../Data', "Results")
  resultsDir,newName = resultsDir.rsplit('/',1)
  newName = newName.replace('.gpx','')
  
  if not os.path.exists(resultsDir):
    os.makedirs(resultsDir)

  # Format the required sequence of latitude and longitude   
  for row in raw:
    if "lat=" in str(row):
      line = re.sub("[^0-9,.,-]", "", str(row))
      line = line.replace("-"," -")
      lon,lat = line.split(" ",1)
      sequence.append([str(lat)+" "+str(lon)])
  
  # Save the created sequence to a text file
  pathToSequence = resultsDir + '/sequence.txt'
  populate.write(pathToSequence,sequence)
  
  # Formate output filename
  pathTooSequence = pathToSequence.replace(" ", "\ ")
  pathToOutput = pathTooSequence.replace('sequence.txt',newName+"_full.csv") #DELETE "_FULL.CSV" HERE TO REMOVE FULL FILE
  
  # Run the map matching algorithm (algorithm output will be reformatted below)
  start = time.time()
  
  os.system('python map_matching/map_matcher.py "host=localhost port=5432 dbname=routing user=stipancicjosh" ways < '+ pathTooSequence + ' 2> ' + pathToOutput)

  # Calculate and ouput run time  
  end = time.time()
  runTime = end - start
  
  timeFile = open(pathToSequence.replace('sequence.txt',newName + '_time.txt'),"w")
  timeFile.write("%s" % runTime)
  timeFile.close()
  
  # Open the output of the algorithm for reformatting
  pathToResults = pathToOutput.replace("\ ", " ")
  results = populate.read(pathToResults)
  results_new = []
  
  # Loop through each observation
  # If the current link is different from the previous link, add the current link to the output list
  i = 0
  while i < len(results)-2:
    if results[i][3] != results[i+1][3]:
      results_new.append([results[i][3]])
    i = i + 1

  # Write the formatted output to a file
  populate.write(pathToResults.replace("_full",""),results_new) #DELETE ".REPLACE("_FULL.CSV","")" HERE TO REMOVE FULL FILE
  
  # Delete sequence file  
  os.remove(pathToSequence)
