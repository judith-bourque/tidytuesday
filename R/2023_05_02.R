# Get the Data

# Read in with tidytuesdayR package
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

library("tidyverse")
library("gghighlight")

tuesdata <- tidytuesdayR::tt_load('2023-05-02')

plots <- tuesdata$plots
species <- tuesdata$species
surveys <- tuesdata$surveys

data <- species %>%
  mutate()

ggplot(data, aes(x = meanhfl, y = meanwgt))+
  geom_point() +
  gghighlight(granivore > 0) +
  xlab("Mean weight") +
  ylab("Mean hindfoot length")
