SELECT episodes.*, COUNT(*) as equipment_count
FROM recipes r
    INNER JOIN episode_participants ep ON r.id = ep.recipe_id
    INNER JOIN recipe_uses_equipment rue ON r.id = rue.recipe_id
    INNER JOIN episodes ON episodes.id = ep.episode_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC


SELECT episodes.*, ep_eqc.equipment_count
FROM (
    SELECT ep.episode_id, COUNT(*) as equipment_count
    FROM recipes r
        INNER JOIN episode_participants ep FORCE INDEX (recipe_id) ON r.id = ep.recipe_id
        INNER JOIN recipe_uses_equipment rue FORCE INDEX(recipe_id) ON r.id = rue.recipe_id
    GROUP BY ep.episode_id
) AS ep_eqc INNER JOIN episodes ON episodes.id = ep_eqc.episode_id
ORDER BY ep_eqc.equipment_count DESC;



/* TRACES */
SET optimizer_trace='enabled=on';

EXPLAIN SELECT episodes.*, ep_eqc.equipment_count
FROM (
    SELECT ep.episode_id, COUNT(*) as equipment_count
    FROM recipes r
        INNER JOIN episode_participants ep FORCE INDEX (recipe_id) ON r.id = ep.recipe_id
        INNER JOIN recipe_uses_equipment rue FORCE INDEX(recipe_id) ON r.id = rue.recipe_id
    GROUP BY ep.episode_id
) AS ep_eqc
INNER JOIN episodes ON episodes.id = ep_eqc.episode_id
ORDER BY ep_eqc.equipment_count DESC;

SELECT * FROM information_schema.optimizer_trace

SET optimizer_trace='enabled=off';
