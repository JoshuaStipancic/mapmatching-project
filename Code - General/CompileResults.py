import os
import glob
import populate
import subprocess
import csv
import re
import time

# -------------------------
# Algorithms 1, 3, 4, and 5
# -------------------------

# Generate structure of datafile
times = [None] * 5
for i in range(0,5):
  times[i] = [None] * 3
  for j in range(0,3):
    times[i][j] = [None] * 12
    for k in range(0,12):
      times[i][j][k] = [None] * 10

for file in glob.glob("../*/Results/*/*/*/*_time.txt"):

  # Open file and read the run time
  f = open(file, "r")
  time = re.sub("[^0-9,.]", "", f.read())

  # Split filename at each "\" and assign to necessary variables
  null1, algorithmName, null2, scenario, phone, application, filename = file.rsplit('/')

  # Extract algorithm
  algorithm = int(algorithmName[0])-1

  # Extract scenario
  scenario = int(scenario[9:])-1

  # Extract phone
  phone = int(phone[0:2].replace("_",""))-1

  # Extract app
  application = int(application[0])-1

  # 'Insert' time into correct location in data file
  times[algorithm][application][scenario][phone] = time

# Output a separate file for each combination of algorithm and application
for i in range(0,5):
  for j in range(0,3):
    if i != 1:
      populate.write("TimeResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",times[i][j])

# -----------
# Algorithm 2
# -----------

# Generate structure of datafile
times = [None] * 4
for i in range(0,4):
  times[i] = [None] * 3
  for j in range(0,3):
    times[i][j] = [None] * 12
    for k in range(0,12):
      times[i][j][k] = [None] * 10

for file in glob.glob("../*/Results -*/*/*/*/*_time.txt"):
  
  # Open file and read the run time
  f = open(file, "r")
  time = re.sub("[^0-9,.]", "", f.read())

  # Split filename at each "\" and assign to necessary variables
  null1, algorithmName, routing, scenario, phone, application, filename = file.rsplit('/')

  # Extract algorithm
  algorithm = 2
  
  # Extract routing algorithm
  routing = routing[routing.index("-")+2:]
  routingNum = ["astar", "astarbi", "dijkstra", "dijkstrabi"]

  # Extract scenario
  scenario = int(scenario[9:])-1

  # Extract phone
  phone = int(phone[0:2].replace("_",""))-1

  # Extract app
  application = int(application[0])-1

  # 'Insert' time into correct location in data file
  times[routingNum.index(routing)][application][scenario][phone] = time

# Output a separate file for each combination of algorithm and application
for i in range(0,4):
  for j in range(0,3):
    populate.write("TimeResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",times[i][j])
