/*What are the top-paying Data Analyst jobs?

Your query should:

Identify the top 10 highest-paying Data Analyst roles that are available remotely.
Consider only job postings where the salary is specified (exclude NULL salaries).
Sort the results from the highest salary to the lowest salary.
Include relevant job information such as the job title, company, location, and salary.
In simple terms:

"Among all remote Data Analyst job postings that have a listed salary, find the 10 jobs with the highest salaries and show their details."*/

SELECT 
    j.job_id,
    c.name,
    j.job_title_short,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date
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
LIMIT 10;