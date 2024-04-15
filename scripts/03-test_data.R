#### Preamble ####
# Purpose: Tests the master dataframes against bound checks defined in the simulation script
# Author: Jason Ngo
# Data: Apr 16 2023
# Contact: jason_ngo@live.com
# License: MIT
# Pre-requisites: Some knowledge of NHL statistics terminology

#### Workspace setup ####
library(tidyverse)
library(here)

league_data <- read.csv(here::here("outputs/data/league_data.csv"))
master_dmen <- read.csv(here::here("outputs/data/master_dmen.csv"))
master_forwards <- read.csv(here::here("outputs/data/master_forwards.csv"))

#### Test data ####

#### League dataset tests ####

## Let's test if there are 12 columns, aka 12 seasons, in the league dataset ##
league_data |> unique() |> count() == 12

## Let's test if average goals is less than 5 and greater than 1. AKA is it a realistic value ##
league_data$Goals_Per_Game < 5
league_data$Goals_Per_Game > 1

## Let's test if average shots per game is less than 45 and greater than 20. AKA is it a realistic value ##
league_data$Shots_Against > 20
league_data$Shots_Against < 45

## Let's test if average PP percentage is less than 40 and greataer than 5. AKA is it a realistic value ##
league_data$PowerPlay_Pct > 5
league_data$PowerPlay_Pct < 40

## Let's test if mean shooting percentage is less than 20 and greataer than 5. AKA is it a realistic value ##
league_data$Mean_Sh_Pct > 5
league_data$Mean_Sh_Pct < 20

## Let's test if average powerplay opportunities/game is less than 6 and greater than 1. AKA is it a realistic value ##
league_data$PowerPlay_Game > 1
league_data$PowerPlay_Game < 6

#### Skater Dataset Tests #### 

## Let's test if forward points per game is less than 2 and greater than 1
master_forwards$Points_Per_Game > 1
master_forwards$Points_Per_Game < 2

## Let's test if defenseman points per game is less than 1.5 and greater than 0.5
master_dmen$Points_Per_Game > 0.5
master_dmen$Points_Per_Game < 1.5
