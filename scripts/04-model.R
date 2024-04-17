#### Preamble ####
# Purpose: Generates a linear model based on NHL data
# Author: Bernice Bao
# Data: Apr 16 2024
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(modelsummary)

#### Read data ####
final_data <- read.csv(here::here("outputs/data/final_data.csv"))


#### Model data 1 ####
wifi_model <-
  stan_glm(
    formula = Number_of_free_wifi ~ Population + Income,
    data = final_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 123
  )


## creating simulated data for the model
set.seed(853)


#### Linear Model data 2 ####
population_model <-
  lm(
    Number_of_free_wifi ~ Population,
    data = final_data,
  )

summary(population_model)
modelsummary(population_model)


#### Linear Model data 3 ####
income_model <-
  lm(
    Number_of_free_wifi ~ Income,
    data = final_data,
  )

summary(income_model)
modelsummary(income_model)


#### Save model ####

saveRDS(
  wifi_model,
  file = here::here("outputs/models/wifi_model.rds")
)

# LINEAR MODEL 2
saveRDS(
  population_model,
  file = "outputs/models/population_model.rds"
)

# LINEAR MODEL 3
saveRDS(
  income_model,
  file = "outputs/models/income_model.rds"
)

