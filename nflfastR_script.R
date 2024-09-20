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

#Alvin Kamara
data %>% 
  filter(name == "A.Kamara" | rush == 1) %>%
  select(posteam, desc, rush, pass, name, passer, rusher, receiver) %>% 
  view()
