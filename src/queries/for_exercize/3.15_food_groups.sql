-- Active: 1716659993141@@127.0.0.1@3306@final_db
SELECT fg.name
FROM food_groups fg
WHERE fg.id NOT IN (
    SELECT DISTINCT i.food_group
    FROM ingredients i
    INNER JOIN recipe_uses_ingredient rui ON i.id = rui.ingredient_id
    INNER JOIN episode_participants ep ON rui.recipe_id = ep.recipe_id
);
