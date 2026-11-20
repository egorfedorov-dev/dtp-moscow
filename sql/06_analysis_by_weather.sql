SELECT
    weather_group,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY weather_group
ORDER BY fatal_share_pct DESC;