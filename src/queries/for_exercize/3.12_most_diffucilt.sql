-- Active: 1716659993141@@127.0.0.1@3306@final_db
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