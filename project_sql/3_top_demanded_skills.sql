/*
Question:

What are the most in-demand skills for Data Analysts?

Your query should:

Consider all Data Analyst job postings in the dataset.
Identify the skills required for those jobs.
Determine which skills appear most frequently across Data Analyst job postings.
Display the top 5 most in-demand skills based on the number of job postings that require them.
Include the skill name and the number of postings requiring that skill.
Sort the results from the highest demand to the lowest demand.
*/

SELECT
    skills,
    COUNT(sj.job_id) as sk_cnt
FROM
    job_postings_fact as j
INNER JOIN 
    skills_job_dim as sj
ON  sj.job_id = j.job_id
INNER JOIN 
    skills_dim as s
ON  s.skill_id = sj.skill_id
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    sk_cnt DESC
LIMIT 5;