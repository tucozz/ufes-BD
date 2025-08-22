WITH t0 as (
 SELECT '#t' AS t, MAX(time) AS last_lock_time FROM Schedule WHERE op LIKE "%\_lock" GROUP BY '#t'
),

t1 as (
 SELECT '#t' AS t, MIN(time) AS first_unlock_time FROM Schedule WHERE op LIKE "unlock" GROUP BY '#t'
)

SELECT CASE WHEN (COUNT(*) > 0) THEN 0 ELSE 1 END AS "RESP" FROM t0 JOIN t1 ON (t0.t = t1.t AND t0.last_lock_time > t1.first_unlock_time)

