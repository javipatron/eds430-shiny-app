#load packages
library(palmerpenguins)
library(tidyverse)
library(DT)


# filter data ---
body_mass_df <- penguins |> 
  filter(body_mass_g %in% 3000:4000)


# plot
ggplot(na.omit(body_mass_df),
       aes(x=flipper_length_mm, 
           y= bill_length_mm,
           color = species,
           shape = species,
           size = species)) +
  geom_point() +
  scale_size_discrete(range = c(1.5, 3, 1)) +
  scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "darkblue", "Gentoo" = "cyan4"))


#filter by sex




#filter years

filtered_years <- penguins |> 
  filter(year %in% c(2007, 2008))

# make DT
DT::datatable(penguins)

