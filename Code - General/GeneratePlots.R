library(here)
library(stringr)
library(ggplot2)
library(gridExtra)

# Clear the current workspace and set the working directory
rm(list=ls())
#setwd(here("mapmatching-project"))

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

for(filename in Sys.glob("Results/AccuracyResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,35,46) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      dataa <- rbind(dataa, de)
      
    }
  }
}

# Plot by algorithm
# -----------------
png(file="Results/AccuracyResults/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=dataa,
        main = "Accuracy By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/AccuracyResults/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=dataa,
        main = "Accuracy By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/AccuracyResults/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=dataa,
        main = "Accuracy By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/AccuracyResults/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=dataa,
        main = "Accuracy By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# DISTANCE CORRECT
######################################################

distData <- data.frame(accuracy=numeric(),
                    scenario=numeric(),
                    phone=numeric(),
                    algorithm = character(),
                    application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/DistCorrect/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,31,42) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      distData <- rbind(distData, de)
      
    }
  }
}

# Plot by algorithm
# -----------------
png(file="Results/DistCorrect/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=distData,
        main = "Distance-Weighted % Correct By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/DistCorrect/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=distData,
        main = "Distance-Weighted % Correct By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/DistCorrect/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=distData,
        main = "Distance-Weighted % Correct By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/DistCorrect/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=distData,
        main = "Distance-Weighted % Correct By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# DISTANCE MISSED
######################################################

distMissed <- data.frame(accuracy=numeric(),
                       scenario=numeric(),
                       phone=numeric(),
                       algorithm = character(),
                       application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/DistMissed/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,30,41) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      distMissed <- rbind(distMissed, de)
      
    }
  }
}

# Plot by algorithm
# -----------------
png(file="Results/DistMissed/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=distMissed,
        main = "Distance-Weighted % Missed By Algorithm",
        xlab = "Algorithm",
        ylab = "Missed (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/DistMissed/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=distMissed,
        main = "Distance-Weighted % Missed By Application",
        xlab = "Application",
        ylab = "Missed (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/DistMissed/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=distMissed,
        main = "Distance-Weighted % Missed By Scenario",
        xlab = "Scenarios",
        ylab = "Missed (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/DistCorrect/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=distMissed,
        main = "Distance-Weighted % Missed By Phone",
        xlab = "Phones",
        ylab = "Missed (%)",
        col = "light blue")
dev.off()

######################################################
# DISTANCE FALSE
######################################################

distFalse <- data.frame(accuracy=numeric(),
                       scenario=numeric(),
                       phone=numeric(),
                       algorithm = character(),
                       application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/DistFalse/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,29,40) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      distFalse <- rbind(distFalse, de)
      
    }
  }
}

# Plot by algorithm
# -----------------
png(file="Results/DistFalse/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=distFalse,
        main = "Distance-Weighted % False By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/DistFalse/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=distFalse,
        main = "Distance-Weighted % False By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/DistFalse/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=distFalse,
        main = "Distance-Weighted % False By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/DistFalse/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=distFalse,
        main = "Distance-Weighted % False By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# MISSED
######################################################

missedData <- data.frame(accuracy=numeric(),
                    scenario=numeric(),
                    phone=numeric(),
                    algorithm = character(),
                    application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/MissedResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,33,44) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      missedData <- rbind(missedData, de)
      
    }
  }
}

missedData[missedData==0]<-NA

# Plot by algorithm
# -----------------
png(file="Results/MissedResults/MissedByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=missedData,
        main = "Missed By Algorithm",
        xlab = "Algorithm",
        ylab = "Missed (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/MissedResults/MissedByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=missedData,
        main = "Missed By Application",
        xlab = "Application",
        ylab = "Missed (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/MissedResults/MissedByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=missedData,
        main = "Missed By Scenario",
        xlab = "Scenarios",
        ylab = "Missed (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/MissedResults/MissedByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=missedData,
        main = "Missed By Phone",
        xlab = "Phones",
        ylab = "Missed (%)",
        col = "light blue")
dev.off()

######################################################
# FALSE
######################################################

falseData <- data.frame(accuracy=numeric(),
                         scenario=numeric(),
                         phone=numeric(),
                         algorithm = character(),
                         application = character())

phones <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
algorithms <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
algos <- c("1_Applicatio", "2_astar_Appl", "2_astarbi_Ap", "2_dijkstra_A","2_dijkstrabi","3_Applicatio", "4_Applicatio", "5_Applicatio")
applications <- c("GPSTracker", "TrueMotion", "AutoMerit")

for(filename in Sys.glob("Results/FalseResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,32,43) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      falseData <- rbind(falseData, de)
      
    }
  }
}

# Plot by algorithm
# -----------------
png(file="Results/FalseResults/FalseByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=falseData,
        main = "False By Algorithm",
        xlab = "Algorithm",
        ylab = "False (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/FalseResults/FalseByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=falseData,
        main = "False By Application",
        xlab = "Application",
        ylab = "False (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/FalseResults/FalseByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=falseData,
        main = "False By Scenario",
        xlab = "Scenarios",
        ylab = "False (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/FalseResults/FalseByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=falseData,
        main = "False By Phone",
        xlab = "Phones",
        ylab = "False (%)",
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

for(filename in Sys.glob("Results/TimeResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,31,42) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("time","scenario", "phone","algorithm","application")
      dataaa <- rbind(dataaa, de)
      
    }
  }
}

# Plot by algorithm
# -----------------
png(file="Results/TimeResults/TimeByAlgorithm.png", width=1200, height=700)
boxplot(time~algorithm,
        data=dataaa,
        main = "Time By Algorithm",
        xlab = "Algorithm",
        ylab = "Time (s)",
        col = "purple",
        log = "y")
dev.off()

# Plot by application
# -------------------
png(file="Results/TimeResults/TimeByApplication.png", width=1200, height=700)
boxplot(time~application,
        data=dataaa,
        main = "Time By Application",
        xlab = "Application",
        ylab = "Time (s)",
        col = "light green",
        log = "y")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/TimeResults/TimeByScenario.png", width=1200, height=700)
boxplot(time~scenario,
        data=dataaa,
        main = "Time By Scenario",
        xlab = "Scenarios",
        ylab = "Time (s)",
        col = "orange",
        log = "y")
dev.off()

# Plot by phone
# -------------
png(file="Results/TimeResults/TimeByPhone.png", width=1200, height=700)
boxplot(time~phone,
        data=dataaa,
        main = "Time By Phone",
        xlab = "Phones",
        ylab = "Time (s)",
        col = "light blue",
        log = "y")
dev.off()

# Combine data into one file
fullData <- cbind(dataa, dataaa$time, missedData$accuracy, falseData$accuracy, distData$accuracy, distMissed$accuracy, distFalse$accuracy)

names(fullData)[names(fullData) == "dataaa$time"] <- "time"
names(fullData)[names(fullData) == "missedData$accuracy"] <- "missed"
names(fullData)[names(fullData) == "falseData$accuracy"] <- "false"
names(fullData)[names(fullData) == "distData$accuracy"] <- "distCorrect"
names(fullData)[names(fullData) == "distMissed$accuracy"] <- "distMissed"
names(fullData)[names(fullData) == "distFalse$accuracy"] <- "distFalse"

write.csv(fullData, "Results/full_data.csv")

# Detailed plots
# --------------
ggplot(fullData[fullData$algorithm %in% c("AMM",  "FastHMM_AStar", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=algorithm, y=accuracy, fill=scenario)) +
  geom_boxplot(outlier.shape = NA) +
  labs(title="Accuracy by Algorithm", x ="Algorithm", y = "Accuracy (%)", fill = "Scenarios") +
  theme(plot.title = element_text(hjust = 0.5))
ggsave("Results/Plots/AccuracyByAlgorithmByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("AMM",  "FastHMM_AStar", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=algorithm, y=time, fill=scenario)) +
  geom_boxplot(outlier.shape = NA) +
  labs(title="Time by Algorithm", x ="Algorithm", y = "Time (s)", fill = "Scenarios") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans='log10')
ggsave("Results/Plots/TimeByAlgorithmByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("AMM",  "FastHMM_AStar", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=time, y=accuracy, color=algorithm)) +
  geom_point(alpha=0.6) +
  labs(title="Time vs Accuracy", x ="Time (s)", y = "Accuracy (%)", colour = "Algorithms") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(trans='log10') +
  scale_colour_manual(values=c("#F8766D", "#CCCCCC", "#A3A500", "#00BF7D", "#00B0F6", "#E76BF3"))
ggsave("Results/Plots/TimeVsAccuracy.pdf", width = 12, height = 7, units = "in")

p4 <- ggplot(fullData[fullData$algorithm %in% c("AMM", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=accuracy, y=false, color=algorithm)) +
      geom_point(alpha=0.6,size=1) +
      labs(title="False vs Accuracy", x ="Accuracy (%)", y = "False (%)", colour = "Algorithms") +
      theme(plot.title = element_text(hjust = 0.5))
p5 <- ggplot(fullData[fullData$algorithm %in% c("AMM", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=accuracy, y=missed, color=algorithm)) +
      geom_point(alpha=0.6, size=1) +
      labs(title="Missed vs Accuracy", x ="Accuracy (%)", y = "Missed (%)", colour = "Algorithms") +
      theme(plot.title = element_text(hjust = 0.5)) 
ggsave("Results/Plots/MissedAndFalseVsAccuracy.pdf", arrangeGrob(grobs=list(p4, p5),nrow=1,ncol=2), width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("AMM", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=missed, y=false, color=algorithm)) +
  geom_point(alpha=0.6) +
  labs(title="% Missed vs % False", x ="Missed (%)", y = "False (%)", colour = "Algorithms") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_reverse() + scale_y_reverse()
ggsave("Results/Plots/MissedVsFalse.pdf", width = 12, height = 7, units = "in")

  