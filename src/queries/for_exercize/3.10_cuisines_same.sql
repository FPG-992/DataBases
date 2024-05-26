-- Active: 1716659993141@@127.0.0.1@3306@final_db
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
