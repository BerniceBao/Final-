#### Preamble ####
# Purpose: Simulates the primary datasets of interest
# Author: Jason Ngo
# Data: Apr 16 2023
# Contact: jason_ngo@live.com
# License: MIT
# Pre-requisites: Some knowledge of NHL statistics terminology


#### Workspace setup ####
library(tidyverse)
set.seed(2223)

#### Simulate data ####
## Season column correlates to the NHL season. Column XX represents season 20XX - 20YY where YY is (XX  + 1) ##
## For example, column 16 represents season 2016 - 2017

### Tibble for the league data simulation ###
## Avg_Goals_Game has a min of 1, since realistically every team should average 1 goal a game atleast ##
## Avg_Shots_Game has a min of 20 and max of 45, since those averages are hard to come by in a normal NHL season
## Avg_PP_Percentage has a min of 5 and a max of 40, for the same reasons above
## Avg_Sh_Percentage has a min of 5 and a max of 20, for the same reasons above
nhlleaguesim <- tibble(
  Season = c(
    11:22
  ),
  Avg_Goals_Game = c(
    runif(n = 12, min = 1, max = 5)
  ),
  Avg_Shots_Game = c(
    runif(n = 12, min = 20, max = 45)
  ),
  Avg_PP_Percentage = c(
    runif(n = 12, min = 5, max = 40)
  ),
  Avg_Sh_Percentage = c(
    runif(n = 12, min = 5, max = 20)
  ),
  Avg_PP_Opportunities = c(
    runif(n = 12, min = 1, max = 6)
  )
)

### Tibble for player simulation data ###
## Fwd_Pts_Game, since we are looking for point per game players, has a min of 1 and a max of 2 ##
## Dmen_Pts_Game, since we are looking for productive defensemen, has a min of 0.5 and a max of 1.5 ##
nhlplayersim <- tibble(
  Season = c(
    11:22
  ),
  Fwd_Pts_Game = c(
    runif(n = 12, min = 1, max = 2)
  ),
  Dmen_Pts_Game = c(
    runif(n = 12, min = 0.5, max = 1.5)
  )
)
