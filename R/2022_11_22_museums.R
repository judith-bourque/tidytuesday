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
    governance_subcat = gsub("_", " ", governance_subcat),
    size = factor(size, levels = c("small", "medium", "large", "huge"))
  )

# Create graph data -------------------------------------------------------

#remove rows with NA value in x column
museums_not_na <- museums_tidy
museums_not_na <- museums_not_na[!(is.na(museums_not_na$governance_cat)), ]
museums_not_na <- museums_not_na[!(is.na(museums_not_na$governance_subcat)), ]
museums_not_na <- museums_not_na[!(is.na(museums_not_na$size)), ]


# Visualize data ----------------------------------------------------------


