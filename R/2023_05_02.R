# Get the Data

# Read in with tidytuesdayR package
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

tuesdata <- tidytuesdayR::tt_load('2023-05-02')
tuesdata <- tidytuesdayR::tt_load(2023, week = 18)

plots <- tuesdata$plots
species <- tuesdata$species
surveys <- tuesdata$surveys

