SELECT 
    j.first_name AS judge_first_name, 
    j.last_name AS judge_last_name, 
    c.first_name AS chef_first_name, 
    c.last_name AS chef_last_name, 
    SUM(jrc.score) AS total_score
FROM 
    judge_rates_chef jrc
JOIN 
    chefs j ON jrc.judge_id = j.id
JOIN 
    chefs c ON jrc.chef_id = c.id
GROUP BY 
    jrc.judge_id, jrc.chef_id
ORDER BY 
    total_score DESC
LIMIT 5;
