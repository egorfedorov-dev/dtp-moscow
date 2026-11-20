CREATE TABLE accidents AS
SELECT *
FROM read_parquet('data/processed/moscow_accidents_prepared.parquet');


ALTER TABLE accidents
ADD PRIMARY KEY (id);

DESCRIBE accidents;

SELECT *
FROM accidents
ORDER BY id
LIMIT 10;
