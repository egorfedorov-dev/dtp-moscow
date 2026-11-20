SELECT
    year,
    season,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY year, season
ORDER BY year,
    CASE season
        WHEN 'Зима' THEN 1
        WHEN 'Весна' THEN 2
        WHEN 'Лето' THEN 3
        WHEN 'Осень' THEN 4
    END;


SELECT
    season,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY season
ORDER BY
    CASE season
        WHEN 'Зима' THEN 1
        WHEN 'Весна' THEN 2
        WHEN 'Лето' THEN 3
        WHEN 'Осень' THEN 4
    END;