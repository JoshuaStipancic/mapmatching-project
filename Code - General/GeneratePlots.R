library(here)
library(stringr)

# Clear the current workspace and set the working directory
rm(list=ls())
setwd(here("mapmatching-project"))

######################################################
# ACCURACY
######################################################

# Define algorithm vectors
# ------------------------
Algo1 <- vector()
Algo2a <- vector()
Algo2b <- vector()
Algo2c <- vector()
Algo2d <- vector()
Algo3 <- vector()
Algo4 <- vector()
Algo5 <- vector()

# Define application vectors
# --------------------------
App1 <- vector()
App2 <- vector()
App3 <- vector()

# Define scenario vectors
# -----------------------
Scen1 <- vector()
Scen2 <- vector()
Scen3 <- vector()
Scen4 <- vector()
Scen5 <- vector()
Scen6 <- vector()
Scen7 <- vector()
Scen8 <- vector()
Scen9 <- vector()
Scen10 <- vector()
Scen11 <- vector()
Scen12 <- vector()

# Define phone vectors
# --------------------
Phone1 <- vector()
Phone2 <- vector()
Phone3 <- vector()
Phone4 <- vector()
Phone5 <- vector()
Phone6 <- vector()
Phone7 <- vector()
Phone8 <- vector()
Phone9 <- vector()
Phone10 <- vector()

for(filename in Sys.glob("Code - General/AccuracyResults/*.csv"))
{
  
  # Read one file
  table <- read.csv(filename, header=F)
  print(filename)
  
  # Data by algorithm
  # -----------------
  algo_name <- str_sub(filename,42,53) # get application name

  if (algo_name == "1_Applicatio") {
    Algo1 <- c(Algo1, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name ==  "2_astar_Appl") {
    Algo2a <- c(Algo2a, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "2_astarbi_Ap") {
    Algo2b <- c(Algo2d, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "2_dijkstra_A") {
    Algo2c <- c(Algo2c, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "2_dijkstrabi") {
    Algo2d <- c(Algo2d, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "3_Applicatio") {
    Algo3 <- c(Algo3, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "4_Applicatio") {
    Algo4 <- c(Algo4, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else {
    Algo5 <- c(Algo5, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  }  
  
  # Data by application
  # -------------------
  app_name <- str_sub(filename,-5,-5) # get application name
    
  if (app_name == "1") {
    App1 <- c(App1, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (app_name == "2") {
    App2 <- c(App2, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else {
    App3 <- c(App3, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  }
  
  # Data by scenario
  # ----------------
  Scen1 <- c(Scen1, table[1,])
  Scen2 <- c(Scen2, table[2,])
  Scen3 <- c(Scen3, table[3,])
  Scen4 <- c(Scen4, table[4,])
  Scen5 <- c(Scen5, table[5,])
  Scen6 <- c(Scen6, table[6,])
  Scen7 <- c(Scen7, table[7,])
  Scen8 <- c(Scen8, table[8,])
  Scen9 <- c(Scen9, table[9,])
  Scen10 <- c(Scen10, table[10,])
  Scen11 <- c(Scen11, table[11,])
  Scen12 <- c(Scen12, table[12,])

  # Data by phone
  # -------------
  Phone1 <- c(Phone1, table[,1])
  Phone2 <- c(Phone2, table[,2])
  Phone3 <- c(Phone3, table[,3])
  Phone4 <- c(Phone4, table[,4])
  Phone5 <- c(Phone5, table[,5])
  Phone6 <- c(Phone6, table[,6])
  Phone7 <- c(Phone7, table[,7])
  Phone8 <- c(Phone8, table[,8])
  Phone9 <- c(Phone9, table[,9])
  Phone10 <- c(Phone10, table[,10])
  
}

# Plot by algorithm
# -----------------
Algo1[Algo1 == 0] <- NA
AMM <- unlist(Algo1)
Algo2a[Algo2a == 0] <- NA
FastHMM_AStar <- unlist(Algo2a)
Algo2b[Algo2b == 0] <- NA
FastHMM_AStarBi <- unlist(Algo2b)
Algo2c[Algo2c == 0] <- NA
FastHMM_Dijkstra <- unlist(Algo2c)
Algo2d[Algo2d == 0] <- NA
FastHMM_DijkstraBi <- unlist(Algo2d)
Algo3[Algo3 == 0] <- NA
ViterbiHMM <- unlist(Algo3)
Algo4[Algo4 == 0] <- NA
TMM <- unlist(Algo4)
Algo5[Algo5 == 0] <- NA
HyMM <- unlist(Algo5)

png(file="Code - General/AccuracyResults/AccuracyByAlgorithm.png",
    width=1200, height=700)
z <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Accuracy By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
App1[App1 == 0] <- NA
GPSTracker <- unlist(App1)
App2[App2 == 0] <- NA
TrueMotion <- unlist(App2)
App3[App3 == 0] <- NA
AutoMerit <- unlist(App3)

png(file="Code - General/AccuracyResults/AccuracyByApplication.png",
    width=1200, height=700)
z <- c("GPSTracker", "TrueMotion", "AutoMerit")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Accuracy By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
Scen1[Scen1 == 0] <- NA
Scen1 <- unlist(Scen1)
Scen2[Scen2 == 0] <- NA
Scen2 <- unlist(Scen2)
Scen3[Scen3 == 0] <- NA
Scen3 <- unlist(Scen3)
Scen4[Scen4 == 0] <- NA
Scen4 <- unlist(Scen4)
Scen5[Scen5 == 0] <- NA
Scen5 <- unlist(Scen5)
Scen6[Scen6 == 0] <- NA
Scen6 <- unlist(Scen6)
Scen7[Scen7 == 0] <- NA
Scen7 <- unlist(Scen7)
Scen8[Scen8 == 0] <- NA
Scen8 <- unlist(Scen8)
Scen9[Scen9 == 0] <- NA
Scen9 <- unlist(Scen9)
Scen10[Scen10 == 0] <- NA
Scen10 <- unlist(Scen10)
Scen11[Scen11 == 0] <- NA
Scen11 <- unlist(Scen11)
Scen12[Scen12 == 0] <- NA
Scen12 <- unlist(Scen12)

png(file="Code - General/AccuracyResults/AccuracyByScenario.png",
    width=1200, height=700)
z <- c("Scen1", "Scen2", "Scen3", "Scen4", "Scen5", "Scen6", "Scen7", "Scen8", "Scen9", "Scen10", "Scen11", "Scen12")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Accuracy By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
Phone1[Phone1 == 0] <- NA
iPhoneSE <- unlist(Phone1)
Phone2[Phone2 == 0] <- NA
iPhone6S <- unlist(Phone2)
Phone3[Phone3 == 0] <- NA
iPhone7 <- unlist(Phone3)
Phone4[Phone4 == 0] <- NA
iPhone7Plus <- unlist(Phone4)
Phone5[Phone5 == 0] <- NA
iPhone8 <- unlist(Phone5)
Phone6[Phone6 == 0] <- NA
GalaxyS5 <- unlist(Phone6)
Phone7[Phone7 == 0] <- NA
GalaxyS7 <- unlist(Phone7)
Phone8[Phone8 == 0] <- NA
GalaxyS8 <- unlist(Phone8)
Phone9[Phone9 == 0] <- NA
LGG6 <- unlist(Phone9)
Phone10[Phone10 == 0] <- NA
Pixel2 <- unlist(Phone10)

png(file="Code - General/AccuracyResults/AccuracyByPhone.png",
    width=1200, height=700)
z <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Accuracy By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# TIME
######################################################

# Define algorithm vectors
# ------------------------
Algo1 <- vector()
Algo2a <- vector()
Algo2b <- vector()
Algo2c <- vector()
Algo2d <- vector()
Algo3 <- vector()
Algo4 <- vector()
Algo5 <- vector()

# Define application vectors
# --------------------------
App1 <- vector()
App2 <- vector()
App3 <- vector()

# Define scenario vectors
# -----------------------
Scen1 <- vector()
Scen2 <- vector()
Scen3 <- vector()
Scen4 <- vector()
Scen5 <- vector()
Scen6 <- vector()
Scen7 <- vector()
Scen8 <- vector()
Scen9 <- vector()
Scen10 <- vector()
Scen11 <- vector()
Scen12 <- vector()

# Define phone vectors
# --------------------
Phone1 <- vector()
Phone2 <- vector()
Phone3 <- vector()
Phone4 <- vector()
Phone5 <- vector()
Phone6 <- vector()
Phone7 <- vector()
Phone8 <- vector()
Phone9 <- vector()
Phone10 <- vector()

for(filename in Sys.glob("Code - General/TimeResults/*.csv"))
{

  # Read one file
  table <- read.csv(filename, header=F)
  print(filename)

  # Data by algorithm
  # -----------------
  algo_name <- str_sub(filename,38,49) # get application name

  if (algo_name == "1_Applicatio") {
    Algo1 <- c(Algo1, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name ==  "2_astar_Appl") {
    Algo2a <- c(Algo2a, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "2_astarbi_Ap") {
    Algo2b <- c(Algo2d, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "2_dijkstra_A") {
    Algo2c <- c(Algo2c, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "2_dijkstrabi") {
    Algo2d <- c(Algo2d, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "3_Applicatio") {
    Algo3 <- c(Algo3, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (algo_name == "4_Applicatio") {
    Algo4 <- c(Algo4, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else {
    Algo5 <- c(Algo5, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  }

  # Data by application
  # -------------------
  app_name <- str_sub(filename,-5,-5) # get application name

  if (app_name == "1") {
    App1 <- c(App1, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else if (app_name == "2") {
    App2 <- c(App2, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  } else {
    App3 <- c(App3, table[,1], table[,2], table[,3], table[,4], table[,5], table[,6], table[,7], table[,8], table[,9], table[,10])
  }

  # Data by scenario
  # ----------------
  Scen1 <- c(Scen1, table[1,])
  Scen2 <- c(Scen2, table[2,])
  Scen3 <- c(Scen3, table[3,])
  Scen4 <- c(Scen4, table[4,])
  Scen5 <- c(Scen5, table[5,])
  Scen6 <- c(Scen6, table[6,])
  Scen7 <- c(Scen7, table[7,])
  Scen8 <- c(Scen8, table[8,])
  Scen9 <- c(Scen9, table[9,])
  Scen10 <- c(Scen10, table[10,])
  Scen11 <- c(Scen11, table[11,])
  Scen12 <- c(Scen12, table[12,])

  # Data by phone
  # -------------
  Phone1 <- c(Phone1, table[,1])
  Phone2 <- c(Phone2, table[,2])
  Phone3 <- c(Phone3, table[,3])
  Phone4 <- c(Phone4, table[,4])
  Phone5 <- c(Phone5, table[,5])
  Phone6 <- c(Phone6, table[,6])
  Phone7 <- c(Phone7, table[,7])
  Phone8 <- c(Phone8, table[,8])
  Phone9 <- c(Phone9, table[,9])
  Phone10 <- c(Phone10, table[,10])

}

# Plot by algorithm
# -----------------
Algo1[Algo1 == 0] <- NA
AMM <- unlist(Algo1)
Algo2a[Algo2a == 0] <- NA
FastHMM_AStar <- unlist(Algo2a)
Algo2b[Algo2b == 0] <- NA
FastHMM_AStarBi <- unlist(Algo2b)
Algo2c[Algo2c == 0] <- NA
FastHMM_Dijkstra <- unlist(Algo2c)
Algo2d[Algo2d == 0] <- NA
FastHMM_DijkstraBi <- unlist(Algo2d)
Algo3[Algo3 == 0] <- NA
ViterbiHMM <- unlist(Algo3)
Algo4[Algo4 == 0] <- NA
TMM <- unlist(Algo4)
Algo5[Algo5 == 0] <- NA
HyMM <- unlist(Algo5)

png(file="Code - General/TimeResults/TimeByAlgorithm.png",
    width=1200, height=700)
z <- c("AMM", "FastHMM_AStar", "FastHMM_AStarBi", "FastHMM_Dijkstra", "FastHMM_DijkstraBi", "ViterbiHMM","TMM","HyMM")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Time By Algorithm",
        xlab = "Algorithm",
        ylab = "Time (s)",
        col = "purple",
        #ylim = c(0,1000),
        log = "y")
dev.off()

# Plot by application
# -------------------
App1[App1 == 0] <- NA
GPSTracker <- unlist(App1)
App2[App2 == 0] <- NA
TrueMotion <- unlist(App2)
App3[App3 == 0] <- NA
AutoMerit <- unlist(App3)

png(file="Code - General/TimeResults/TimeByApplication.png",
    width=1200, height=700)
z <- c("GPSTracker", "TrueMotion", "AutoMerit")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Time By Application",
        xlab = "Application",
        ylab = "Time (s)",
        col = "light green",
        ylim = c(0,20))
dev.off()

# Plot by scenario
# ----------------
Scen1[Scen1 == 0] <- NA
Scen1 <- unlist(Scen1)
Scen2[Scen2 == 0] <- NA
Scen2 <- unlist(Scen2)
Scen3[Scen3 == 0] <- NA
Scen3 <- unlist(Scen3)
Scen4[Scen4 == 0] <- NA
Scen4 <- unlist(Scen4)
Scen5[Scen5 == 0] <- NA
Scen5 <- unlist(Scen5)
Scen6[Scen6 == 0] <- NA
Scen6 <- unlist(Scen6)
Scen7[Scen7 == 0] <- NA
Scen7 <- unlist(Scen7)
Scen8[Scen8 == 0] <- NA
Scen8 <- unlist(Scen8)
Scen9[Scen9 == 0] <- NA
Scen9 <- unlist(Scen9)
Scen10[Scen10 == 0] <- NA
Scen10 <- unlist(Scen10)
Scen11[Scen11 == 0] <- NA
Scen11 <- unlist(Scen11)
Scen12[Scen12 == 0] <- NA
Scen12 <- unlist(Scen12)

png(file="Code - General/TimeResults/TimeByScenario.png",
    width=1200, height=700)
z <- c("Scen1", "Scen2", "Scen3", "Scen4", "Scen5", "Scen6", "Scen7", "Scen8", "Scen9", "Scen10", "Scen11", "Scen12")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Time By Scenario",
        xlab = "Scenarios",
        ylab = "Time (s)",
        col = "orange",
        ylim = c(0,20))
dev.off()

# Plot by phone
# -------------
Phone1[Phone1 == 0] <- NA
iPhoneSE <- unlist(Phone1)
Phone2[Phone2 == 0] <- NA
iPhone6S <- unlist(Phone2)
Phone3[Phone3 == 0] <- NA
iPhone7 <- unlist(Phone3)
Phone4[Phone4 == 0] <- NA
iPhone7Plus <- unlist(Phone4)
Phone5[Phone5 == 0] <- NA
iPhone8 <- unlist(Phone5)
Phone6[Phone6 == 0] <- NA
GalaxyS5 <- unlist(Phone6)
Phone7[Phone7 == 0] <- NA
GalaxyS7 <- unlist(Phone7)
Phone8[Phone8 == 0] <- NA
GalaxyS8 <- unlist(Phone8)
Phone9[Phone9 == 0] <- NA
LGG6 <- unlist(Phone9)
Phone10[Phone10 == 0] <- NA
Pixel2 <- unlist(Phone10)

png(file="Code - General/TimeResults/TimeByPhone.png",
    width=1200, height=700)
z <- c("iPhoneSE", "iPhone6S", "iPhone7", "iPhone7Plus", "iPhone8", "GalaxyS5", "GalaxyS7", "GalaxyS8", "LGG6", "Pixel2")
dataList <- lapply(z, get, envir=environment())
names(dataList) <- z
boxplot(dataList,
        main = "Time By Phone",
        xlab = "Phones",
        ylab = "Time (s)",
        col = "light blue",
        ylim = c(0,20))
dev.off()