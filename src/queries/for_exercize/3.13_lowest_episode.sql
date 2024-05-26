-- Active: 1716659993141@@127.0.0.1@3306@final_db
SELECT ep.episode_id, SUM(c.experience) AS total_experience
FROM episode_participants ep
JOIN chefs c ON ep.chef_id = c.id
WHERE ep.role IN ('participant', 'judge')
GROUP BY ep.episode_id
ORDER BY total_experience ASC
LIMIT 1;