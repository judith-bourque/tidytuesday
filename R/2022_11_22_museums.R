# Get the Data

# Read in with tidytuesdayR package
# Install from CRAN via: install.packages("tidytuesdayR")

library("tidyverse")

tuesdata <- tidytuesdayR::tt_load('2022-11-22')
tuesdata <- tidytuesdayR::tt_load(2022, week = 47)

museums <- tuesdata$museums

# Tidy data ---------------------------------------------------------------

museums_tidy <- museums %>%
  janitor::clean_names() %>%
  na.omit() %>%
  separate(., governance, c("governance_cat", "governance_subcat"), sep = "-") %>%
  mutate(
    governance_cat = str_to_lower(governance_cat),
    governance_subcat = str_to_lower(governance_subcat)
  ) %>%
  mutate(
    governance_subcat = gsub("_", " ", governance_subcat)
  )


# Create graph data -------------------------------------------------------




# Visualize data ----------------------------------------------------------


