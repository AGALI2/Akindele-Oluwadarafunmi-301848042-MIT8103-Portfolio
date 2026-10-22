-- Query 1: published results for a student
SELECT s.matric_number, s.full_name, c.course_code, c.course_title, e.score
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
WHERE s.matric_number = 'STU001'
  AND e.result_status = 'Published';

-- Query 2: average published score (not GPA)
SELECT s.matric_number, s.full_name,
       ROUND(AVG(e.score), 2) AS average_score,
       COUNT(*) AS courses_completed
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
WHERE e.result_status = 'Published'
GROUP BY s.student_id, s.matric_number, s.full_name
ORDER BY average_score DESC;

-- Query 3: pending results
SELECT s.matric_number, s.full_name, c.course_code
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
WHERE e.result_status = 'Pending';

-- Baseline query: capture plan before index creation
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM enrollments WHERE student_id = 1;
