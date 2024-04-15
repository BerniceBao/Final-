#### Preamble ####
# Purpose: Isolates the columns of interest, sums the data and cleans up the names of columns.
# Author: Jason Ngo
# Data: Apr 16 2023
# Contact: jason_ngo@live.com
# License: MIT
# Pre-requisites: Some knowledge of NHL statistics terminology


#### Workspace setup ####
library(tidyverse)
library(here)
library(readxl)

league_data <- read_excel(here::here("inputs/data/Summaryleague_1122.xlsx"))

## The datasets from nhl.com come in pages, so I will load them and merge them immediately ##
shooting_p1 <- read_excel(here::here("inputs/data/shooting_1122p1.xlsx"))
shooting_p2 <- read_excel(here::here("inputs/data/shooting_1122p2.xlsx"))
shooting_p3 <- read_excel(here::here("inputs/data/shooting_1122p3.xlsx"))
shooting_p4 <- read_excel(here::here("inputs/data/shooting_1122p4.xlsx"))
master_shooting <- rbind(shooting_p1, shooting_p2) |> rbind(shooting_p3) |> rbind(shooting_p4)

forwards_p1 <- read_excel(here::here("inputs/data/forwards_1122p1.xlsx"))
forwards_p2 <- read_excel(here::here("inputs/data/forwards_1122p2.xlsx"))
forwards_p3 <- read_excel(here::here("inputs/data/forwards_1122p3.xlsx"))
master_forwards <- rbind(forwards_p1, forwards_p2) |> rbind(forwards_p3)

dmen_p1 <- read_excel(here::here("inputs/data/dmen_1122p1.xlsx"))
dmen_p2 <- read_excel(here::here("inputs/data/dmen_1122p2.xlsx"))
dmen_p3 <- read_excel(here::here("inputs/data/dmen_1122p3.xlsx"))
master_dmen <- rbind(dmen_p1, dmen_p2) |> rbind(dmen_p3)

#### Clean data ####

### Fixing up the league_data dataset and renaming columns ###
league_data[12,1] = "2011-12"
league_data <- league_data |> rename(
  "Goals_PG" = "G",
  "PP_PG" = "PPO",
  "PP_Pct" = "PP%",
  "SA" = "SA",
  "SV_Pct" = "SV%",
  "GA_Avg" = "GAA"
)

### We're only concerned with season and p/gp from forwards and defensemen, so let's select those ###
master_forwards <- master_forwards |> select("Season", "P/GP")
master_dmen <- master_dmen |> select("Season", "P/GP")

## Rename P/GP to something cleaner ##
master_forwards <- master_forwards |> rename("Points_PG" = "P/GP")
master_dmen <- master_dmen |> rename("Points_PG" = "P/GP")

### For shooting, we want season and s% (shooting percentage) ###
master_shooting <- master_shooting |> select("Season", "S%")

### For shooting, we want means per season ###
master_shooting <- master_shooting |> group_by(Season) |> summarise(mean = mean(`S%`))
## Round the values so they're nicer ##
master_shooting <- master_shooting |> round(2)
## Rename the mean column ##
master_shooting <- master_shooting |> rename("Sh_Pct" = "mean")

### We want to merge shooting data with league data, so let's standardize the Season column ###
master_shooting <- master_shooting |> mutate(
  Season = recode(
    Season,
    "20112012" = "2011-12",
    "20122013" = "2012-13",
    "20132014" = "2013-14",
    "20142015" = "2014-15",
    "20152016" = "2015-16",
    "20162017" = "2016-17",
    "20172018" = "2017-18",
    "20182019" = "2018-19",
    "20192020" = "2019-20",
    "20202021" = "2020-21",
    "20212022" = "2021-22",
    "20222023" = "2022-23"
  )
)

## Let's standardize the format of the Season column across our datasets ##

master_forwards <- master_forwards |> mutate(
  Season = recode(
    Season,
    "20112012" = "2011-12",
    "20122013" = "2012-13",
    "20132014" = "2013-14",
    "20142015" = "2014-15",
    "20152016" = "2015-16",
    "20162017" = "2016-17",
    "20172018" = "2017-18",
    "20182019" = "2018-19",
    "20192020" = "2019-20",
    "20202021" = "2020-21",
    "20212022" = "2021-22",
    "20222023" = "2022-23"
  )
)

master_dmen <- master_dmen |> mutate(
  Season = recode(
    Season,
    "20112012" = "2011-12",
    "20122013" = "2012-13",
    "20132014" = "2013-14",
    "20142015" = "2014-15",
    "20152016" = "2015-16",
    "20162017" = "2016-17",
    "20172018" = "2017-18",
    "20182019" = "2018-19",
    "20192020" = "2019-20",
    "20202021" = "2020-21",
    "20212022" = "2021-22",
    "20222023" = "2022-23"
  )
)

league_data <- merge(league_data, master_shooting, by = "Season")

#### Save data ####
write_csv(league_data, here::here("outputs/data/league_data.csv"))
write_csv(master_dmen, here::here("outputs/data/master_dmen.csv"))
write_csv(master_forwards, here::here("outputs/data/master_forwards.csv"))


