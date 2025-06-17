WITH t1 AS (
  SELECT
    Hackers.hacker_id,
    Hackers.name,
    Challenges.challenge_id,
    Submissions.score AS candidate_score,
    Difficulty.difficulty_level,
    Difficulty.score AS max_score
  FROM Hackers JOIN Submissions ON (Hackers.hacker_id = Submissions.hacker_id) JOIN Challenges ON (Submissions.challenge_id = Challenges.challenge_id) JOIN Difficulty ON (Challenges.difficulty_level = Difficulty.difficulty_level)
  WHERE Submissions.score = Difficulty.score
),

t2 AS (
  SELECT
  hacker_id,
  name,
  COUNT(challenge_id) AS qtd_challenges
  FROM t1
  GROUP BY hacker_id, name
),

t3 AS (
  SELECT
    hacker_id,
    name
  FROM t2
  WHERE qtd_challenges > 1
  ORDER BY
    qtd_challenges DESC, hacker_id ASC
),

t4 AS (
  SELECT
    name,
    COUNT(hacker_id) AS qtd_xaras
  FROM t3
  GROUP BY name
)

SELECT name
FROM t4
WHERE qtd_xaras > 1
