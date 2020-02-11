import os
import glob
import populate
import subprocess
import csv
import re
import time
import subprocess

for file in glob.glob("../../Test/*/*/*/*.gpx"):
  
  # Output current filename to terminal
  print file
  
  # Read file
  raw = populate.read(file)
  sequence=[]
  
  # Format filename and create appropriate directory
  resultsDir = str(file).replace('../Test', "Results")
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
  pathToOutput = pathTooSequence.replace('sequence.txt',newName+".csv")
  
  # Run the map matching algorithm (output format is handled automatically)
  start = time.time()
  
  os.system('python map_matching/map_matcher.py "host=localhost port=5432 dbname=routing user=stipancicjosh" ways < '+ pathTooSequence + ' 2> ' + pathToOutput)
  #file = subprocess.Popen('python map_matching/map_matcher.py "host=localhost port=5432 dbname=routing user=stipancicjosh" ways < '+ pathTooSequence, shell=True, stdout=subprocess.PIPE).stdout

  # Calculate and ouput run time  
  end = time.time()
  runTime = end - start
  
  
  pathToResults = pathToOutput.replace("\ ", " ")
  results = populate.read(pathToResults)
  results_new = []
  
  i = 0
  while i < len(results)-2:
    if results[i][3] != results[i+1][3]:
      results_new.append([results[i][3]])
    i = i + 1

  populate.write(pathToResults,results_new)
  
  timeFile = open(pathToSequence.replace('sequence.txt',newName + '_time.txt'),"w")
  timeFile.write("%s" % runTime)
  timeFile.close()

  # Delete sequence file  
  os.remove(pathToSequence)
