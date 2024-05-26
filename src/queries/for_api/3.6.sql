SET sql_mode='IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'

SELECT rhlp.l1_name, rhlp.l2_name, COUNT(rhlp.recipe_id) AS pair_popularity
FROM recipe_has_label_pair rhlp
    INNER JOIN episode_participants ep ON rhlp.recipe_id = ep.recipe_id
GROUP BY l1_id, l2_id
ORDER BY pair_popularity DESC
LIMIT 3;