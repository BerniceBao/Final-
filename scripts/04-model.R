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

## creating simulated data for the model
set.seed(853)


#### Linear Model data 1 ####
population_model <-
  lm(
    Number_of_free_wifi ~ Population,
    data = final_data,
  )

summary(population_model)
modelsummary(population_model)


#### Linear Model data 2 ####
income_model <-
  lm(
    Number_of_free_wifi ~ Income,
    data = final_data,
  )

summary(income_model)
modelsummary(income_model)

#### Save model ####

# LINEAR MODEL 1
saveRDS(
  population_model,
  file = "outputs/models/population_model.rds"
)

# LINEAR MODEL 2
saveRDS(
  income_model,
  file = "outputs/models/income_model.rds"
)


