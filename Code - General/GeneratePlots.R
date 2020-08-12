library(stringr)
library(ggplot2)
library(gridExtra)

# Clear the current workspace and set the working directory
setwd(here())
fullData <- read.csv("Results/full_data.csv")

######################################################
# ACCURACY
######################################################

# Plot by algorithm
# -----------------
png(file="Results/AccuracyResults/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=fullData,
        main = "Accuracy By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/AccuracyResults/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=fullData,
        main = "Accuracy By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/AccuracyResults/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=fullData,
        main = "Accuracy By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/AccuracyResults/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=fullData,
        main = "Accuracy By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# DISTANCE CORRECT
######################################################

# Plot by algorithm
# -----------------
png(file="Results/DistCorrect/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=fullData,
        main = "Distance-Weighted % Correct By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/DistCorrect/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=fullData,
        main = "Distance-Weighted % Correct By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/DistCorrect/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=fullData,
        main = "Distance-Weighted % Correct By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/DistCorrect/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=fullData,
        main = "Distance-Weighted % Correct By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# DISTANCE MISSED
######################################################

# Plot by algorithm
# -----------------
png(file="Results/DistMissed/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=fullData,
        main = "Distance-Weighted % Missed By Algorithm",
        xlab = "Algorithm",
        ylab = "Missed (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/DistMissed/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=fullData,
        main = "Distance-Weighted % Missed By Application",
        xlab = "Application",
        ylab = "Missed (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/DistMissed/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=fullData,
        main = "Distance-Weighted % Missed By Scenario",
        xlab = "Scenarios",
        ylab = "Missed (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/DistCorrect/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=fullData,
        main = "Distance-Weighted % Missed By Phone",
        xlab = "Phones",
        ylab = "Missed (%)",
        col = "light blue")
dev.off()

######################################################
# DISTANCE FALSE
######################################################

# Plot by algorithm
# -----------------
png(file="Results/DistFalse/AccuracyByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=fullData,
        main = "Distance-Weighted % False By Algorithm",
        xlab = "Algorithm",
        ylab = "Accuracy (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/DistFalse/AccuracyByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=fullData,
        main = "Distance-Weighted % False By Application",
        xlab = "Application",
        ylab = "Accuracy (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/DistFalse/AccuracyByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=fullData,
        main = "Distance-Weighted % False By Scenario",
        xlab = "Scenarios",
        ylab = "Accuracy (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/DistFalse/AccuracyByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=fullData,
        main = "Distance-Weighted % False By Phone",
        xlab = "Phones",
        ylab = "Accuracy (%)",
        col = "light blue")
dev.off()

######################################################
# MISSED
######################################################

# Plot by algorithm
# -----------------
png(file="Results/MissedResults/MissedByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=fullData,
        main = "Missed By Algorithm",
        xlab = "Algorithm",
        ylab = "Missed (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/MissedResults/MissedByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=fullData,
        main = "Missed By Application",
        xlab = "Application",
        ylab = "Missed (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/MissedResults/MissedByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=fullData,
        main = "Missed By Scenario",
        xlab = "Scenarios",
        ylab = "Missed (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/MissedResults/MissedByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=fullData,
        main = "Missed By Phone",
        xlab = "Phones",
        ylab = "Missed (%)",
        col = "light blue")
dev.off()

######################################################
# FALSE
######################################################

# Plot by algorithm
# -----------------
png(file="Results/FalseResults/FalseByAlgorithm.png", width=1200, height=700)
boxplot(accuracy~algorithm,
        data=fullData,
        main = "False By Algorithm",
        xlab = "Algorithm",
        ylab = "False (%)",
        col = "purple")
dev.off()

# Plot by application
# -------------------
png(file="Results/FalseResults/FalseByApplication.png", width=1200, height=700)
boxplot(accuracy~application,
        data=fullData,
        main = "False By Application",
        xlab = "Application",
        ylab = "False (%)",
        col = "light green")
dev.off()

# Plot by scenario
# ----------------
png(file="Results/FalseResults/FalseByScenario.png", width=1200, height=700)
boxplot(accuracy~scenario,
        data=fullData,
        main = "False By Scenario",
        xlab = "Scenarios",
        ylab = "False (%)",
        col = "orange")
dev.off()

# Plot by phone
# -------------
png(file="Results/FalseResults/FalseByPhone.png",  width=1200, height=700)
boxplot(accuracy~phone,
        data=fullData,
        main = "False By Phone",
        xlab = "Phones",
        ylab = "False (%)",
        col = "light blue")
dev.off()

######################################################
# TIME
######################################################

# Plot by algorithm
# -----------------
png(file="Results/TimeResults/TimeByAlgorithm.png", width=1200, height=700)
boxplot(time~algorithm,
        data=fullData,
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
        data=fullData,
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
        data=fullData,
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
        data=fullData,
        main = "Time By Phone",
        xlab = "Phones",
        ylab = "Time (s)",
        col = "light blue",
        log = "y")
dev.off()

######################################################
# ARTICLE PLOTS
######################################################
dir.create("Results/Plots")

theme_set(theme_bw()+theme(text = element_text(family = "Times", size=16), axis.text.x = element_text(angle = 90), plot.title = element_text(hjust = 0.5))) #legend.position = "none"))
fullData$scenario <- factor(fullData$scenario, levels=c("Scenario 1", "Scenario 2", "Scenario 3", "Scenario 4", "Scenario 5", "Scenario 6", "Scenario 7", "Scenario 8", "Scenario 9", "Scenario 10", "Scenario 11", "Scenario 12"))
fullData$application <- factor(fullData$application, levels=c("GPSTracker", "TrueMotion", "AutoMerit"))
fullData$algorithm <- factor(fullData$algorithm, levels=c("FMM","FastHMM (AStar)", "FastHMM (AStarBi)", "FastHMM (Dijkstra)", "FastHMM (DijkstraBi)", "StandardHMM", "TMM", "HyMM"))

myColours <-ifelse(levels(fullData$algorithm)=="FMM", "#F8766D",
            ifelse(levels(fullData$algorithm)=="StandardHMM", "#E76BF3",
            ifelse(levels(fullData$algorithm)=="TMM", "#00B0F6",
            ifelse(levels(fullData$algorithm)=="HyMM", "#00BF7D", "#A3A500"))))

# FIGURE 4
# --------
ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=scenario, y=accuracy, group=algorithm, color=algorithm)) +
  stat_summary(fun.y="mean", geom="line", size=2) +
  #stat_summary(fun.data = mean_se, geom = "errorbar") + 
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D")) +
  labs(title="Average Accuracy by Scenario", x ="Scenario", y = "Average Accuracy (%)", colour = "Algorithms")
ggsave("Results/Plots/AverageAccuracyByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=application, y=accuracy, group=algorithm, color=algorithm)) +
  stat_summary(fun.y="mean", geom="line", size=2) +
  #stat_summary(fun.data = mean_se, geom = "errorbar") + 
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D")) +
  labs(title="Average Accuracy by Application", x ="Application", y = "Average Accuracy (%)", colour = "Algorithms")
ggsave("Results/Plots/AverageAccuracyByApplication.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=scenario, y=missed, group=algorithm, color=algorithm)) +
  stat_summary(fun.y="mean", geom="line", size=2) +
  #stat_summary(fun.data = mean_se, geom = "errorbar") + 
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D")) +
  labs(title="Average Missed by Scenario", x ="Scenario", y = "Average Missed (%)", colour = "Algorithms")
ggsave("Results/Plots/AverageMissedByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=application, y=missed, group=algorithm, color=algorithm)) +
  stat_summary(fun.y="mean", geom="line", size=2) +
  #stat_summary(fun.data = mean_se, geom = "errorbar") + 
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D")) +
  labs(title="Average Missed by Application", x ="Application", y = "Average Missed (%)", colour = "Algorithms")
ggsave("Results/Plots/AverageMissedByApplication.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=scenario, y=false, group=algorithm, color=algorithm)) +
  stat_summary(fun.y="mean", geom="line", size=2) +
  #stat_summary(fun.data = mean_se, geom = "errorbar") + 
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D")) +
  labs(title="Average False by Scenario", x ="Scenario", y = "Average False (%)", colour = "Algorithms")
ggsave("Results/Plots/AverageFalseByScenario.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=application, y=false, group=algorithm, color=algorithm)) +
  stat_summary(fun.y="mean", geom="line", size=2) +
  #stat_summary(fun.data = mean_se, geom = "errorbar") + 
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D")) +
  labs(title="Average False by Application", x ="Application", y = "Average False (%)", colour = "Algorithms")
ggsave("Results/Plots/AverageFalseByApplication.pdf", width = 12, height = 7, units = "in")

# FIGURE 5
# --------
ggplot(fullData, aes(x=phone, y=missed, fill=phone)) +
  geom_boxplot() +
  scale_fill_manual(values=c("#E69F00","#E69F00","#E69F00", "#56B4E9","#56B4E9","#56B4E9","#56B4E9","#56B4E9","#E69F00","#E69F00")) +
  labs(title="Missed by Phones", x ="Phones", y = "Missed (%)") +
  theme(legend.position = "none")
ggsave("Results/Plots/MissedByPhones.pdf", width = 12, height = 7, units = "in")

# FIGURE 6
# --------
ggplot(fullData, aes(x=algorithm, y=time)) +
  geom_boxplot(fill=myColours) +
  labs(title="Time by Algorithms", x ="Algorithms", y = "Time (s)") +   scale_y_continuous(trans='log10')
ggsave("Results/Plots/TimeByAlgorithms.pdf", width = 12, height = 7, units = "in")

# FIGURE 7
# --------
ggplot(fullData[fullData$algorithm %in% c("FMM",  "FastHMM (AStar)", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=time, y=accuracy, color=algorithm)) +
  geom_point(alpha=0.2) +
  stat_ellipse() +
  theme(axis.text.x = element_text(angle = 0)) +
  labs(title="Time vs Accuracy", x ="Time (s)", y = "Accuracy (%)", colour = "Algorithms") +
  scale_x_continuous(trans='log10') +
  scale_colour_manual(values=c("#F8766D", "#CCCCCC", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D"))
ggsave("Results/Plots/TimeVsAccuracy.pdf", width = 12, height = 7, units = "in")

ggplot(fullData[fullData$algorithm %in% c("FMM", "FastHMM (AStarBi)", "StandardHMM","TMM","HyMM") ,], aes(x=missed, y=false, color=algorithm)) +
  geom_point(alpha=0.2) +
  stat_ellipse() +
  theme(axis.text.x = element_text(angle = 0)) +
  labs(title="% Missed vs % False", x ="Missed (%)", y = "False (%)", colour = "Algorithms") +
  scale_x_reverse() + scale_y_reverse() +
  scale_colour_manual(values=c("#F8766D", "#A3A500","#E76BF3", "#00B0F6", "#00BF7D"))
ggsave("Results/Plots/MissedVsFalse.pdf", width = 12, height = 7, units = "in")
