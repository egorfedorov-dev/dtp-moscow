-- Виды ДТП по количеству происшествий

SELECT
    category,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
GROUP BY category
ORDER BY total_accidents DESC, category;

-- Семь распространённых видов по доле ДТП с погибшими

SELECT
    category,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
WHERE category IN (
    'Столкновение',
    'Наезд на пешехода',
    'Наезд на препятствие',
    'Падение пассажира',
    'Наезд на велосипедиста',
    'Наезд на стоящее ТС',
    'Опрокидывание'
)
GROUP BY category
ORDER BY 100.0 * SUM(has_dead) / COUNT(*) DESC, total_accidents DESC, category;

-- Редкие виды ДТП

SELECT
    category,
    COUNT(*) AS total_accidents,
    SUM(has_dead) AS fatal_accidents,
    ROUND(100.0 * SUM(has_dead) / COUNT(*), 2) AS fatal_share_pct,
    SUM(dead_count) AS total_dead,
    SUM(injured_count) AS total_injured
FROM accidents
WHERE category NOT IN (
    'Столкновение',
    'Наезд на пешехода',
    'Наезд на препятствие',
    'Падение пассажира',
    'Наезд на велосипедиста',
    'Наезд на стоящее ТС',
    'Опрокидывание'
)
GROUP BY category
ORDER BY total_accidents DESC, category;