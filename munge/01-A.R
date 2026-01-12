# ------------------------------------------------------------------
# Munge Script: Video Engagement VS Step Completion
# Purpose: Combine multiple course runs and prepare step-level data
# ------------------------------------------------------------------

# Inspect available datasets
ls()
library(dplyr)

# -----------------------------
#1. COMBINE STEP ACTIVITY DATA
# -----------------------------
step_activity <-bind_rows(
  cyber.security.1_step.activity,
  cyber.security.2_step.activity,
  cyber.security.3_step.activity,
  cyber.security.4_step.activity,
  cyber.security.5_step.activity,
  cyber.security.6_step.activity,
  cyber.security.7_step.activity,
  .id = "run_id"
)

# ---------------------------
#2. COMBINE VIDEO STATS DATA
# ---------------------------
video_stats <-bind_rows(
  cyber.security.4_video.stats,
  cyber.security.5_video.stats,
  cyber.security.6_video.stats,
  cyber.security.7_video.stats,
  .id = "run_id"
)

# -------------------
#3. CLEAN VIDEO DATA
# -------------------
video_clean <- video_stats %>%
  select(
    run_id,
    step_position,
    video_duration,
    viewed_fifty_percent,
    viewed_seventyfive_percent,
    viewed_onehundred_percent
  )

# ----------------------------------------
#4. AGGREGATE STEP ACTIVITY TO STEP LEVEL
# ----------------------------------------
step_completion <- step_activity %>%
  mutate(completed=!is.na(last_completed_at)) %>%
  dplyr::group_by(,run_id,step) %>%
  dplyr::summarise(
    total_learners = dplyr::n(),
    completed_learners = sum(completed),
    completed_rate = completed_learners/total_learners,
    .groups="drop"
  )

# ---------------------------------------------
#5. JOIN VIDEO ENGAGEMENT WITH STEP COMPLETION
# ---------------------------------------------
video_step <- video_clean %>%
  left_join(step_completion,
            by = c("run_id","step_position"="step")
  )


# Object 'video_step' is automatically cached by ProjectTemplate


