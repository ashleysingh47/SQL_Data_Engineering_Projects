# Exploratory Data Analysis using SQL: Data Job market analysis





![Project 1 EDA Overview](/images/1_1_Project1_EDA.png)

This is a SQL project where I analysed the Data Engineering job market using real world job posting data.
This project demonstrates my ability to **write production quality analytical SQL, design efficient queries and turn business questions into data-driven insights**

## Executive Summary

- **Project scope** I built 3 analytical queries that answer key questions about the Data Engineer South African job market. 

- **Data Modeling** I used muti-table joins across the fact and dimension tables to extract insights.

- **Analytics** I applied aggregation, filtering and sorting to find top skills by demand, salary and overall value

- **Outcomes** This delivered actionable insights on SQL and Python dominance, with cloud platform skills also being in high demand in South Africa.

Review the code below:

- [01_top_demanded_skills.sql](..\1_EDA\01_top_demanded_skills.sql)
- [02_top_paying_skills.sql](..\1_EDA\02_top_paying_skills.sql)
- [03_optimal_skills.sql](..\1_EDA\03_optimal_skills.sql)

## Problem and Context
- **Most in-demand:** Which skills are most in-demand for data engineers in South Africa?
- **Highest Paid:** Which skills demand the highest salary in South Africa
- **Best Trade-Off:** Wat is the optimal skillset which balances demand and compensation

This project analyzes a **Data Warehouse** which was built using a star schema design. Below is the structure:

![Data WareHouse](/1_2_Data_Warehouse.png)

- The Fact table, `job_postings_fact` is the central table which contains job postings details like job title, location, salaries and dates.
- The 2 dimension tables, `company_dim` and `skills_dim` had company details and the skills catalog respectfully.


By querying across these interconnected tables I extracted insights about the demand for skills, salary and the optimal skills using salary and demand.
## Tech Stack
- **Query Engine:** DuckDB
- **Language:** SQL
- **Data Model:** Star Schema with fact + dimension + bridge tables
- **Development tool:** VS Code + DuckDB CLI
- **Version Control:** Git/GitHub for versioned SQL Scripts

## Analysis Overview
- **[Top Demanded Skills](..\1_EDA\01_top_demanded_skills.sql)**
Identified the top 10 most in demand skills for South African Dat Engineer postions.
- **[Top Paying Skills](..\1_EDA\02_top_paying_skills.sql)**
Analysed the 25 most high-paying skills with salary and the demand for the skills.

- **[Optimal Skills](..\1_EDA\03_optimal_skills.sql)**
Calculates an optimal score using natural log of demand + median salary in order to identify the most valuable skills to learn.

### Key Insights

- SQL and Python are the most in demand skills in South Africa with ~4000 jobs requiring SQL, and ~3000 jobs requiring Python.

- Other strongly desireable skills in the list include cloud platforms like AWS and Azure, with Spark also being a high sort after skill.

- We have a breakdown of the high paying skills in the table below.
We have adjusted the results to show skills that are in demand in more than 100 jobs.

- Oracle is listed as a high paying skill with a 519 jobs that require this, and has a median yearly salary of 159_500 dollars.
Jira and db2 top off the top 3 skills which are also seen as high paying skills.

- As seen below, SQL has the highest optimal score in South African job market, with Spark, and Python close behind.

- There seems to be a high demand for cloud platform skills in South Africa.

## SQL skills demonstrated

- **Joins:** Multi-table `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim` and `skills_dim`.


- **Aggregation:** `COUNT()`, `MEDIAN()` and `ROUND()` used for statistical analysis.


- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for top 'N' analysis.

### Data Analysis Techniques

- **Grouping:** `GROUP BY` for categorical analysis by skill.

- **Mathematical Functions:** `LN()` for natural logaritm transformation to normalise the demand metrics.

- **Calculated Metrics:** Derived optimal score by combining log-transformed demand with median salary.

- **HAVING Clause:** Filtering aggregated results.

- **NULL Handling:** Proper filtering of incomplete records (`salary_year_avg IS NOT NULL`).
