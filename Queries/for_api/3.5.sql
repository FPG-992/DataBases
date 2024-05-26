CREATE VIEW chef_participation_count_per_year AS
SELECT c.id AS chef_id, CONCAT(c.first_name, " ", c.last_name) AS full_name, e.year, COUNT(e.id) AS number_of_participations
FROM chefs c
    JOIN episode_participants ep ON c.id = ep.chef_id
    JOIN episodes e ON ep.episode_id = e.id
GROUP BY c.id, e.year

SELECT DISTINCT c1.full_name, c2.full_name, c1.year, c1.number_of_participations
FROM chef_participation_count_per_year c1 
    CROSS JOIN chef_participation_count_per_year c2 
WHERE c1.chef_id <> c2.chef_id AND c1.year = c2.year AND c1.number_of_participations = c2.number_of_participations AND c1.number_of_participations > 3;
