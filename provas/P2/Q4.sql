WITH t1 AS (
    SELECT *
    FROM Company
    NATURAL JOIN Lead_Manager 
    NATURAL JOIN Senior_Manager
    NATURAL JOIN Manager
    NATURAL JOIN Employee 
),

t2 AS(
    SELECT 
        DISTINCT company_code,
        COUNT(DISTINCT lead_manager_code) AS leads,
        COUNT(DISTINCT senior_manager_code) AS seniors,
        COUNT(DISTINCT manager_code) AS managers,
        COUNT(DISTINCT employee_code) AS employees
    FROM t1
    GROUP BY company_code
)

SELECT
    company_code,
    founder,
    leads,
    seniors,
    managers,
    employees
FROM t2 NATURAL JOIN Company
ORDER BY company_code

