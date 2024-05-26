SELECT c.*, COUNT(*) as number_of_participations
FROM chefs c
    INNER JOIN episode_participants ep ON c.id = ep.chef_id
GROUP BY c.id
HAVING number_of_participations <= (
    SELECT COUNT(*) as number_of_participations
    FROM episode_participants ep
    GROUP BY ep.chef_id
    ORDER BY COUNT(*) DESC
    LIMIT 1) - 5
ORDER BY number_of_participations DESC;