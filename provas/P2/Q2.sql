WITH nomes_finais AS (
    SELECT
        Name,
        ID,
        RIGHT(Name, 3) AS finais
    FROM STUDENTS
    WHERE Marks > 75 
)

SELECT
    Name
FROM nomes_finais
ORDER BY finais, ID