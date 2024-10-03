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
    quater = factor(qtr),
    success = case_when(
      down == 1 ~ yards_gained >= 0.4 * ydstogo,
      down == 2 ~ yards_gained >= 0.6 * ydstogo,
      down %in% c(3, 4) ~ yards_gained >= ydstogo,
      TRUE ~ FALSE
    )
  )
view(ak_anal)


overall_stats <- ak_anal %>%
  summarise(
    total_attempts = n(),
    total_yards = sum(yards_gained),
    avg_yards_per_attempt = mean(yards_gained),
    median_yards = median(yards_gained),
    success_rate = mean(success, na.rm = TRUE)
  )
View(overall_stats)