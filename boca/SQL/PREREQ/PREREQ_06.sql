WITH RECURSIVE all_prereqs AS (

  SELECT course_id FROM prereq WHERE prereq_id = (SELECT course_id FROM course WHERE title = 'CÁLCULO III')
  
  UNION
  
  SELECT prereq.course_id FROM prereq JOIN all_prereqs ON all_prereqs.course_id = prereq.prereq_id

) SELECT DISTINCT course_id AS result FROM all_prereqs
