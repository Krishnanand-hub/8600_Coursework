# ===============================================================
# 02_Clean_Join.R
# Clean enrolments and step-level activity and join by learner_id
# Cycle 1: DATA INGESTION only
# ===============================================================

library(tidyverse)
# ----Load Bound Data----
enrolments<-read_csv("data/clean/enrolments_bounds.csv")
step_activity<-read_csv("data/clean/step_activity_bound.csv")

# ----Clean Enrolments----
enrolments_clean<-enrolments %>%
  select(
    learner_id,
    country,
    detected_country
  )%>%
  mutate(
    country=if_else(country=="Unknown",detected_country,country)
  )%>%
  filter(!is.na(country))%>%
  distinct(learner_id, .keep_all = TRUE)

# ----Clean step-level activity----
step_activity_clean<-step_activity %>%
  select(
    learner_id,
    step,
    week_number,
    step_number,
    first_visited_at,
    last_completed_at
  )

# ----Join Datasets----
joined_cycle1<- step_activity_clean %>%
  left_join(enrolments_clean, by="learner_id")

# ----Save cleaned and Joined data----
write_csv(joined_cycle1,"data/clean/joined_cycle1.csv")













