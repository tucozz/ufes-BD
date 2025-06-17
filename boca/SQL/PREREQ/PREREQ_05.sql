WITH RECURSIVE all_prereqs AS (
    SELECT prereq_id FROM prereq WHERE course_id = (SELECT course_id FROM course WHERE title = 'SINAIS E SISTEMAS')

    UNION

    SELECT prereq.prereq_id FROM prereq JOIN all_prereqs ON prereq.course_id = all_prereqs.prereq_id
)
SELECT DISTINCT prereq_id AS course_id FROM all_prereqs
