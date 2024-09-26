library(tidyverse)
library(ggrepel)
library(nflreadr)
library(nflplotR)
options(scipen = 9999)
data <- load_pbp(2024)

ak_anal <- data %>%
  filter(posteam == "NO" & name == "A.Kamara" & rush == 1) %>%
  select(posteam, name, rush, down, qtr, run_gap, run_location, ydsnet, 
         yards_gained, ydstogo, yrdln) %>%
  mutate(
    down = factor(down),
    quater = factor(qtr)
  )
view(ak_anal)

