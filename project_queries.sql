CREATE DATABASE covid_analysis;
USE covid_analysis;

CREATE TABLE covid_stats (
    iso_code VARCHAR(10),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
    population BIGINT,
    total_cases DOUBLE,
    new_cases DOUBLE,
    new_cases_smoothed DOUBLE,
    total_deaths DOUBLE,
    new_deaths DOUBLE,
    new_deaths_smoothed DOUBLE,
    total_cases_per_million DOUBLE,
    new_cases_per_million DOUBLE,
    new_cases_smoothed_per_million DOUBLE,
    total_deaths_per_million DOUBLE,
    new_deaths_per_million DOUBLE,
    new_deaths_smoothed_per_million DOUBLE,
    reproduction_rate DOUBLE);

SELECT * FROM covid_stats LIMIT 10;

SELECT COUNT(*) FROM covid_stats;

SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN reproduction_rate IS NULL THEN 1 ELSE 0 END) AS null_repro_rate
FROM covid_stats;

SELECT location, AVG(reproduction_rate)
FROM covid_stats
WHERE reproduction_rate IS NOT NULL
GROUP BY location;

SELECT location, MAX(total_cases) AS max_total_cases
FROM covid_stats
GROUP BY location
ORDER BY max_total_cases DESC
LIMIT 10;

SELECT date, new_cases
FROM covid_stats
WHERE location = 'India'
ORDER BY date;

SELECT location, MAX(total_deaths_per_million) AS max_deaths_per_million
FROM covid_stats
GROUP BY location
ORDER BY max_deaths_per_million DESC
LIMIT 10;

CREATE VIEW top_countries_by_cases AS
SELECT location, MAX(total_cases) AS max_total_cases
FROM covid_stats
GROUP BY location
ORDER BY max_total_cases DESC
LIMIT 10;

SELECT SUM(DISTINCT population) AS total_population
FROM covid_stats
WHERE continent IS NOT NULL;

SELECT location, date, new_cases
FROM covid_stats
WHERE new_cases IS NOT NULL
ORDER BY new_cases DESC
LIMIT 1;

SELECT continent, MAX(total_deaths) AS total_deaths
FROM covid_stats
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_deaths DESC;

SELECT iso_code, COUNT(*) AS records
FROM covid_stats
GROUP BY iso_code
ORDER BY records DESC;

SELECT location, COUNT(*) AS record_count
FROM covid_stats
GROUP BY location
ORDER BY record_count DESC;

SELECT MIN(date) AS start_date, MAX(date) AS end_date
FROM covid_stats;

SELECT date, new_cases_smoothed
FROM covid_stats
WHERE location = 'India'
ORDER BY date;

SELECT date, new_deaths_smoothed
FROM covid_stats
WHERE location = 'Georgia'
ORDER BY date;

SELECT *
FROM covid_stats
WHERE location = 'Hong Kong'
LIMIT 10;

SELECT 
  COUNT(*) AS total_rows,
  SUM(CASE WHEN total_deaths IS NULL THEN 1 ELSE 0 END) AS null_deaths,
  SUM(CASE WHEN reproduction_rate IS NULL THEN 1 ELSE 0 END) AS null_reproduction,
  SUM(CASE WHEN new_cases IS NULL THEN 1 ELSE 0 END) AS null_new_cases
FROM covid_stats
WHERE location = 'Hong Kong';

SELECT location, date, new_cases
FROM covid_stats
WHERE location IN ('India', 'Japan', 'Hong Kong')
ORDER BY date, location;

SELECT 
  location,
  DATE_FORMAT(date, '%Y-%m') AS month,
  AVG(new_cases) AS avg_new_cases
FROM covid_stats
WHERE location IN ('Bhutan', 'Grorgia', 'Camboida')
GROUP BY location, month
ORDER BY month, location;

SELECT 
  location,
  date,
  new_cases,
  AVG(new_cases) OVER (
    PARTITION BY location 
    ORDER BY date 
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS rolling_avg_new_cases
FROM covid_stats
WHERE location = 'Japan';
