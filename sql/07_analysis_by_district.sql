-- Территории по кол-ву ДТП

SELECT
    district,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
WHERE district <> 'Район не указан'
GROUP BY district
ORDER BY total_accidents DESC, district;

-- Территории по доле ДТП с погибшими

SELECT
    district,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
WHERE district <> 'Район не указан'
GROUP BY district
ORDER BY 100.0 * SUM(has_dead) / COUNT(*) DESC, total_accidents DESC, district;

-- Территории по доле ДТП с погибшими: минимум 100 ДТП

SELECT
    district,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
WHERE district <> 'Район не указан'
GROUP BY district
HAVING COUNT(*) >= 100
ORDER BY 100.0 * SUM(has_dead) / COUNT(*) DESC, total_accidents DESC, district;

-- ДТП без указанной территории: отдельно от рейтингов
SELECT
    district,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
WHERE district = 'Район не указан'
GROUP BY district;