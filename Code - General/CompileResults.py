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
    
# -------------------------
# Algorithms 1, 3, 4, and 5
# -------------------------

# Generate structure of datafile
accuracies = [None] * 5
for i in range(0,5):
  accuracies[i] = [None] * 3
  for j in range(0,3):
    accuracies[i][j] = [None] * 12
    for k in range(0,12):
      accuracies[i][j][k] = [None] * 10
      
misses = [None] * 5
for i in range(0,5):
  misses[i] = [None] * 3
  for j in range(0,3):
    misses[i][j] = [None] * 12
    for k in range(0,12):
      misses[i][j][k] = [None] * 10

falses = [None] * 5
for i in range(0,5):
  falses[i] = [None] * 3
  for j in range(0,3):
    falses[i][j] = [None] * 12
    for k in range(0,12):
      falses[i][j][k] = [None] * 10

for file in glob.glob("../*/Results/*/*/*/*_accuracy.txt"):

  # Open file and read the run time
  #f = open(file, "r")
  #accuracy = re.sub("[^0-9,.]", "", f.read())
  text = populate.read(file)
  accuracy = text[0][0]
  missed = text[0][1]
  falsed = text[0][2]

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
  accuracies[algorithm][application][scenario][phone] = accuracy
  misses[algorithm][application][scenario][phone] = missed
  falses[algorithm][application][scenario][phone] = falsed

# Output a separate file for each combination of algorithm and application
for i in range(0,5):
  for j in range(0,3):
    if i != 1:
      populate.write("AccuracyResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",accuracies[i][j])
      populate.write("MissedResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",misses[i][j])
      populate.write("FalseResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",falses[i][j])

# -----------
# Algorithm 2
# -----------

# Generate structure of datafile
accuracies = [None] * 4
for i in range(0,4):
  accuracies[i] = [None] * 3
  for j in range(0,3):
    accuracies[i][j] = [None] * 12
    for k in range(0,12):
      accuracies[i][j][k] = [None] * 10

misses = [None] * 4
for i in range(0,4):
  misses[i] = [None] * 3
  for j in range(0,3):
    misses[i][j] = [None] * 12
    for k in range(0,12):
      misses[i][j][k] = [None] * 10

falses = [None] * 4
for i in range(0,4):
  falses[i] = [None] * 3
  for j in range(0,3):
    falses[i][j] = [None] * 12
    for k in range(0,12):
      falses[i][j][k] = [None] * 10
      
for file in glob.glob("../*/Results -*/*/*/*/*_accuracy.txt"):
  
  # Open file and read the run time
  #f = open(file, "r")
  #accuracy = re.sub("[^0-9,.]", "", f.read())
  text = populate.read(file)
  accuracy = text[0][0]
  missed = text[0][1]
  falsed = text[0][2]

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
  accuracies[routingNum.index(routing)][application][scenario][phone] = accuracy
  misses[routingNum.index(routing)][application][scenario][phone] = missed
  falses[routingNum.index(routing)][application][scenario][phone] = falsed

# Output a separate file for each combination of algorithm and application
for i in range(0,4):
  for j in range(0,3):
    populate.write("AccuracyResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",accuracies[i][j])
    populate.write("MissedResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",misses[i][j])
    populate.write("FalseResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",falses[i][j])
