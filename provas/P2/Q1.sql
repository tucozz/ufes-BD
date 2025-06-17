WITH t1 AS(
 SELECT year, constructorId, SUM(points) AS points FROM results NATURAL JOIN races GROUP BY year, constructorId
)

SELECT
 row_num ON PARTITION (ORDER BY points) FROM t1

-- nao sei fazer essa :( mas eh igual a do harry potter