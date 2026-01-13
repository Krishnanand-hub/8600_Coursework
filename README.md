# MAS8600_Coursework - Learner Persistence by Country

## Research Question
Which countries' learners stay engaged the longest, and which
drop off the earliest ??

## Data
This analysis uses FutureLearn MOOC data, specifically:
- Enrolments (7 CSV files)
- step-level activity (7 CSV files)

##Directory Structure
- data/: raw data files
- munge/: data cleaning scripts
- clean/: cleaned and derived csv files
- reports/: analysis report (R Markdown)

## Method
CRISP-DM with two cycles:
-Cycle 1: Descriptive analysis of learner persistence by country
-Cycle 2: Stakeholder focused recommendation on offline/blended classes 
          for low persistence countries.

##Setup Instructions
Open the project in Rstudio and install required packages.

##Execution Instructions 
1. Run munge scripts in order:
- 01_Load_Bind.R
- 02_Clean_Join.R
- 03_Country_Persistence.R

2. Open report.Rmd and click knit to reproduce the analysis.