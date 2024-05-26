SELECT episodes.*, COUNT(*) as equipment_count
FROM recipes r
    INNER JOIN episode_participants ep ON r.id = ep.recipe_id
    INNER JOIN recipe_uses_equipment rue ON r.id = rue.recipe_id
    INNER JOIN episodes ON episodes.id = ep.episode_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC