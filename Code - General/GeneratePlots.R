library(here)
library(stringr)
library(ggplot2)

# Clear the current workspace and set the working directory
rm(list=ls())
setwd(here("mapmatching-project"))

######################################################
# ACCURACY
######################################################

dataa <- data.frame(accuracy=numeric(),
                    scenario=numeric(),
                    phone=numeric(),
                    algorithm = character(),
                    application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Code - General/AccuracyResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  print(filename)
  
  algo_name <- str_sub(filename,42,53) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      dataa <- rbind(dataa, de)
      
    }
  }
}

dataa[dataa==0]<-NA

# Plot by algorithm
# -----------------
png(file="Code - General/AccuracyResults/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=dataa,
        main = "Accuracy By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Code - General/AccuracyResults/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=dataa,
        main = "Accuracy By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Code - General/AccuracyResults/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=dataa,
        main = "Accuracy By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Code - General/AccuracyResults/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=dataa,
        main = "Accuracy By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# TIME
######################################################

dataaa <- data.frame(time=numeric(),
                    scenario=numeric(),
                    phone=numeric(),
                    algorithm = character(),
                    application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Code - General/TimeResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  print(filename)
  
  algo_name <- str_sub(filename,38,49) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("time","scenario", "phone","algorithm","application")
      dataaa <- rbind(dataaa, de)
      
    }
  }
}

dataaa[dataaa==0]<-NA

# Plot by algorithm
# -----------------
png(file="Code - General/TimeResults/TimeByAlgorithm.png", width=1200, height=700)
boxplot(time~algorithm,
        data=dataaa,
        main = "Time By Algorithm",
        xlab = "Algorithm",
        ylab = "Time (s)",
        col = "purple",
        #ylim = c(0,1000),
        log = "y")
dev.off()

# Plot by application
# -------------------
png(file="Code - General/TimeResults/TimeByApplication.png", width=1200, height=700)
boxplot(time~application,
        data=dataaa,
        main = "Time By Application",
        xlab = "Application",
        ylab = "Time (s)",
        col = "light green",
        ylim = c(0,20))
dev.off()

# Plot by scenario
# ----------------
png(file="Code - General/TimeResults/TimeByScenario.png", width=1200, height=700)
boxplot(time~scenario,
        data=dataaa,
        main = "Time By Scenario",
        xlab = "Scenarios",
        ylab = "Time (s)",
        col = "orange",
        ylim = c(0,20))
dev.off()

# Plot by phone
# -------------
png(file="Code - General/TimeResults/TimeByPhone.png", width=1200, height=700)
boxplot(time~phone,
        data=dataaa,
        main = "Time By Phone",
        xlab = "Phones",
        ylab = "Time (s)",
        col = "light blue",
        ylim = c(0,20))
dev.off()

ggplot(dataa[dataa$algorithm %in% c("AMM",  "FastHMM_AStar", "ViterbiHMM","TMM","HyMM") ,], aes(x=algorithm, y=accuracy, fill=scenario)) +
geom_boxplot(outlier.shape = NA)

ggplot(dataa[dataaa$algorithm %in% c("AMM",  "FastHMM_AStar", "ViterbiHMM","TMM","HyMM") ,], aes(x=algorithm, y=time, fill=scenario)) +
  geom_boxplot(outlier.shape = NA)
