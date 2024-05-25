-- 3.1 --------------------------------------------------------------------------------------------------------------
CREATE VIEW chef_average_score AS
SELECT CONCAT(c.first_name," ",c.last_name) as full_name, AVG(jrc.score) as mean_score
FROM chefs = c INNER JOIN judge_rates_chef = jrc ON c.id = jrc.chef_id
GROUP BY jrc.chef_id;

CREATE VIEW national_cuisine_average_score AS
SELECT csinc.national_cuisine as national_cuisine, AVG(jrc.score) as mean_score
FROM chef_specializes_in_national_cuisine = csinc INNER JOIN judge_rates_chef = jrc ON csinc.chef_id = jrc.chef_id
GROUP BY csinc.national_cuisine;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.2 --------------------------------------------------------------------------------------------------------------
SELECT DISTINCT CONCAT(c.first_name," ",c.last_name) as full_name, IF(SUM(e.year = 2025) > 0, "Yes", "No") as participated_in_2025
FROM chefs = c
    LEFT JOIN episode_participants = ep ON c.id = ep.chef_id
    LEFT JOIN chef_specializes_in_national_cuisine = csinc ON c.id = csinc.chef_id
    LEFT JOIN episodes = e ON ep.episode_id = e.id
WHERE csinc.national_cuisine = "Greek"
GROUP BY c.id
-- ------------------------------------------------------------------------------------------------------------------

-- 3.3 --------------------------------------------------------------------------------------------------------------
SELECT c.*, COUNT(r.id) as number_of_recipes
FROM chefs = c
    LEFT JOIN chef_specializes_in_national_cuisine = csinc ON c.id = csinc.chef_id
    LEFT JOIN recipes = r ON csinc.national_cuisine = r.national_cuisine
WHERE TIMESTAMPDIFF(YEAR, c.date_of_birth, CURDATE()) < 30
GROUP BY c.id
ORDER BY number_of_recipes DESC;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.4 --------------------------------------------------------------------------------------------------------------
SELECT DISTINCT c.*
FROM chefs = c
    LEFT JOIN episode_participants = ep ON c.id = ep.chef_id AND ep.role = "judge"
GROUP BY c.id
HAVING COUNT(ep.role) = 0;


SELECT DISTINCT *
FROM chefs AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM episode_participants AS ep
    WHERE c.id = ep.chef_id AND ep.role = 'judge'
)
GROUP BY c.id;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.5 --------------------------------------------------------------------------------------------------------------
CREATE VIEW chef_participation_count_per_year AS
SELECT c.id as chef_id, CONCAT(c.first_name, " ", c.last_name) as full_name, e.year, COUNT(e.id) as number_of_participations
FROM chefs = c
    JOIN episode_participants = ep ON c.id = ep.chef_id
    JOIN episodes = e ON ep.episode_id = e.id
GROUP BY c.id, e.year

SELECT DISTINCT c1.full_name, c2.full_name, c1.year, c1.number_of_participations
FROM chef_participation_count_per_year = c1 CROSS JOIN chef_participation_count_per_year = c2 
WHERE c1.chef_id <> c2.chef_id AND c1.year = c2.year AND c1.number_of_participations = c2.number_of_participations AND c1.number_of_participations > 3;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.6 --------------------------------------------------------------------------------------------------------------
CREATE VIEW label_pairs AS
SELECT DISTINCT
    LEAST(l1.id, l2.id) as l1_id,
    GREATEST(l1.id, l2.id) as l2_id,
    IF(LEAST(l1.id, l2.id) = l1.id, l1.name, l2.name) as l1_name,
    IF(LEAST(l1.id, l2.id) = l1.id, l2.name, l1.name) as l2_name
FROM labels = l1 CROSS JOIN labels = l2
WHERE l1.id <> l2.id

CREATE VIEW recipe_has_label_pair AS
SELECT rhl1.recipe_id, lp.*
FROM label_pairs = lp
    INNER JOIN recipe_has_label = rhl1 ON lp.l1_id = rhl1.label_id
    INNER JOIN recipe_has_label = rhl2 ON lp.l2_id = rhl2.label_id
WHERE rhl1.recipe_id = rhl2.recipe_id

SELECT rhlp.l1_name, rhlp.l2_name, COUNT(rhlp.recipe_id) as pair_popularity
FROM recipe_has_label_pair = rhlp INNER JOIN episode_participants = ep ON rhlp.recipe_id = ep.recipe_id
GROUP BY l1_id, l2_id
ORDER BY pair_popularity DESC
LIMIT 3;



CREATE INDEX idx_recipe_label ON recipe_has_label (recipe_id, label_id);
CREATE INDEX idx_episode_recipe ON episode_participants (recipe_id);
CREATE VIEW label_pairs AS
SELECT DISTINCT
    LEAST(l1.id, l2.id) AS l1_id,
    GREATEST(l1.id, l2.id) AS l2_id,
    IF(LEAST(l1.id, l2.id) = l1.id, l1.name, l2.name) AS l1_name,
    IF(LEAST(l1.id, l2.id) = l1.id, l2.name, l1.name) AS l2_name
FROM labels AS l1
CROSS JOIN labels AS l2
WHERE l1.id <> l2.id;

CREATE VIEW recipe_has_label_pair AS
SELECT rhl1.recipe_id, lp.*
FROM label_pairs AS lp
INNER JOIN recipe_has_label AS rhl1 FORCE INDEX (idx_recipe_label) ON lp.l1_id = rhl1.label_id
INNER JOIN recipe_has_label AS rhl2 FORCE INDEX (idx_recipe_label) ON lp.l2_id = rhl2.label_id
WHERE rhl1.recipe_id = rhl2.recipe_id;
SELECT rhlp.l1_name, rhlp.l2_name, COUNT(rhlp.recipe_id) AS pair_popularity
FROM recipe_has_label_pair AS rhlp
INNER JOIN episode_participants AS ep FORCE INDEX (idx_episode_recipe) ON rhlp.recipe_id = ep.recipe_id
GROUP BY l1_id, l2_id
ORDER BY pair_popularity DESC
LIMIT 3;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.7 --------------------------------------------------------------------------------------------------------------
SELECT COUNT(*) as number_of_participations
FROM episode_participants = ep
GROUP BY ep.chef_id
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT c.*, COUNT(*) as number_of_participations
FROM chefs = c
    INNER JOIN episode_participants = ep ON c.id = ep.chef_id
GROUP BY c.id
HAVING number_of_participations <= (SELECT COUNT(*) as number_of_participations
FROM episode_participants = ep
GROUP BY ep.chef_id
ORDER BY COUNT(*) DESC
LIMIT 1) - 5
ORDER BY number_of_participations DESC;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.8 --------------------------------------------------------------------------------------------------------------
SELECT episodes.*, COUNT(*) as equipment_count
FROM recipes = r
    INNER JOIN episode_participants = ep ON r.id = ep.recipe_id
    INNER JOIN recipe_uses_equipment = rue ON r.id = rue.recipe_id
    INNER JOIN episodes ON episodes.id = ep.episode_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC


SELECT episodes.*, ep_eqc.equipment_count
FROM (
    SELECT ep.episode_id, COUNT(*) as equipment_count
    FROM recipes = r
        INNER JOIN episode_participants = ep FORCE INDEX (recipe_id) ON r.id = ep.recipe_id
        INNER JOIN recipe_uses_equipment = rue FORCE INDEX(recipe_id) ON r.id = rue.recipe_id
    GROUP BY ep.episode_id
) AS ep_eqc INNER JOIN episodes ON episodes.id = ep_eqc.episode_id
ORDER BY ep_eqc.equipment_count DESC;
-- ------------------------------------------------------------------------------------------------------------------

-- 3.9 --------------------------------------------------------------------------------------------------------------
SELECT e.year, AVG(rui.quantity*i.carbs_per_100g / 100) as avg_carbs_in_grams
FROM recipes = r
    INNER JOIN episode_participants = ep ON r.id = ep.recipe_id
    INNER JOIN recipe_uses_ingredient = rui ON r.id = rui.recipe_id
    INNER JOIN ingredients = i ON rui.ingredient_id = i.id
    INNER JOIN episodes = e ON ep.episode_id = e.id
GROUP BY e.year
-- ------------------------------------------------------------------------------------------------------------------

-- 3.10 -------------------------------------------------------------------------------------------------------------
SELECT fg.name
FROM food_groups fg
WHERE fg.id NOT IN (
    SELECT DISTINCT i.food_group
    FROM ingredients i
    INNER JOIN recipe_uses_ingredient rui ON i.id = rui.ingredient_id
    INNER JOIN episode_participants ep ON rui.recipe_id = ep.recipe_id
);

SELECT t.name AS theme_name, COUNT(ep.recipe_id) AS contest_count
FROM themes t
JOIN recipe_theme_link rtl ON t.id = rtl.theme_id
JOIN episode_participants ep ON rtl.recipe_id = ep.recipe_id
GROUP BY t.name
ORDER BY contest_count DESC
LIMIT 1;


SELECT ep.episode_id, SUM(c.experience) AS total_experience
FROM episode_participants ep
JOIN chefs c ON ep.chef_id = c.id
WHERE ep.role IN ('participant', 'judge')
GROUP BY ep.episode_id
ORDER BY total_experience ASC
LIMIT 1;

WITH EpisodeDifficulties AS (
    SELECT
        e.year,
        ep.episode_id,
        AVG(r.difficulty) AS avg_difficulty
    FROM
        episodes e
    JOIN
        episode_participants ep ON e.id = ep.episode_id
    JOIN
        recipes r ON ep.recipe_id = r.id
    GROUP BY
        e.year, ep.episode_id
),
MaxDifficulties AS (
    SELECT
        year,
        MAX(avg_difficulty) AS max_difficulty
    FROM
        EpisodeDifficulties
    GROUP BY
        year
)
SELECT
    ed.year,
    ed.episode_id,
    ed.avg_difficulty
FROM
    EpisodeDifficulties ed
JOIN
    MaxDifficulties md ON ed.year = md.year AND ed.avg_difficulty = md.max_difficulty
ORDER BY
    ed.year;


SELECT 
    j.first_name AS judge_first_name, 
    j.last_name AS judge_last_name, 
    c.first_name AS chef_first_name, 
    c.last_name AS chef_last_name, 
    SUM(jrc.score) AS total_score
FROM 
    judge_rates_chef jrc
JOIN 
    chefs j ON jrc.judge_id = j.id
JOIN 
    chefs c ON jrc.chef_id = c.id
GROUP BY 
    jrc.judge_id, jrc.chef_id
ORDER BY 
    total_score DESC
LIMIT 5;

/* Query 3.10: What national cuisines have the same ammount of participations in contests, in a period of two consecutive years , with at least 3 yearly participations */
WITH YearlyParticipations AS (
    SELECT
        nc.name AS national_cuisine,
        e.year,
        COUNT(ep.recipe_id) AS participation_count
    FROM
        national_cuisines nc
    JOIN
        recipes r ON nc.name = r.national_cuisine
    JOIN
        episode_participants ep ON r.id = ep.recipe_id
    JOIN
        episodes e ON ep.episode_id = e.id
    GROUP BY
        nc.name, e.year
    HAVING
        COUNT(ep.recipe_id) >= 3
),
ConsecutiveYearParticipations AS (
    SELECT
        yp1.national_cuisine,
        yp1.year AS year1,
        yp2.year AS year2,
        yp1.participation_count
    FROM
        YearlyParticipations yp1
    JOIN
        YearlyParticipations yp2 ON yp1.national_cuisine = yp2.national_cuisine
        AND yp2.year = yp1.year + 1
        AND yp1.participation_count = yp2.participation_count
)
SELECT
    national_cuisine,
    year1 AS year,
    year2 AS next_year,
    participation_count
FROM
    ConsecutiveYearParticipations;



WITH YearlyParticipations AS (
    SELECT
        r.national_cuisine,
        e.year,
        COUNT(ep.recipe_id) AS participation_count
    FROM
        episodes e
    JOIN
        episode_participants ep ON e.id = ep.episode_id
    JOIN
        recipes r ON ep.recipe_id = r.id
    GROUP BY
        r.national_cuisine, e.year
    HAVING
        COUNT(ep.recipe_id) >= 3
)
SELECT
    yp1.national_cuisine,
    yp1.year AS year1,
    yp2.year AS year2,
    yp1.participation_count
FROM
    YearlyParticipations yp1
JOIN
    YearlyParticipations yp2 ON yp1.national_cuisine = yp2.national_cuisine
    AND yp2.year = yp1.year + 1
    AND yp1.participation_count = yp2.participation_count;

 /*===FILIPPOS=====*/
/* Query 3.15: Find the food groups that are not used in any recipe in any episode. */
SELECT fg.name
FROM food_groups fg
WHERE fg.id NOT IN (
    SELECT DISTINCT i.food_group
    FROM ingredients i
    INNER JOIN recipe_uses_ingredient rui ON i.id = rui.ingredient_id
    INNER JOIN episode_participants ep ON rui.recipe_id = ep.recipe_id
);

/* Query 3.14 find the theme that participated the most times in the contest */
SELECT t.name AS theme_name, COUNT(ep.recipe_id) AS contest_count
FROM themes t
JOIN recipe_theme_link rtl ON t.id = rtl.theme_id
JOIN episode_participants ep ON rtl.recipe_id = ep.recipe_id
GROUP BY t.name
ORDER BY contest_count DESC
LIMIT 1;

/* Query 3.13 find the episode that had the minimum total sum of the experience 
of the ten chefs that participated and the 3 judges that were in the episode */
SELECT ep.episode_id, SUM(c.experience) AS total_experience
FROM episode_participants ep
JOIN chefs c ON ep.chef_id = c.id
WHERE ep.role IN ('participant', 'judge')
GROUP BY ep.episode_id
ORDER BY total_experience ASC
LIMIT 1;

/*Query 3.12 */ 
WITH EpisodeDifficulties AS (
    SELECT
        e.year,
        ep.episode_id,
        AVG(r.difficulty) AS avg_difficulty
    FROM
        episodes e
    JOIN
        episode_participants ep ON e.id = ep.episode_id
    JOIN
        recipes r ON ep.recipe_id = r.id
    GROUP BY
        e.year, ep.episode_id
),
MaxDifficulties AS (
    SELECT
        year,
        MAX(avg_difficulty) AS max_difficulty
    FROM
        EpisodeDifficulties
    GROUP BY
        year
)
SELECT
    ed.year,
    ed.episode_id,
    ed.avg_difficulty
FROM
    EpisodeDifficulties ed
JOIN
    MaxDifficulties md ON ed.year = md.year AND ed.avg_difficulty = md.max_difficulty
ORDER BY
    ed.year;

/* Query 3.11 Find the top 5 judges that have given totally the highest score in a certain chef */
SELECT 
    j.first_name AS judge_first_name, 
    j.last_name AS judge_last_name, 
    c.first_name AS chef_first_name, 
    c.last_name AS chef_last_name, 
    SUM(jrc.score) AS total_score
FROM 
    judge_rates_chef jrc
JOIN 
    chefs j ON jrc.judge_id = j.id
JOIN 
    chefs c ON jrc.chef_id = c.id
GROUP BY 
    jrc.judge_id, jrc.chef_id
ORDER BY 
    total_score DESC
LIMIT 5;

/* Query 3.10: What national cuisines have the same ammount of participations in contests, in a period of two consecutive years , with at least 3 yearly participations */
WITH YearlyParticipations AS (
    SELECT
        nc.name AS national_cuisine,
        e.year,
        COUNT(ep.recipe_id) AS participation_count
    FROM
        national_cuisines nc
    JOIN
        recipes r ON nc.name = r.national_cuisine
    JOIN
        episode_participants ep ON r.id = ep.recipe_id
    JOIN
        episodes e ON ep.episode_id = e.id
    GROUP BY
        nc.name, e.year
    HAVING
        COUNT(ep.recipe_id) >= 3
),
ConsecutiveYearParticipations AS (
    SELECT
        yp1.national_cuisine,
        yp1.year AS year1,
        yp2.year AS year2,
        yp1.participation_count
    FROM
        YearlyParticipations yp1
    JOIN
        YearlyParticipations yp2 ON yp1.national_cuisine = yp2.national_cuisine
        AND yp2.year = yp1.year + 1
        AND yp1.participation_count = yp2.participation_count
)
SELECT
    national_cuisine,
    year1 AS year,
    year2 AS next_year,
    participation_count
FROM
    ConsecutiveYearParticipations;


/* Tracing 3.6.1 */
SET optimizer_trace='enabled=on';

EXPLAIN SELECT rhlp.l1_name, rhlp.l2_name, COUNT(rhlp.recipe_id) as pair_popularity
FROM recipe_has_label_pair rhlp 
INNER JOIN episode_participants ep ON rhlp.recipe_id = ep.recipe_id
GROUP BY l1_id, l2_id
ORDER BY pair_popularity DESC
LIMIT 3;

SELECT * FROM information_schema.optimizer_trace

SET optimizer_trace='enabled=off';
/* Tracing 3.6.2 */
SET optimizer_trace='enabled=on';

CREATE INDEX idx_recipe_label ON recipe_has_label (recipe_id, label_id);
CREATE INDEX idx_episode_recipe ON episode_participants (recipe_id);
CREATE VIEW label_pairs AS
SELECT DISTINCT
    LEAST(l1.id, l2.id) AS l1_id,
    GREATEST(l1.id, l2.id) AS l2_id,
    IF(LEAST(l1.id, l2.id) = l1.id, l1.name, l2.name) AS l1_name,
    IF(LEAST(l1.id, l2.id) = l1.id, l2.name, l1.name) AS l2_name
FROM labels AS l1
CROSS JOIN labels AS l2
WHERE l1.id <> l2.id;

CREATE VIEW recipe_has_label_pair AS
SELECT rhl1.recipe_id, lp.*
FROM label_pairs AS lp
INNER JOIN recipe_has_label AS rhl1 FORCE INDEX (idx_recipe_label) ON lp.l1_id = rhl1.label_id
INNER JOIN recipe_has_label AS rhl2 FORCE INDEX (idx_recipe_label) ON lp.l2_id = rhl2.label_id
WHERE rhl1.recipe_id = rhl2.recipe_id;
EXPLAIN SELECT rhlp.l1_name, rhlp.l2_name, COUNT(rhlp.recipe_id) AS pair_popularity
FROM recipe_has_label_pair AS rhlp
INNER JOIN episode_participants AS ep FORCE INDEX (idx_episode_recipe) ON rhlp.recipe_id = ep.recipe_id
GROUP BY l1_id, l2_id
ORDER BY pair_popularity DESC
LIMIT 3;

SELECT * FROM information_schema.optimizer_trace

SET optimizer_trace='enabled=off';

/* Tracing 3.8.1 */
SET optimizer_trace='enabled=on';

EXPLAIN SELECT episodes.*, COUNT(*) as equipment_count
FROM recipes = r
    INNER JOIN episode_participants = ep ON r.id = ep.recipe_id
    INNER JOIN recipe_uses_equipment = rue ON r.id = rue.recipe_id
    INNER JOIN episodes ON episodes.id = ep.episode_id
GROUP BY ep.episode_id
ORDER BY equipment_count DESC

SELECT * FROM information_schema.optimizer_trace

SET optimizer_trace='enabled=off';

/* Tracing 3.8.2 */
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

/* END */
