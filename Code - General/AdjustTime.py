import os
import glob
import populate
import subprocess
import csv
import re
import time
import subprocess
import os.path
from os import path

for file in glob.glob("../*/Results*/*/*/*/*_time.txt"):
  
  f = open(file, "r")
  time = re.sub("[^0-9,.]", "", f.read())
  
  # Split filename at each "\" and assign to necessary variables
  null1, algorithmName, routing, scenario, phone, application, filename = file.rsplit('/')
  
  if path.exists("../4. TMM/Results/" + scenario + "/" + phone + "/" + application + "/" + filename.replace("time.txt", "full.csv")):
    lenFile = populate.read("../4. TMM/Results/" + scenario + "/" + phone + "/" + application + "/" + filename.replace("time.txt", "full.csv"))
    length = len(lenFile)
    timeAdj = float(time)/length*1000
  else: timeAdj = time
  
  timeFile = open(file.replace('.txt','Adj.txt'),"w")
  timeFile.write("%s" % timeAdj)
  timeFile.close()
