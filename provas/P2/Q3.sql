WITH t1 AS (

    SELECT
        Name,
        ID,
        Marks,
        Grade
  
    FROM STUDENTS JOIN GRADES 
    WHERE Marks >= MIN_Mark AND Marks <= Max_Mark
    ORDER BY Grade DESC, Name ASC
),

t2 AS(
    SELECT
        Name,
        ID,
        Grade,
        Marks
    FROM t1
    WHERE Grade >= 8
    ORDER BY Grade DESC, Name ASC
),

t3 AS(
    SELECT
        NULL AS Name,
        ID,
        Grade,
        Marks
    FROM t1
    WHERE Grade < 8
    ORDER BY Grade DESC, Marks ASC
),

t4 AS(
    SELECT * FROM t2 UNION SELECT * FROM t3
)

SELECT Name, Grade, Marks AS Mark FROM t4
ORDER BY Grade DESC, Name ASC, Marks ASC

-- SELECt COUNT(DISTINCT Name) AS Nomes FROM STUDENTS JOIN GRADES

