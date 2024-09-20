library(tidyverse)
library(ggrepel)
library(nflreadr)
library(nflplotR)

options(scipen = 9999)

data <- load_pbp(2024)

data %>%
  select(home_team, away_team, posteam, desc) %>%
  View()

data %>% 
  select(posteam, defteam, desc, rush, pass) %>% 
  head()

#CLoser look @Alvin Kamara Rushing Attempts so far in 20244
data %>% 
  filter(posteam == "NO" & name == "A.Kamara" & rush == 1) %>%
  select(posteam, desc, rush, name, rusher, yards_gained, run_gap) %>% 
  view()
