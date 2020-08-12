library(here)
library(stringr)
library(ggplot2)
library(gridExtra)

# Clear the current workspace and set the working directory
setwd(here())
fullData <- read.csv("Results/full_data.csv")

# Signficant results for accuracy
algo_scen_acc <- aov(accuracy ~ algorithm*scenario, data = fullData)
algo_app_acc <- aov(accuracy ~ algorithm*application, data = fullData)
# Signficant results for missed
algo_scen_miss <- aov(missed ~ algorithm*scenario, data = fullData)
algo_app_miss <- aov(missed ~ algorithm*application, data = fullData)
phone_miss <- aov(missed ~ phone, data = fullData)
# Signficant results for false
algo_scen_false <- aov(false ~ algorithm*scenario, data = fullData)
algo_app_false <- aov(false ~ algorithm*application, data = fullData)
# Signficant results for time
algo_time <- aov(time ~ algorithm, data = fullData)

# Print table to console
sink("Results/ANOVA.txt")
writeLines("------------------------------------------------")
writeLines("Comparison Group          F            p-value  ")
writeLines("------------------------------------------------")
writeLines("ACCURACY")
writeLines("------------------------------------------------")
writeLines(paste("Algorithm x Scenario     ",format(summary(algo_scen_acc)[[1]][["F value"]][3],digits=4),"      ",format(summary(algo_scen_acc)[[1]][["Pr(>F)"]][3],digits=4)))
writeLines(paste("Algorithm x Application  ",format(summary(algo_app_acc)[[1]][["F value"]][3],digits=4),"       ",format(summary(algo_app_acc)[[1]][["Pr(>F)"]][3],digits=4)))
writeLines("------------------------------------------------")
writeLines("MISSED")
writeLines("------------------------------------------------")
writeLines(paste("Algorithm x Scenario     ", format(summary(algo_scen_miss)[[1]][["F value"]][3],digits=4),"      ", format(summary(algo_scen_miss)[[1]][["Pr(>F)"]][3],digits=4)))
writeLines(paste("Algorithm x Application  ", format(summary(algo_app_miss)[[1]][["F value"]][3],digits=4),"      ", format(summary(algo_app_miss)[[1]][["Pr(>F)"]][3],digits=4)))
writeLines(paste("Phones                   ", format(summary(phone_miss)[[1]][["F value"]][1],digits=4),"      ", format(summary(phone_miss)[[1]][["Pr(>F)"]][1],digits=4)))
writeLines("------------------------------------------------")
writeLines("FALSE")
writeLines("------------------------------------------------")
writeLines(paste("Algorithm x Scenario     ", format(summary(algo_scen_false)[[1]][["F value"]][3],digits=4),"      ", format(summary(algo_scen_false)[[1]][["Pr(>F)"]][3],digits=4)))
writeLines(paste("Algorithm x Application  ", format(summary(algo_app_false)[[1]][["F value"]][3],digits=4),"      ", format(summary(algo_app_false)[[1]][["Pr(>F)"]][3],digits=4)))
writeLines("------------------------------------------------")
writeLines("TIME")
writeLines("------------------------------------------------")
writeLines(paste("Algorithm                ", format(summary(algo_time)[[1]][["F value"]][1],digits=4),"      ", format(summary(algo_time)[[1]][["Pr(>F)"]][1],digits=4)))
writeLines("------------------------------------------------")
sink()