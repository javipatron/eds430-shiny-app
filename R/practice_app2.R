#load libraries

library(tidyverse)

library(lterdatasampler)


clean_trout <- and_vertebrates |> 
  filter(species =="Cutthroat trout") |> 
  select(sampledate, 
         section, 
         species, 
         length_mm = length_1_mm, 
         weight = weight_g, 
         channel_type =unittype ) |> 
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old groth forest",
  )) |> 
  drop_na()

# practice filtering
trout_filtered_df <- clean_trout |> 
  filter(channel_type %in% c("R", "C")) |> 
  filter(section %in% c("clear cut forest"))


#plot
ggplot(trout_filtered_df, aes(x= length_mm, y = weight, color = channel_type)) +
  geom_point(alpha = 0.5, size = 2) +
  scale_color_manual(values = c("C" = "salmon",
                                "R" = "purple",
                                "S" = "gray15",
                                "P" = "darkolivegreen",
                                "SC" = "blue3",
                                "I" = "yellow3",
                                "IP" = "cyan4"))






