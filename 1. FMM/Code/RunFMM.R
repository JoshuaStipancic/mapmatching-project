# Load the required libraries
library(trajectories)
library(spacetime)
library(rgdal)
library(rgeos)
library(sp)
library(readxl)
library(rJava)
library(xlsx)
library(anytime)
library(osmar)
library(frbs)
library(geosphere)
library(dplyr)
library(maptools)
library(here)
library(stringr)

# Clear the current workspace and set the working directory
setwd(here())

# Source the required R code
source("1. AMM/Code/Data-track.R")
source("1. AMM/Code/DRN.R")
source("1. AMM/Code/fuzzy_model.R")
source("1. AMM/Code/fuzzyMM.R")
source("1. AMM/Code/fuzzyMM-package.R")
source("1. AMM/Code/IMP.R")
source("1. AMM/Code/SMP1.R")
source("1. AMM/Code/SMP2.R")
source("1. AMM/Code/var_bounds.R")
source("1. AMM/Code/FIS1.R")
source("1. AMM/Code/FIS2.R")
source("1. AMM/Code/FIS3.R")

#################################
# Run code for True Motion data #
#################################

# for(filename in Sys.glob("Data/*/*/2True motion/*.xlsx"))
# {
# 
#   # Read one file
#   trip <- read_xlsx(filename)
#   trip <- head(trip,length(as.numeric(unlist(trip[6]))))
# 
#   # Convert datetime to proper format
#   time <- as.numeric(unlist(trip[5]))
#   datetime  <-  as.POSIXct(as.numeric(time), origin='1970-01-01')
# 
#   # Define data structure
#   mydf <- structure(list(id =              as.numeric(unlist(trip[6])),
#                          time=             datetime,
#                          longitude =       as.numeric(unlist(trip[6])),
#                          latitude =        as.numeric(unlist(trip[3])),
#                          GPS.Speed =       3.6*as.numeric(unlist(trip[7])),
#                          GPS.Bearing =     as.numeric(unlist(trip[1])),
#                          GPS.HDOP =        0.1*as.numeric(unlist(trip[8]))), # horizontal dilution of precision
#                     .Names = c("id","time","coords.x1","coords.x2","GPS.Speed","GPS.Bearing","GPS.HDOP"),
#                     class = "data.frame",row.names = c(NA, -length(as.numeric(unlist(trip[6])))))
# 
#   # Generate the spatial points data frame
#   spdf <- SpatialPointsDataFrame(coords = mydf[,c(3,4)], data = mydf,
#                                  proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
# 
#   # Adjust map matching parameters
#   get_var_bounds()
#   set_var_bounds("dist_err_large", c(10, 25))
#   set_var_bounds("speed_high", c(3, 6))
#   set_var_bounds("HE_large", c(25,60))
# 
#   fis_imp <- get_fis("IMP")
#   str(fis_imp)
#   fis_imp$varinp.mf
# 
#   # Generate map matching results and figures
#   par(mar=c(1,1,1,1))
# 
#   start_time <- Sys.time()
# 
#   flag <- TRUE
#   matched_traj <- tryCatch(mm(spdf, plot = FALSE), error=function(e) flag<<-FALSE)
#   if (!flag) next
# 
#   # Calculation of run time for trip
#   end_time <- Sys.time()
#   Time_T <- unclass(end_time) - unclass(start_time)
# 
#   # Format results
#   results = list(matched_traj@data[7],
#                  matched_traj@data[6],
#                  matched_traj@data[8])
# 
#   # Create a list of only OSM IDs
#   osm_ids = unlist(results[3])
#   results_new = list()
#   i <- 1
# 
#   # Loop through each observation
#   # If the current link is different from the previous link, add the current link to the output list
#   while (i < length(osm_ids)){
#     if (osm_ids[i] != osm_ids[i+1]){
#       results_new = append(results_new, osm_ids[i])
#     }
#     i = i + 1
#   }
# 
#   # Find first and last "/" in filename
#   first = unlist(gregexpr("/", filename))[1]
#   last = unlist(gregexpr("/", filename))[length(unlist(gregexpr("/", filename)))]
# 
#   # Generate the filepath and output filename
#   filepath = file.path("1. AMM/Results", substring(filename, first + 1, last))
#   output = substring(filename, unlist(gregexpr("/", filename))[length(unlist(gregexpr("/", filename)))]+1)
#   output = str_replace(output, ".xlsx", ".csv")
#     
#   # Create the directory (if necessary) and save the output files
#   dir.create(filepath, recursive=TRUE)
#   # Regular output
#   write.table(results_new, file = file.path(filepath, output), sep="\n",  col.names=FALSE, row.names=FALSE)
#   # Full output
#   write.table(results, file = file.path(filepath, str_replace(output, ".csv", "_full.csv")), sep=",",  col.names=FALSE)
# 
#   # Format and ouput run time results
#   write(Time_T,file.path(filepath, str_replace(output, ".csv", "_time.txt")))
# }

###############################
# Run code for AutoMerit data #
###############################
 
# for(filename in Sys.glob("Data/*/*/3AutoMerit/*.xlsx"))
# {
# 
#   # Read one file
#   trip <- read_xlsx(filename)
#   trip <- head(trip,length(as.numeric(unlist(trip[6]))))
# 
#   # Convert datetime to proper format
#   time <- as.numeric(strptime(unlist(trip[2]), format="%Y-%m-%dT%H:%M:%OSZ"))
#   datetime <- as.POSIXct(as.numeric(time), origin='1970-05-03')
# 
#   # Define data structure
#   mydf <- structure(list(id =              as.numeric(unlist(trip[1])),
#                          time=             datetime,
#                          longitude =       as.numeric(unlist(trip[4])),
#                          latitude =        as.numeric(unlist(trip[3])),
#                          GPS.Speed =       3.6*as.numeric(unlist(trip[6])),
#                          GPS.Bearing =     as.numeric(unlist(trip[8])),
#                          GPS.HDOP =        matrix(1, length(as.numeric(unlist(trip[6]))), 1)), # horizontal dilution of precision
#                     .Names = c("id","time","coords.x1","coords.x2","GPS.Speed","GPS.Bearing","GPS.HDOP"),
#                     class = "data.frame",row.names = c(NA, -length(as.numeric(unlist(trip[6])))))
# 
#   # Generate the spatial points data frame
#   spdf <- SpatialPointsDataFrame(coords = mydf[,c(3,4)], data = mydf,
#                                  proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))
# 
#   # Adjust map matching parameters
#   get_var_bounds()
#   set_var_bounds("dist_err_large", c(10, 25))
#   set_var_bounds("speed_high", c(3, 6))
#   set_var_bounds("HE_large", c(25,60))
# 
#   fis_imp <- get_fis("IMP")
#   str(fis_imp)
#   fis_imp$varinp.mf
# 
#   # Generate map matching results and figures
#   par(mar=c(1,1,1,1))
# 
#   start_time <- Sys.time()
# 
#   flag <- TRUE
#   matched_traj <- tryCatch(mm(spdf, plot = FALSE), error=function(e) flag<<-FALSE)
#   if (!flag) next
# 
#   # Calculation of run time for trip
#   end_time <- Sys.time()
#   Time_T <- unclass(end_time) - unclass(start_time)
# 
#   # Format results
#   results = list(matched_traj@data[7],
#                  matched_traj@data[6],
#                  matched_traj@data[8])
# 
#   # Create a list of only OSM IDs
#   osm_ids = unlist(results[3])
#   results_new = list()
#   i <- 1
# 
#   # Loop through each observation
#   # If the current link is different from the previous link, add the current link to the output list
#   while (i < length(osm_ids)){
#     if (osm_ids[i] != osm_ids[i+1]){
#       results_new = append(results_new, osm_ids[i])
#     }
#     i = i + 1
#   }
# 
#   # Find first and last "/" in filename
#   first = unlist(gregexpr("/", filename))[1]
#   last = unlist(gregexpr("/", filename))[length(unlist(gregexpr("/", filename)))]
# 
#   # Generate the filepath and output filename
#   filepath = file.path("1. AMM/Results", substring(filename, first + 1, last))
#   output = substring(filename, unlist(gregexpr("/", filename))[length(unlist(gregexpr("/", filename)))]+1)
#   output = str_replace(output, ".xlsx", ".csv")
# 
#   # Create the directory (if necessary) and save the output files
#   dir.create(filepath, recursive=TRUE)
#   # Regular output
#   write.table(results_new, file = file.path(filepath, output), sep="\n",  col.names=FALSE, row.names=FALSE)
#   # Full output
#   write.table(results, file = file.path(filepath, str_replace(output, ".csv", "_full.csv")), sep=",",  col.names=FALSE)
# 
#   # Format and ouput run time results
#   write(Time_T,file.path(filepath, str_replace(output, ".csv", "_time.txt")))
# }

#####################################
# Run code for GPS Tracker App data #
#####################################

for (filename in Sys.glob("Data/*/*/1GPS-Tracker_APP/*.csv"))
{

  # Read one file
  trip <- read.csv(filename)
  trip <- head(trip,length(as.numeric(unlist(trip[4]))))

  # Convert datetime to proper format
  time <- as.numeric(strptime(unlist(trip[2]), format="%d/%m/%Y %H:%M"))
  datetime <- as.POSIXct(time, origin='1970-05-03')

  # Calculate speed from GPS positions
  Dis <- structure(list(id =              as.numeric(unlist(trip[4])),
                        time=             datetime,
                        longitude=        as.numeric(unlist(trip[4])),
                        latitude =        as.numeric(unlist(trip[3]))), # horizontal dilution of precision
                   .Names = c("id","time","longitude","latitude"),
                   class = "data.frame",row.names = c(NA, -length(as.numeric(unlist(trip[4])))))

  Distance = mutate(Dis,
                    Distance = distHaversine(cbind(longitude, latitude),
                                             cbind(lag(longitude), lag(latitude))))
  Distance[is.na(Distance)] <- 0
  speed = Distance[5]/13.33 # m/s

  # Calculate heading from GPS positions
  trackAngle <- function(xy) {
    angles <- abs(c(trackAzimuth(xy), 0) -
                    c(0, rev(trackAzimuth(xy[nrow(xy):1, ]))))
  }
  x <- cbind(Dis$longitude,Dis$latitude)
  heading = trackAngle(as.matrix(x))

  # Define data structure
  mydf <- structure(list(id =              as.numeric(unlist(trip[4])),
                         time=             datetime,
                         longitude=        as.numeric(unlist(trip[4])),
                         latitude =        as.numeric(unlist(trip[3])),
                         GPS.Speed =       3.6*speed$Distance,
                         GPS.Bearing =     heading,
                         GPS.HDOP =        matrix(1, length(as.numeric(unlist(trip[4]))), 1)),#Horizontal Dilution of precision
                    .Names = c("id","time","coords.x1","coords.x2","GPS.Speed","GPS.Bearing","GPS.HDOP"),
                    class = "data.frame",row.names = c(NA, -length(as.numeric(unlist(trip[4])))))

  # Generate the spatial points data frame
  spdf <- SpatialPointsDataFrame(coords = mydf[,c(3,4)], data = mydf,
                                 proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

  # Adjust map matching parameters
  get_var_bounds()
  set_var_bounds("dist_err_large", c(10, 25))
  set_var_bounds("speed_high", c(3, 6))
  set_var_bounds("HE_large", c(25,60))

  fis_imp <- get_fis("IMP")
  str(fis_imp)
  fis_imp$varinp.mf

  # Generate map matching results and figures
  par(mar=c(1,1,1,1))

  start_time <- Sys.time()

  flag <- TRUE
  matched_traj <- tryCatch(mm(spdf, plot = FALSE), error=function(e) flag<<-FALSE)
  if (!flag) next

  # Calculation of run time for trip
  end_time <- Sys.time()
  Time_T <- unclass(end_time) - unclass(start_time)

  # Format results
  results = list(matched_traj@data[7],
                 matched_traj@data[6],
                 matched_traj@data[8])

  # Create a list of only OSM IDs
  osm_ids = unlist(results[3])
  results_new = list()
  i <- 1

  # Loop through each observation
  # If the current link is different from the previous link, add the current link to the output list
  while (i < length(osm_ids)){
    if (osm_ids[i] != osm_ids[i+1]){
      results_new = append(results_new, osm_ids[i])
    }
    i = i + 1
  }

  # Find first and last "/" in filename
  first = unlist(gregexpr("/", filename))[1]
  last = unlist(gregexpr("/", filename))[length(unlist(gregexpr("/", filename)))]

  # Generate the filepath and output filename
  filepath = file.path("1. AMM/Results", substring(filename, first + 1, last))
  output = substring(filename, unlist(gregexpr("/", filename))[length(unlist(gregexpr("/", filename)))]+1)

  # Create the directory (if necessary) and save the output files
  dir.create(filepath, recursive=TRUE)
  # Regular output
  write.table(results_new, file = file.path(filepath, output), sep="\n",  col.names=FALSE, row.names=FALSE)
  # Full output
  write.table(results, file = file.path(filepath, str_replace(output, ".csv", "_full.csv")), sep=",",  col.names=FALSE)

  # Format and ouput run time results
  write(Time_T,file.path(filepath, str_replace(output, ".csv", "_time.txt")))
}