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
  mutate(diet = case_when(granivore == 1 ~ "granivore",
                          .default = as.character("unspecified")))

ggplot(data, aes(x = meanhfl, y = meanwgt, group = diet, colour = diet)) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  xlab("Mean weight") +
  ylab("Mean hindfoot length") +
  labs(title = "",
       subtitle = "Granivores tend to be heavier and shorter than animals with other diet types.") +
  scale_colour_discrete(type = c("brown", "black")) +
  theme_classic()

