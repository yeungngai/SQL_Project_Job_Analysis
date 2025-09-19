/*
Question: Which in-demand data analyst skills offer the highest average salaries?
*/

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