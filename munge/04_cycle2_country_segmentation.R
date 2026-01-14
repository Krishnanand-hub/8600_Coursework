# ==========================================================
# 04_Country_Persistence_Cycle2.R
# Country persistence classification for stakeholder insight
# Cycle 2: MODELLING (descriptive thresholds)
# ==========================================================

# ---- Define interpretable thresholds ----
low_engagement_threshold <- quantile(country_metrics$avg_max_step, 0.25, na.rm = TRUE)
high_dropout_threshold <- quantile(country_metrics$early_dropout_rate, 0.75, na.rm = TRUE)

# ---- Classify countries ----
country_cycle2 <- country_metrics %>%
  mutate(
    persistence_category = case_when(
      avg_max_step <= low_engagement_threshold &
        early_dropout_rate >= high_dropout_threshold ~ "Low Persistence",
      avg_max_step > low_engagement_threshold &
        early_dropout_rate < high_dropout_threshold ~ "High Persistence",
      TRUE ~ "Medium Persistence"
    )
  )

# ---- Explicit list of low persistence countries ----
low_persistence_countries <- country_cycle2 %>%
  filter(persistence_category == "Low Persistence") %>%
  arrange(desc(early_dropout_rate))

# ---- Save outputs ----
write_csv(country_cycle2, "data/clean/country_cycle2_classification.csv")
write_csv(low_persistence_countries, "data/clean/low_persistence_countries.csv")
write_csv(country_cycle2, "cache/country_cycle2_classification.csv")
write_csv(low_persistence_countries, "cache/low_persistence_countries.csv")

cache('country_cycle2')
cache('low_persistence_countries')