import os
import glob
import populate
import subprocess
import csv
import re
import time

# ------------------------------
# Algorithms 1, 3, 4, and 5 TIME
# ------------------------------

# Generate structure of datafile
times = [None] * 5
for i in range(0,5):
  times[i] = [None] * 3
  for j in range(0,3):
    times[i][j] = [None] * 12
    for k in range(0,12):
      times[i][j][k] = [None] * 10

for file in glob.glob("../*/Results/*/*/*/*_timeAdj.txt"):

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
      if not os.path.exists("../Results/TimeResults/"):os.makedirs("../Results/TimeResults/")
      populate.write("../Results/TimeResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",times[i][j])

# ----------------
# Algorithm 2 TIME
# ----------------

# Generate structure of datafile
times = [None] * 4
for i in range(0,4):
  times[i] = [None] * 3
  for j in range(0,3):
    times[i][j] = [None] * 12
    for k in range(0,12):
      times[i][j][k] = [None] * 10

for file in glob.glob("../*/Results -*/*/*/*/*_timeAdj.txt"):
  
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
    populate.write("../Results/TimeResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",times[i][j])
    
# ----------------------------------
# Algorithms 1, 3, 4, and 5 ACCURACY
# ----------------------------------

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
      
dCorrect = [None] * 5
for i in range(0,5):
  dCorrect[i] = [None] * 3
  for j in range(0,3):
    dCorrect[i][j] = [None] * 12
    for k in range(0,12):
      dCorrect[i][j][k] = [None] * 10
      
dMissed = [None] * 5
for i in range(0,5):
  dMissed[i] = [None] * 3
  for j in range(0,3):
    dMissed[i][j] = [None] * 12
    for k in range(0,12):
      dMissed[i][j][k] = [None] * 10

dFalse = [None] * 5
for i in range(0,5):
  dFalse[i] = [None] * 3
  for j in range(0,3):
    dFalse[i][j] = [None] * 12
    for k in range(0,12):
      dFalse[i][j][k] = [None] * 10
      
for file in glob.glob("../*/Results/*/*/*/*_accuracy.txt"):

  # Open file and read the run time
  #f = open(file, "r")
  #accuracy = re.sub("[^0-9,.]", "", f.read())
  text = populate.read(file)
  accuracy = text[0][0]
  missed = text[0][1]
  falsed = text[0][2]
  ddCorrect = text[0][3]
  ddMissed = text[0][4]
  ddFalse = text[0][5]

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
  dCorrect[algorithm][application][scenario][phone] = ddCorrect
  dMissed[algorithm][application][scenario][phone] = ddMissed
  dFalse[algorithm][application][scenario][phone] = ddFalse
  
# Output a separate file for each combination of algorithm and application
for i in range(0,5):
  for j in range(0,3):
    if i != 1:
      if not os.path.exists("../Results/AccuracyResults/"):os.makedirs("../Results/AccuracyResults/")
      populate.write("../Results/AccuracyResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",accuracies[i][j])
      if not os.path.exists("../Results/MissedResults/"):os.makedirs("../Results/MissedResults/")
      populate.write("../Results/MissedResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",misses[i][j])
      if not os.path.exists("../Results/FalseResults/"):os.makedirs("../Results/FalseResults/")
      populate.write("../Results/FalseResults/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",falses[i][j])
      if not os.path.exists("../Results/DistCorrect/"):os.makedirs("../Results/DistCorrect/")
      populate.write("../Results/DistCorrect/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",dCorrect[i][j])
      if not os.path.exists("../Results/DistMissed/"):os.makedirs("../Results/DistMissed/")
      populate.write("../Results/DistMissed/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",dMissed[i][j])
      if not os.path.exists("../Results/DistFalse/"):os.makedirs("../Results/DistFalse/")
      populate.write("../Results/DistFalse/Algorithm_" + str(i+1) + "_Application_" + str(j+1) + ".csv",dFalse[i][j])


# --------------------
# Algorithm 2 ACCURACY
# --------------------

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

dCorrect = [None] * 4
for i in range(0,4):
  dCorrect[i] = [None] * 3
  for j in range(0,3):
    dCorrect[i][j] = [None] * 12
    for k in range(0,12):
      dCorrect[i][j][k] = [None] * 10
      
dMissed = [None] * 4
for i in range(0,4):
  dMissed[i] = [None] * 3
  for j in range(0,3):
    dMissed[i][j] = [None] * 12
    for k in range(0,12):
      dMissed[i][j][k] = [None] * 10
      
dFalse = [None] * 4
for i in range(0,4):
  dFalse[i] = [None] * 3
  for j in range(0,3):
    dFalse[i][j] = [None] * 12
    for k in range(0,12):
      dFalse[i][j][k] = [None] * 10
      
for file in glob.glob("../*/Results -*/*/*/*/*_accuracy.txt"):
  
  # Open file and read the run time
  #f = open(file, "r")
  #accuracy = re.sub("[^0-9,.]", "", f.read())
  text = populate.read(file)
  accuracy = text[0][0]
  missed = text[0][1]
  falsed = text[0][2]
  ddCorrect = text[0][3]
  ddMissed = text[0][4]
  ddFalse = text[0][5]

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

  # 'Insert' measure into correct location in data file
  accuracies[routingNum.index(routing)][application][scenario][phone] = accuracy
  misses[routingNum.index(routing)][application][scenario][phone] = missed
  falses[routingNum.index(routing)][application][scenario][phone] = falsed
  dCorrect[routingNum.index(routing)][application][scenario][phone] = ddCorrect
  dMissed[routingNum.index(routing)][application][scenario][phone] = ddMissed
  dFalse[routingNum.index(routing)][application][scenario][phone] = ddFalse
  
# Output a separate file for each combination of algorithm and application
for i in range(0,4):
  for j in range(0,3):
    populate.write("../Results/AccuracyResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",accuracies[i][j])
    populate.write("../Results/MissedResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",misses[i][j])
    populate.write("../Results/FalseResults/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",falses[i][j])
    populate.write("../Results/DistCorrect/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",dCorrect[i][j])
    populate.write("../Results/DistMissed/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",dMissed[i][j])
    populate.write("../Results/DistFalse/Algorithm_2_" + routingNum[i] + "_Application_" + str(j+1) + ".csv",dFalse[i][j])
