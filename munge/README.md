# Munge Scripts

This folder contains all data preparation scripts for the coursework.

## Script Order
1. **01_Load_Bind.R**
   - Loads and binds all enrolment and step-level CSV files

2. **02_Clean_Join.R**
   - Cleans datasets and joins them using `learner_id`

3. **03_Country_Persistence.R**
   - Computes learner- and country-level persistence metrics for Cycle 1

## Output
All scripts write CSV files to `data/clean/`.

No analysis or plotting is performed in this folder.
