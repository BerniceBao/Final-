#### Preamble ####
# Purpose: Get data on Location and description data of all City of Toronto free public WiFi locations and make table
# Author: Bernice Bao
# Date: 15 April 2024 
# Contact: bernice.bao@mail.utoronto.ca
# License: MIT
# Pre-requisites: NA


#### Workspace setup ####
library(tidyverse)
library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Simulate data ####
set.seed(85)

simulated_data <-
  tibble(building_number = c(1:100),
    has_wifi = sample(c("Y","N"), size = 100, replace = TRUE, prob = c(0.9, 0.1)),
    # Based on: https://www.toronto.ca/city-government/accountability-operations-customer-service/long-term-vision-plans-and-strategies/smart-cityto/internet-connectivity-connectto/connectto-free-public-wifi-locations/
    building_type = c(
      rep(x = "library", times = 20),
      rep(x = "Arena", times = 40),
      rep(x = "Community", times = 40)
    ),
    ward = rep(c(x = "Etobicoke North", "Etobicoke Centre", "Etobicoke-Lakeshore", "Parkdale-High Park", "York South-Weston", "York Centre", "Humber River-Black Creek", "Eglinton-Lawrence", "Davenport", "Spadina-Fort York", "University-Rosedale", "Toronto-St. Paul's", "Toronto Centre", "Toronto-Danforth", "Don Valley West", "Don Valley East", "Don Valley North", "Willowdale", "Beaches-East York", "Scarborough Southwest", "Scarborough Centre", "Scarborough-Agincourt", "Scarborough North", "Scarborough-Guildwood", "Scarborough-Rouge Park"), times = 4),
    ward_number =rep(c(1:25), times = 4)
  )

head(simulated_data)

#### Save data ####
write_csv(simulated_data,"inputs/data/simulated_data.csv")

#### Simulate final data ####
set.seed(85)

simulated_data <-
  tibble(building_number = c(1:100),
         has_wifi = sample(c("Y","N"), size = 100, replace = TRUE, prob = c(0.9, 0.1)),
         # Based on: https://www.toronto.ca/city-government/accountability-operations-customer-service/long-term-vision-plans-and-strategies/smart-cityto/internet-connectivity-connectto/connectto-free-public-wifi-locations/
         building_type = c(
           rep(x = "library", times = 20),
           rep(x = "Arena", times = 40),
           rep(x = "Community", times = 40)
         ),
         ward = rep(c(x = "Etobicoke North", "Etobicoke Centre", "Etobicoke-Lakeshore", "Parkdale-High Park", "York South-Weston", "York Centre", "Humber River-Black Creek", "Eglinton-Lawrence", "Davenport", "Spadina-Fort York", "University-Rosedale", "Toronto-St. Paul's", "Toronto Centre", "Toronto-Danforth", "Don Valley West", "Don Valley East", "Don Valley North", "Willowdale", "Beaches-East York", "Scarborough Southwest", "Scarborough Centre", "Scarborough-Agincourt", "Scarborough North", "Scarborough-Guildwood", "Scarborough-Rouge Park"), times = 4),
         ward_number =rep(c(1:25), times = 4)
  )

head(simulated_data)

#### Save final data ####
write_csv(simulated_data,"inputs/data/simulated_data.csv")

