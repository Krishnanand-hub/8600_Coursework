# MAS8600 Coursework – Exploring Learner Persistence Across Countries
This project explores patterns of learner persistence in a FutureLearn MOOC,
focusing on how engagement varies across countries and how these insights
can inform targeted educational interventions.


## Research Question
### Primary Research Question (Cycle 1):
How does learner persistence vary across countries in the FutureLearn MOOC,
as measured by progression through course steps?

### Follow-up Research Question (Cycle 2):
Which countries exhibit consistently low learner persistence,
and how could targeted offline or blended learning interventions improve engagement
for these regions?

## Data
This analysis uses FutureLearn MOOC data, specifically:
- Enrolments (7 CSV files)
- step-level activity (7 CSV files)

## Directory Structure
- data/raw/: raw FutureLearn CSV files
- data/clean/: cleaned and derived datasets
- munge/: data preparation scripts
- cache/: cached derived objects
- reports/: analysis report (R Markdown)
- MAS8600_Coursework.Rproj: R project file

## Method
CRISP-DM with two cycles:
-Cycle 1: Descriptive analysis of learner persistence by country
-Cycle 2: Stakeholder focused recommendation on offline/blended classes 
          for low persistence countries.

## Setup Instructions
1. Open the project using the .Rproj file.
2. Ensure required packages are installed using renv.

## Execution Instructions
1. Open the project using the .Rproj file.
2. Run the following in R:
   library(ProjectTemplate)
   load.project()
3. Open the R Markdown file in the reports/ directory and click Knit.