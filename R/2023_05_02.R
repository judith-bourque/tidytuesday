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
  labs(title = "A Rodent's Diet",
       subtitle = "Granivores tend to be heavier and shorter than rodents with other diet types.",
       caption = "Data: The Portal Project\nGraphic: github.com/judith-bourque") +
  scale_colour_discrete(type = c("darkorange", "grey")) +
  theme_classic() +
  theme(
    axis.ticks = element_line(colour = "grey"),
    axis.line = element_line(colour = "grey"))

ggsave(
  "graph/2023-05-02.png",
  width = 6,
  height = 6,
  units = "in"
)
