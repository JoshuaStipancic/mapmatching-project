import os
import glob
import populate
import csv

matchedd=[]

for file in glob.glob("../*/Results*/*/*/*/*.csv"):

  # Exclude files with the full map matching results, accuracy is based only on the series of link IDs
  if "full" in file:
    None

  else:
    # print file

    # Read and format the map matched data file
    matched = populate.read(file)
    
    for row in matched:
      if row:
        matchedd.append(row[0])

matchedd = list(set(matchedd))

with open("Links.csv", 'wb') as csvfile:
  writer = csv.writer (csvfile)
  # Write each row of the list to file
  for i in range (len(matchedd)):
      writer.writerow([matchedd[i]])
    
