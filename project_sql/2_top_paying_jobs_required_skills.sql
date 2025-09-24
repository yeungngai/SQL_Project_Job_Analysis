/* 
Question: What are the highest paying data analyst jobs and their required skills?
- Identify the highest paying data analyst jobs that are available remotely.
- Identify the required skills for these top-paying jobs.
- Focues on jobs with specified salaries (remove null values).
*/


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


-- Using CTE:
-- WITH top_paying_jobs AS(
--   SELECT
--     job_id,
--     job_title,
--     salary_year_avg,
--     name AS company_name
--   FROM
--     job_postings_fact
--   INNER JOIN company_dim USING (company_id)
--   WHERE
--     job_title LIKE '%Data%Analyst%'
--     AND job_location = 'Anywhere'
--     AND salary_year_avg IS NOT NULL
--   ORDER BY
--     salary_year_avg DESC
--   LIMIT 10
-- )

-- SELECT
--   top_paying_jobs.*,
--   skills
-- FROM
--   top_paying_jobs
-- INNER JOIN skills_job_dim USING (job_id)
-- INNER JOIN skills_dim USING (skill_id)
-- ORDER BY
--   salary_year_avg DESC
-- LIMIT 10;