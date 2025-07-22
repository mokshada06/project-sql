# COVID-19 Data Analytics Using SQL

# Description
This project explores and analyzes global COVID-19 data using SQL. The goal is to clean, query, and extract insights from the dataset by writing structured SQL queries in MySQL Workbench. 
This work is part of a data analytics internship task and helps demonstrate the application of SQL for real-world data analysis.

# Project Contents

| File / Folder                     | Description                                                        |
|-----------------------------------|--------------------------------------------------------------------|
| `covid-19dataset-sql.csv`         | Cleaned COVID-19 dataset used for analysis                         |
| `project_queries.sql`             | All SQL queries used in the project                                |
| `project_output`                  | Folder containing exported query results in `.csv` format          |
| `project_covid.pdf`               | Final 2-page report with summary, steps, and conclusions           |
| `README.md`                       | GitHub project overview and structure                              |

# Tools Used

**MySQL Workbench 8.0** – SQL query execution and result export
**MySQL Server** – Backend relational database engine
**Kaggle Dataset** – Global COVID-19 data (CSV format)
**Excel / CSV** – To save and view query outputs
**GitHub** – To host and share the project

# Query Areas Covered

All queries are documented in [`project_queries.sql`], which includes:

- Dataset size, NULL checks, data profiling
- Country-wise statistics (e.g., India, Japan, Hong Kong)
- Total and new case trends
- Top countries by infection and death rates
- Time-based patterns using `GROUP BY` and `DATE_FORMAT`
- Window functions for rolling averages
- View creation and comparisons between countries


# Project Report

[`project_covid.pdf`]
The PDF includes:
- Introduction & Objective  
- Abstract  
- Tools Used  
- Steps Followed  
- Final Observations & Insights

# Exported Outputs

The `project_output/` folder contains exported `.csv` results from key queries, such as:
- Daily cases (India, Japan)
- Top 10 countries by total cases
- Monthly average case counts
- Rolling average trends

# Dataset Source
[Kaggle – COVID-19 Dataset](https://www.kaggle.com/datasets)
