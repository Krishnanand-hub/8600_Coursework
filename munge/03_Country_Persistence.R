# ==================================
# 03_Country_Persistence.R
# Country-level persistence metrics
# Cycle 1: ANALYSIS CORE
# ==================================

library(tidyverse)
 data<- read_csv("data/clean/joined_cycle1.csv")
 
 
# ----Learner Level Persistence----
learner_persistence <- data %>%
   group_by(country,learner_id) %>%
   summarise(
     steps_completed=sum(!is.na(last_completed_at)),
     total_steps = n(),
     completion_rate = steps_completed/total_steps,
     .groups = "drop"
   )

# ----Country level matrics----
country_metrics <- learner_persistence %>%
   group_by(country) %>%
   summarise(
     learners = n(),
     avg_steps_completed = mean(steps_completed),
     median_steps_completed = median(steps_completed),
     dropout_rate = mean(completion_rate < 0.3),
     .groups = "drop"
   )%>%
   arrange(desc(avg_steps_completed))
 

# ----Save----
write_csv(country_metrics,"data/clean/country_metrics_cycle1.csv")
