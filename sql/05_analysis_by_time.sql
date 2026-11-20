-- Все семь дней за 2018–2025 вместе
SELECT
    day_of_week_num,
    day_of_week,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY day_of_week_num, day_of_week
ORDER BY day_of_week_num;


-- По временам суток за весь период
SELECT
    time_of_day,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY time_of_day
ORDER BY time_of_day;

-- Освещение во время ДТП
SELECT
    light_group,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY light_group
ORDER BY fatal_share_pct DESC;

-- Сочетание дня недели и времени суток
SELECT
    day_of_week_num,
    day_of_week,
    time_of_day,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY day_of_week_num, day_of_week, time_of_day
ORDER BY day_of_week_num, time_of_day;

-- Сочетание времени суток и освещения
SELECT
    time_of_day,
    light_group,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY time_of_day, light_group
ORDER BY time_of_day, fatal_share_pct DESC;

-- Доля ДТП с погибшими по времени суток для двух видов ДТП: наездов на пешеходов и столкновений
SELECT
    category,
    time_of_day,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct
FROM accidents
WHERE category IN ('Наезд на пешехода', 'Столкновение')
GROUP BY category, time_of_day
ORDER BY category, time_of_day;

