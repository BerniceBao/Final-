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
final_data <- read.csv(here::here("outputs/data/final_data.csv"))

### Model data 1 ####
wifi_model <-
  stan_glm(
    formula = Number_of_free_wifi ~ Population + Income,
    data = final_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 1122
  )


#### Save model ####
saveRDS(
  wifi_model,
  file = here::here("outputs/models/wifi_model.rds")
)

