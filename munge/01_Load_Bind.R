# ====================================================
# 01_Load_Bind.R
# Bind auto-loaded enrolment and step-level data
# Cycle 1: DATA INGESTION
# ====================================================

# ---- Bind enrolment files ----
enrolments <- list(
  cyber.security.1_enrolments,
  cyber.security.2_enrolments,
  cyber.security.3_enrolments,
  cyber.security.4_enrolments,
  cyber.security.5_enrolments,
  cyber.security.6_enrolments,
  cyber.security.7_enrolments
) %>% bind_rows()

# ---- Bind step-level activity files ----
step_activity <- list(
  cyber.security.1_step.activity,
  cyber.security.2_step.activity,
  cyber.security.3_step.activity,
  cyber.security.4_step.activity,
  cyber.security.5_step.activity,
  cyber.security.6_step.activity,
  cyber.security.7_step.activity
) %>% bind_rows()

# ---- Save bound data ----
write_csv(enrolments, "data/clean/enrolments_bounds.csv")
write_csv(step_activity, "data/clean/step_activity_bounds.csv")
