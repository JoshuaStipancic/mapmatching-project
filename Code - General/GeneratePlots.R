library(here)
library(stringr)
library(ggplot2)
library(gridExtra)

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
  #print(filename)
  
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

for(filename in Sys.glob("Code - General/MissedResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,40,51) # get application name
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
png(file="Code - General/MissedResults/MissedByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=missedData,
        main = "Missed By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Code - General/MissedResults/MissedByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=missedData,
        main = "Missed By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Code - General/MissedResults/MissedByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=missedData,
        main = "Missed By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Code - General/MissedResults/MissedByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=missedData,
        main = "Missed By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
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

for(filename in Sys.glob("Code - General/FalseResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  #print(filename)
  
  algo_name <- str_sub(filename,39,50) # get application name
  app_name <- str_sub(filename,-5,-5) # get application name
  
  for (i in 1:12){
    for (j in 1:10){
      
      de<-data.frame(table[i,j],paste("Scenario", i, sep=" "), phones[j], algorithms[which(algos==algo_name)], applications[as.numeric(app_name)])
      names(de)<-c("accuracy","scenario", "phone","algorithm","application")
      falseData <- rbind(falseData, de)
      
    }
  }
}

missedData[missedData==0]<-NA

# Plot by algorithm
# -----------------
png(file="Code - General/FalseResults/FalseByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=falseData,
        main = "False By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Code - General/FalseResults/FalseByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=falseData,
        main = "False By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Code - General/FalseResults/FalseByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=falseData,
        main = "False By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Code - General/FalseResults/FalseByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=falseData,
        main = "False By Phone",
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
  #print(filename)
  
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
        log = "y")
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
        log = "y")
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
        log = "y")
dev.off()

# Combine data into one file
fullData <- cbind(dataaa$time, dataa)
names(fullData)[names(fullData) == "dataaa$time"] <- "time"

fullData <- cbind(missedData$accuracy, fullData)
names(fullData)[names(fullData) == "missedData$accuracy"] <- "missed"

fullData <- cbind(falseData$accuracy, fullData)
names(fullData)[names(fullData) == "falseData$accuracy"] <- "false"

# Detailed plots
# --------------
ggplot(fullData[fullData$algorithm %in% c("AMM",  "FastHMM_AStar", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=algorithm, y=accuracy, fill=scenario)) +
  geom_boxplot(outlier.shape = NA) +
  labs(title="Accuracy by Algorithm", x ="Algorithm", y = "Accuracy (%)", fill = "Scenarios") +
  theme(plot.title = element_text(hjust = 0.5))
ggsave("Code - General/Plots/AccuracyByAlgorithmByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("AMM",  "FastHMM_AStar", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=algorithm, y=time, fill=scenario)) +
  geom_boxplot(outlier.shape = NA) +
  labs(title="Time by Algorithm", x ="Algorithm", y = "Time (s)", fill = "Scenarios") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(trans='log10')
ggsave("Code - General/Plots/TimeByAlgorithmByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("AMM",  "FastHMM_AStar", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=time, y=accuracy, color=algorithm)) +
  geom_point(alpha=0.6) +
  labs(title="Time vs Algorithm", x ="Time (s)", y = "Accuracy (%)", colour = "Algorithms") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(trans='log10') +
  scale_colour_manual(values=c("#F8766D", "#CCCCCC", "#A3A500", "#00BF7D", "#00B0F6", "#E76BF3"))
ggsave("Code - General/Plots/TimeVsAccuracy.pdf", width = 12, height = 7, units = "in")

p4 <- ggplot(fullData[fullData$algorithm %in% c("AMM", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=accuracy, y=false, color=algorithm)) +
      geom_point(alpha=0.6,size=1) +
      labs(title="False vs Accuracy", x ="Accuracy (%)", y = "False (%)", colour = "Algorithms") +
      theme(plot.title = element_text(hjust = 0.5))
p5 <- ggplot(fullData[fullData$algorithm %in% c("AMM", "FastHMM_AStarBi", "ViterbiHMM","TMM","HyMM") ,], aes(x=accuracy, y=missed, color=algorithm)) +
      geom_point(alpha=0.6, size=1) +
      labs(title="Missed vs Accuracy", x ="Accuracy (%)", y = "Missed (%)", colour = "Algorithms") +
      theme(plot.title = element_text(hjust = 0.5)) 
ggsave("Code - General/Plots/MissedAndFalseVsAccuracy.pdf", arrangeGrob(grobs=list(p4, p5),nrow=1,ncol=2), width = 12, height = 7, units = "in")


  