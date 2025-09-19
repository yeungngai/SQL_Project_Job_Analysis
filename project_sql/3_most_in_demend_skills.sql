/* 
Question: What are the most in demand skills for data analyst jobs?
- Identify the most in demand skills for data analyst jobs.
- Focues on jobs with the title 'Data Analyst'.
*/

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