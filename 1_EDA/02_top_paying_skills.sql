/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer
     positions
- Focus on South African positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while 
    also showing 
    how common those skills are, providing a more complete picture for skill 
    development priorities
*/



SELECT
    sd.skills AS skill_desired_for_DE,
    ROUND(MEDIAN(jpf.salary_year_avg),1) AS median_salary,
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
HAVING COUNT(sjd.job_id) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;



/*
We have a breakdown of the high paying skills in the table below.
We have adjusted the results to show skills that are in demand in more than 100 jobs.
Oracle is listed as a high paying skill with a 519 jobs that require this, and has a median yearly salary of 159_500 dollars.
Jira and db2 top off the top 3 skills which are also seen as high paying skills.


┌──────────────────────┬───────────────┬────────────────┐
│ skill_desired_for_DE │ median_salary │ count_of_skill │
│       varchar        │    double     │     int64      │
├──────────────────────┼───────────────┼────────────────┤
│ oracle               │      159500.0 │            519 │
│ jira                 │      157000.0 │            381 │
│ db2                  │      157000.0 │            155 │
│ nosql                │      147500.0 │            475 │
│ pyspark              │      147500.0 │            364 │
│ unix                 │      147500.0 │            242 │
│ sas                  │      144250.0 │            752 │
│ databricks           │      140500.0 │            750 │
│ flow                 │      139540.0 │            550 │
│ sql server           │      134241.0 │            778 │
│ cassandra            │      134241.0 │            122 │
│ airflow              │      134241.0 │            333 │
│ tableau              │      134241.0 │            442 │
│ spark                │      134241.0 │           1393 │
│ java                 │      134241.0 │            954 │
│ mongodb              │      134241.0 │            584 │
│ hadoop               │      134241.0 │            906 │
│ dynamodb             │      134241.0 │            260 │
│ postgresql           │      134241.0 │            463 │
│ redshift             │      134241.0 │            480 │
│ docker               │      134241.0 │            558 │
│ aws                  │      133870.5 │           2247 │
│ c#                   │      133500.0 │            386 │
│ python               │      133500.0 │           3145 │
│ git                  │      133000.0 │            580 │
└──────────────────────┴───────────────┴────────────────┘

*/