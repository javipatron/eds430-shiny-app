# LOAD LIBRARIES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(palmerpenguins)
library(sass)


# COMPILE CSS ----

sass(input = sass_file("R/sass_styles.scss"),
          output = "www/sass_styles.css")

