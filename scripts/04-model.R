#### Preamble ####
# Purpose: Generates a linear model based on NHL data
# Author: Bernice Bao
# Data: Apr 16 2024
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
cleaned_ward_data <- read.csv(here::here("outputs/data/cleaned_ward_data.csv"))
cleaned_wifi_data <- read.csv(here::here("outputs/data/cleaned_wifid_data.csv"))

### Model data 1 ####
goals_model <-
  stan_glm(
    formula = Goals_PG ~ SV_Pct + GA_Avg + Sh_Pct + PP_PG * PP_Pct,
    data = league_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 1122
  )


#### Save model ####
saveRDS(
  goals_model,
  file = here::here("outputs/models/goals_model.rds")
)