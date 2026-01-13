# ====================================================
# 01_Load_Bind.R
# Load and bind all enrolment and step-level CSV files
# Cycle 1: DATA INGESTION only
# ====================================================

library(tidyverse)

dir.create("data/clean", recursive = TRUE, showWarnings = FALSE)

# ----Enrolment Files ----
enrolment_files <- list.files(
  "data/raw",
  pattern = "_enrolments\\.csv$",
  full.names = TRUE
)

enrolments <- enrolment_files %>%
  map_dfr(read_csv)

# ----Step-Level activity files----
step_files <- list.files(
  "data/raw",
  pattern = "_step-activity\\.csv$",
  full.names = TRUE
)

step_activity<- step_files %>%
  map_dfr(read_csv)

#----Save raw bound data----
write_csv(enrolments,"data/clean/enrolments_bounds.csv")
write_csv(step_activity,"data/clean/step_activity_bound.csv")

