# ==================================
# 03_Country_Persistence.R
# Country-level persistence metrics
# Cycle 1: MODELLING (descriptive)
# ==================================

# ---- Learner-level persistence ----
learner_persistence <- joined_cycle1 %>%
  filter(!is.na(country)) %>%
  group_by(country, learner_id) %>%
  summarise(
    max_step_reached = max(step_number, na.rm = TRUE),
    .groups = "drop"
  )

# ---- Country-level metrics ----
country_metrics <- learner_persistence %>%
  group_by(country) %>%
  summarise(
    learners = n(),
    avg_max_step = mean(max_step_reached),
    median_max_step = median(max_step_reached),
    early_dropout_rate = mean(max_step_reached <= 2),
    .groups = "drop"
  )

# ---- Save derived metrics ----
write_csv(country_metrics, "data/clean/country_metrics_cycle1.csv")
write_csv(country_metrics, "cache/country_metrics_cycle1.csv")

cache('country_metrics')