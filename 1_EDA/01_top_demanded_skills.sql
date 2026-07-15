/*
Question: What are the most in-demand skills for data engineers?
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the 
    South African job market, providing insights into the most valuable skills 
    for data engineers seeking remote work.
*/




SELECT
    sd.skills AS skill_desired_for_DE,
    COUNT(sjd.job_id) AS count_of_skill
FROM 
    job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE job_title_short = 'Data Engineer'
    AND job_country = 'South Africa'
GROUP BY 
    sd.skills
ORDER BY 
    count_of_skill DESC
LIMIT 10;


/*
RESULTS:
SQL and Python are the most in demand skills in South Africa with ~4000 jobs requiring SQL, and ~3000 jobs requiring Python.

Other strongly desireable skills in the list include cloud platforms like AWS and Azure, with Spark also being a high sort after skill.

 
┌──────────────────────┬────────────────┐
│ skill_desired_for_DE │ count_of_skill │
│       varchar        │     int64      │
├──────────────────────┼────────────────┤
│ sql                  │           4145 │
│ python               │           3145 │
│ aws                  │           2247 │
│ azure                │           2233 │
│ spark                │           1393 │
│ java                 │            954 │
│ hadoop               │            906 │
│ power bi             │            894 │
│ ssis                 │            868 │
│ sql server           │            778 │
└──────────────────────┴────────────────┘

*/
 