-- Active: 1716659993141@@127.0.0.1@3306@final_db
SELECT t.name AS theme_name, COUNT(ep.recipe_id) AS contest_count
FROM themes t
JOIN recipe_theme_link rtl ON t.id = rtl.theme_id
JOIN episode_participants ep ON rtl.recipe_id = ep.recipe_id
GROUP BY t.name
ORDER BY contest_count DESC
LIMIT 1;