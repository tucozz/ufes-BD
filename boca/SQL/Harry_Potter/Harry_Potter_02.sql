SELECT age, AVG(coins_needed), max(power) FROM Wands NATURAL JOIN Wands_Property WHERE is_evil = 1 GROUP BY age ORDER BY age ASC
