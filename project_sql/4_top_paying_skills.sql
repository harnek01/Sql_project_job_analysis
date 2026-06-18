/*
Practice Problem

Question:

What are the top-paying skills for Data Analysts?

Your query should:

Consider only Data Analyst job postings.
Include only jobs where the salary is specified (exclude NULL salaries).
Calculate the average salary associated with each skill.
Determine which skills are associated with the highest average salaries.
Display the skill name and its average salary.
Sort the results from the highest average salary to the lowest.
In simple terms:

"For Data Analyst jobs that have a listed salary, which skills are associated with the highest-paying jobs on average?"
*/

SELECT
    skills,
    AVG(salary_year_avg) as avg_top_skill
FROM 
    job_postings_fact as j 
INNER JOIN 
    skills_job_dim as sj
ON sj.job_id = j.job_id
INNER JOIN
    skills_dim as s
ON  s.skill_id = sj.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst'
GROUP BY 
    skills
ORDER BY
    avg_top_skill DESC
LIMIT 10;