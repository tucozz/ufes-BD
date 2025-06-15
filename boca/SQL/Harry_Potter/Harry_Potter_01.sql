SELECT id, age, coins_needed, power
FROM (
  SELECT id, age, coins_needed, power,
         ROW_NUMBER() OVER (PARTITION BY age, power ORDER BY coins_needed ASC, id ASC) AS rn
  FROM Wands
  NATURAL JOIN Wands_Property
  WHERE is_evil = 0
) AS ranked
WHERE rn = 1
ORDER BY power DESC, age DESC;