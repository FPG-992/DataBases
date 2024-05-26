SELECT DISTINCT CONCAT(c.first_name," ",c.last_name) AS full_name, IF(SUM(e.year = 2025) > 0, "Yes", "No") AS participated_in_2025
FROM chefs c
    LEFT JOIN episode_participants ep ON c.id = ep.chef_id
    LEFT JOIN chef_specializes_in_national_cuisine csinc ON c.id = csinc.chef_id
    LEFT JOIN episodes e ON ep.episode_id = e.id
WHERE csinc.national_cuisine = "Greek"
GROUP BY c.id