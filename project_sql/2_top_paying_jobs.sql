
/*
    What skills are required for the top-paying Data Analyst jobs?

Your query should:

Use the top 10 highest-paying remote Data Analyst jobs identified in the previous query.
Find the skills associated with those job postings.
Display information that connects:
the job,
the salary,
and the required skills.
Sort the results so it is easy to see which skills appear in the highest-paying roles.
*/

WITH temp_table AS (SELECT 
    j.job_id,
    c.name,
    j.job_title_short,
    j.salary_year_avg
FROM
    job_postings_fact as j
LEFT JOIN
    company_dim as c
ON
    c.company_id = j.company_id
WHERE
    (job_title_short = 'Data Analyst' AND job_work_from_home = true)
    AND salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10)

SELECT
    sj.job_id,
    name,
    job_title_short,
    salary_year_avg,
    skills 
FROM
    temp_table as t
INNER JOIN 
    skills_job_dim as sj
ON  sj.job_id = t.job_id
INNER JOIN 
    skills_dim as s
ON  s.skill_id = sj.skill_id
ORDER BY
    salary_year_avg DESC;