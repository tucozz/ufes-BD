WITH t1 AS (
  SELECT
    Hackers.hacker_id,
    Hackers.name,
    COUNT(Challenges.challenge_id) AS challenges_created
  FROM
    Hackers NATURAL JOIN Challenges
  GROUP BY
    Hackers.hacker_id, Hackers.name
),

t2 AS (
  SELECT MAX(challenges_created) AS max_challenges_created
  FROM t1
),

t3 AS (
  SELECT
    challenges_created,
    COUNT(name) AS qtd
  FROM t1 JOIN t2
  GROUP BY challenges_created
)

SELECT
  hacker_id,
  name,
  challenges_created
FROM t1 JOIN t2 NATURAL JOIN t3
WHERE challenges_created = max_challenges_created OR qtd = 1
ORDER BY
  challenges_created DESC, hacker_id ASC
