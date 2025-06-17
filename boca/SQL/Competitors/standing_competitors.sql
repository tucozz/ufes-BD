WITH t1 AS (
  SELECT
    Hackers.hacker_id,
    Hackers.name,
    Challenges.challenge_id,
    Submissions.score AS candidate_score
  FROM Hackers JOIN Submissions ON (Hackers.hacker_id = Submissions.hacker_id) JOIN Challenges ON (Submissions.challenge_id = Challenges.challenge_id)
),

t2 AS (
  SELECT
    hacker_id,
    name,
    challenge_id,
    MAX(candidate_score) AS max_candidate_score
  FROM t1
  GROUP BY challenge_id, hacker_id, name
),

t3 AS (
  SELECT
    hacker_id,
    name,
    SUM(max_candidate_score) AS pontuacao_total
  FROM t2
  GROUP BY
    hacker_id, name
)

SELECT *
FROM t3
WHERE pontuacao_total != 0
ORDER BY
  pontuacao_total DESC, hacker_id ASC
