# ==================================
# 03_Country_Persistence.R
# Country-level persistence metrics
# Cycle 1: ANALYSIS CORE
# ==================================

library(tidyverse)
 data<- read_csv("data/clean/joined_cycle1.csv")
 
 
 
# ----Learner Level Persistence----
 learner_persistence <- data %>%
   filter(!is.na(country)) %>%
   group_by(country, learner_id) %>%
   dplyr::summarise(
     max_step_reached = max(step_number, na.rm = TRUE)
   ) %>%
   ungroup()
 
 
# ----Country level matrics----
 country_metrics <- learner_persistence %>%
   group_by(country) %>%
   summarise(
     learners = n(),
     avg_max_step = mean(max_step_reached),
     median_max_step = median(max_step_reached),
     early_dropout_rate = mean(max_step_reached <= 2)
   )
 
 
# ----Save----
write_csv(country_metrics,"data/clean/country_metrics_cycle1.csv")
write_csv(country_metrics,"cache/country_metrics_cycle1.csv")
