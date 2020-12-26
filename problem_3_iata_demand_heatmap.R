rm(list=ls())
#Loading the Libraries
install.packages(c("rnaturalearth", "rnaturalearthdata"))

library("cowplot")
library("googleway")
library("ggplot2")
library("rnaturalearth")
library("ggspatial")
library("rnaturalearthdata")
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
library("rgeos")
library("lubridate")
library("mapview")

#Input Data
options(scipen = 999)
setwd("C:/Users/ahmad/Desktop/Data Science role GBT")
theme_set(theme_bw())
GeoMap_Data <- read.csv("problem_3_iata_demand_heatmap.csv",header=TRUE)
str(GeoMap_Data)
#add year to the Input data framz
GeoMap_Data$start<-as.Date(GeoMap_Data$start,"%d-%m-%Y")
GeoMap_Data$year <-year(GeoMap_Data$start)
str(GeoMap_Data)

#Selecting 2019 2020 data from the Dataset
GeoMap_Data_2019<-sqldf("Select start,IATA,PNRs,Lat,Long from GeoMap_Data where Year='2019'")
GeoMap_Data_2020<-sqldf("Select start,IATA,PNRs,Lat,Long from GeoMap_Data where Year='2020'")


#Maps with Log and lat on 2019 and 2020 Data 

locations_sf <- st_as_sf(GeoMap_Data_2019, coords = c("Long", "Lat"), crs = 4326)
mapview(locations_sf,zcol = "PNRs")

locations_sf <- st_as_sf(GeoMap_Data_2020, coords = c("Long", "Lat"), crs = 4326)
mapview(locations_sf,zcol = "PNRs")










