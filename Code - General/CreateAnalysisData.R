library(here)
library(stringr)
library(ggplot2)
library(gridExtra)

setwd("/Users/stipancicjosh/mapmatching-project")

######################################################
# ACCURACY
######################################################
dataa <- data.frame(accuracy=numeric(),
                    scenario=numeric(),
                    phone=numeric(),
                    algorithm = character(),
                    application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/AccuracyResults/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,35,46) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      dataa <- rbind(dataa, de)

    }
  }
}

######################################################
# DISTANCE CORRECT
######################################################
distData <- data.frame(accuracy=numeric(),
                    scenario=numeric(),
                    phone=numeric(),
                    algorithm = character(),
                    application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/DistCorrect/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,31,42) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      distData <- rbind(distData, de)

    }
  }
}

######################################################
# DISTANCE MISSED
######################################################
distMissed <- data.frame(accuracy=numeric(),
                       scenario=numeric(),
                       phone=numeric(),
                       algorithm = character(),
                       application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/DistMissed/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,30,41) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      distMissed <- rbind(distMissed, de)

    }
  }
}

######################################################
# DISTANCE FALSE
######################################################
distFalse <- data.frame(accuracy=numeric(),
                        scenario=numeric(),
                        phone=numeric(),
                        algorithm = character(),
                        application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/DistFalse/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,29,40) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      distFalse <- rbind(distFalse, de)

    }
  }
}

######################################################
# MISSED
######################################################
missedData <- data.frame(accuracy=numeric(),
                         scenario=numeric(),
                         phone=numeric(),
                         algorithm = character(),
                         application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/MissedResults/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,33,44) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      missedData <- rbind(missedData, de)

    }
  }
}

######################################################
# FALSE
######################################################
falseData <- data.frame(accuracy=numeric(),
                        scenario=numeric(),
                        phone=numeric(),
                        algorithm = character(),
                        application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/FalseResults/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,32,43) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      falseData <- rbind(falseData, de)

    }
  }
}

dataaa <- data.frame(time=numeric(),
                     scenario=numeric(),
                     phone=numeric(),
                     algorithm = character(),
                     application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("FMM", "FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/TimeResults/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)

  algo_name <- str_sub(filename,31,42) # get algorithm name
  app_name <- str_sub(filename,-5,-5) # get application name

  for (i in 1:12){
    for (j in 1:10){

      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("time","scenario", "phone","algorithm","application")
      dataaa <- rbind(dataaa, de)

    }
  }
}

# Combine data into one file
fullData <- cbind(dataa, dataaa$time, missedData$accuracy, falseData$accuracy, distData$accuracy, distMissed$accuracy, distFalse$accuracy)

names(fullData)[names(fullData) == "dataaa$time"] <- "time"
names(fullData)[names(fullData) == "missedData$accuracy"] <- "missed"
names(fullData)[names(fullData) == "falseData$accuracy"] <- "false"
names(fullData)[names(fullData) == "distData$accuracy"] <- "distCorrect"
names(fullData)[names(fullData) == "distMissed$accuracy"] <- "distMissed"
names(fullData)[names(fullData) == "distFalse$accuracy"] <- "distFalse"

write.csv(fullData, "Results/full_data.csv")