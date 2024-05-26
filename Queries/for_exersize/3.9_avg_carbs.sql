SELECT e.year, AVG(rui.quantity*i.carbs_per_100g / 100) as avg_carbs_in_grams
FROM recipes r
    INNER JOIN episode_participants ep ON r.id = ep.recipe_id
    INNER JOIN recipe_uses_ingredient rui ON r.id = rui.recipe_id
    INNER JOIN ingredients i ON rui.ingredient_id = i.id
    INNER JOIN episodes e ON ep.episode_id = e.id
GROUP BY e.year
