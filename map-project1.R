
library(leaflet)
library(readxl)
library(dplyr)

# load the dataset stored in maps variable
maps <- read_excel("GPSPoint.xlsx", sheet = "eida_baseline_survey")
# View the dataset
View(maps)
colnames(maps)
count(maps)
# simplye created another variable and remove null data
newmap <- na.omit(maps)
# View cleansed dataset with no null values
View(newmap)
count(newmap)
attach(newmap)

# Create the first map using the openstreet base maps
leaflet(data = newmap) %>% addProviderTiles("OpenStreetMap") %>%
  addMarkers(~Longitude, ~latitude,
             popup = ~as.character(`1.1:Respondent Name`), 
             label = ~as.character(Village))

# Create the first map using the openstreet base maps
leaflet(data = newmap) %>% addProviderTiles("OpenStreetMap") %>%
  addCircleMarkers(~Longitude, ~latitude, radius = ~4, popup = pro)
             #popup = ~as.character(Province), 
             #label = ~as.character(District))




