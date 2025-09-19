/* 
Question: What are the top 10 highest paying data analyst jobs?
- Identify the top 10 highest paying data analyst jobs that are available remotely.
- Focues on jobs with specified salaries (remove null values).
*/

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