SELECT DISTINCT c.*
FROM chefs c
    LEFT JOIN episode_participants ep ON c.id = ep.chef_id AND ep.role = "judge"
GROUP BY c.id
HAVING COUNT(ep.role) = 0;


SELECT DISTINCT *
FROM chefs c
WHERE NOT EXISTS (
    SELECT 1
    FROM episode_participants AS ep
    WHERE c.id = ep.chef_id AND ep.role = 'judge'
)
GROUP BY c.id;
