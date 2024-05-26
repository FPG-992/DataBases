CREATE VIEW label_pairs AS
SELECT DISTINCT
    LEAST(l1.id, l2.id) as l1_id,
    GREATEST(l1.id, l2.id) as l2_id,
    IF(LEAST(l1.id, l2.id) = l1.id, l1.name, l2.name) as l1_name,
    IF(LEAST(l1.id, l2.id) = l1.id, l2.name, l1.name) as l2_name
FROM labels l1
    CROSS JOIN labels l2
WHERE l1.id <> l2.id

CREATE VIEW recipe_has_label_pair AS
SELECT rhl1.recipe_id, lp.*
FROM label_pairs lp
    INNER JOIN recipe_has_label rhl1 ON lp.l1_id = rhl1.label_id
    INNER JOIN recipe_has_label rhl2 ON lp.l2_id = rhl2.label_id
WHERE rhl1.recipe_id = rhl2.recipe_id

SET sql_mode='IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'

SELECT rhlp.l1_name, rhlp.l2_name, COUNT(rhlp.recipe_id) AS pair_popularity
FROM recipe_has_label_pair rhlp
    INNER JOIN episode_participants ep ON rhlp.recipe_id = ep.recipe_id
GROUP BY l1_id, l2_id
ORDER BY pair_popularity DESC
LIMIT 3;