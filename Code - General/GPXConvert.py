import os
import glob
import populate
import subprocess
import csv
import re
import time

for file in glob.glob("../Data/*/*/*/*.gpx"):
  
  print file
  raw = populate.read(file)
  new=[]

  if "trk" in raw[2][0]:
    continue
      
  for row in raw:
    line = row[0]
    if "wpt" in line:
      line = line.replace("wpt", "trkpt")
      #print line
      new.append(line)
    else:
      #print line
      new.append(line)
      
  name = file[file.rfind('/')+1:file.rfind('.')]
      
  new.insert(2,"<trk>")
  new.insert(3,"<name>"+name+"</name>")
  new.insert(4,"<trkseg>")
  new.insert(len(new)-1,"</trkseg>")
  new.insert(len(new)-1,"</trk>")

  with open(file, 'w') as filehandle:
    for l in new:
        filehandle.write('%s\n' % l)
