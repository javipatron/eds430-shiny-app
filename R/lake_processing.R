# load the packages
library(tidyverse)

# Read in the raw data

lake_monitoring_data <- read_csv("raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv")


# calculate averages ----
avg_depth_temp <- lake_monitoring_data |> 
  select(Site, Depth, BedTemperature) |> 
  filter(Depth != "NaN") |> 
  drop_na(BedTemperature) |> 
  group_by(Site) |> 
  summarize(AvgDepth = round(mean(Depth), 1),
            AvgTemp = round(mean(BedTemperature), 1)
            )
#Create a full data frame
lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

# Create the final data frame

unique_lakes <- lake_monitoring_data |> 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) |> 
  distinct()


# Save your final df to the folder

write_csv(unique_lakes, "dashboard/data/lake_data_processed.csv")

#--------
  
  
  

