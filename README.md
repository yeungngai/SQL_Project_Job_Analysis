# Introduction
Dive into data job market of 2023, focusing on data analysis roles. This project explores top paying jobs and in-demand skills.

SQL queries: [project_sql folder](/project_sql/)

<br>

# Background
The question I wanted to answer through my SQL queries were:
1. What are the top 10 highest paying data analyst jobs?
2. What are the highest paying data analyst jobs and their required skills?
3. What are the most in demand skills for data analyst jobs?
4. What are the highest paying data analyst skills?
5. Which in-demand data analyst skills offer the highest average salaries?

<br>

# Tools Used
- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Git & Github**

<br>

# The Analysis
### 1. Top Paying Data Analyst Positions

```sql
SELECT
  job_title,
  salary_year_avg,
  name AS company_name
FROM
  job_postings_fact
INNER JOIN company_dim USING (company_id)
WHERE
  job_title LIKE '%Data%Analyst%'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg DESC
LIMIT 10
```
| job_title                       |   salary_year_avg | company_name                 |
|:--------------------------------|------------------:|:-----------------------------|
| Data Analyst                    |            650000 | Mantys                       |
| Data Analyst, Marketing         |            232423 | Pinterest Job Advertisements |
| Data Analyst (Hybrid/Remote)    |            217000 | Uclahealthcareers            |
| Principal Data Analyst (Remote) |            205000 | SmartAsset                   |
| Director, Data Analyst - HYBRID |            189309 | Inclusively                  |

### 2. Top Paying Skills
```sql
SELECT
  job_title,
  salary_year_avg,
  name AS company_name,
  skills AS required_skills
FROM
  job_postings_fact
INNER JOIN company_dim USING (company_id)
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE
  job_title LIKE '%Data%Analyst%'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg DESC
LIMIT 10
```

| job_title               |   salary_year_avg | company_name                 | required_skills   |
|:------------------------|------------------:|:-----------------------------|:------------------|
| Data Analyst, Marketing |            232423 | Pinterest Job Advertisements | sql               |
| Data Analyst, Marketing |            232423 | Pinterest Job Advertisements | python            |
| Data Analyst, Marketing |            232423 | Pinterest Job Advertisements | r                 |
| Data Analyst, Marketing |            232423 | Pinterest Job Advertisements | hadoop            |
| Data Analyst, Marketing |            232423 | Pinterest Job Advertisements | tableau           | 

### 3. Most In-Demand Skills
```sql
SELECT
  skills,
  COUNT(skill_id) AS job_count
FROM
  job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE
  job_title LIKE '%Data%Analyst%'
GrOUP BY
  skills
ORDER BY
  job_count DESC
LIMIT 10;
```
| skills   |   job_count |
|:---------|------------:|
| sql      |       93521 |
| excel    |       63723 |
| python   |       57055 |
| tableau  |       48124 |
| power bi |       38109 |


### 4. Highest Paying Skills
```sql
SELECT
  skills,
  ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
  job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
GROUP BY
  skills
ORDER BY
  avg_salary DESC
LIMIT 25;
```
| skills    |   avg_salary |
|:----------|-------------:|
| svn       |       400000 |
| solidity  |       179000 |
| couchbase |       160515 |
| datarobot |       155486 |
| golang    |       155000 |

### 5. Optimal Skills
```sql
SELECT
  skills,
  ROUND(AVG(salary_year_avg), 0) AS avg_salary,
  COUNT(skill_id) AS job_count
FROM
  job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
GROUP BY
  skills
HAVING
  COUNT(skill_id) > 300
ORDER BY
  avg_salary DESC,
  job_count DESC
LIMIT 10;
```
| skills   |   avg_salary |   job_count |
|:---------|-------------:|------------:|
| azure    |       105400 |         319 |
| python   |       101512 |        1840 |
| oracle   |       100964 |         332 |
| r        |        98708 |        1073 |
| tableau  |        97978 |        1659 |