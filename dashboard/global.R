# Load Packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)

#READ IN DATA --------
lake_data <- read_csv("data/lake_data_processed.csv")


