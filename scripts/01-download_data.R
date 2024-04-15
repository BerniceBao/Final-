#### Preamble ####
# Purpose: Describes the acquisition process of the datasets used
# Author: Jason Ngo
# Data: Apr 16 2023
# Contact: jason_ngo@live.com
# License: MIT
# Pre-requisites: A working internet connection


#### Workspace setup ####
library(tidyverse)

#### Download data ####

## League averages data downloaded from https://www.hockey-reference.com/leagues/stats.html#stats ##
## Data on shooting is from nhl.com/stats/teams, from seasons 2011-2012 to 2022-2023 and viewing Shots By Type report ##
## Data on forwards and dmen is from nhl.com/stats/skaters, from seasons 2011-2012 to 2022-2023 with 15 minimum games ## ##
## forwards data was selected by filtering all players with 1.0 points per game or above from those seasons ##
## defensemen data was selected by filtering all players with 0.6 points per game or above from those seasons ##

# I acknowledge that the nhl api exists and is a usable R package, however.. #
# ..isolating specific statistics by teams and players during a 10 year period using the API was too difficult #
