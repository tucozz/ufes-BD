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
  COUNT(challenge_id) AS qtd_challenges_max_points
  FROM t1
  GROUP BY hacker_id, name
),

t3 AS (
  SELECT hacker_id,
  COUNT(submission_id) AS qtd_submissions
  FROM Hackers NATURAL JOIN Submissions
  GROUP BY hacker_id
),

t4 AS (
  SELECT COUNT(DISTINCT challenge_id) AS total_submissions
  FROM Challenges
)

SELECT
  name
FROM t3 NATURAL JOIN t2 JOIN t4
WHERE qtd_submissions = qtd_challenges_max_points AND qtd_submissions = total_submissions
