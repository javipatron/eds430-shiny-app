#load packages
library(tidyverse)
library(leaflet)

# Read your clean df
filter_lakes <- read_csv("dashboard/data/lake_data_processed.csv")


# practice filtering
lakes_new <- filter_lakes |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)



leaflet() |> 
  # add tiles
  addProviderTiles("Esri.WorldImagery") |> 
  
  # set view of AK
  setView(lng = -152,
          lat = 70,
          zoom = 6) |> 
  # add mini map
  addMiniMap(toggleDisplay = T, minimized = T) |> 

  # Add markers
  addMarkers(data = filter_lakes,
             lng = filter_lakes$Longitude,
             lat = filter_lakes$Latitude,
             popup = paste("Site Name:", filter_lakes$Site, "<br>",
                           "Elevation:", filter_lakes$Elevation, "meters (above SL)", "<br>",
                           "Avg Depth:", filter_lakes$AvgDepth, "meters", "<br>",
                           "Avg Lake Bed Temp:", filter_lakes$AvgTemp, "°C"))
  


