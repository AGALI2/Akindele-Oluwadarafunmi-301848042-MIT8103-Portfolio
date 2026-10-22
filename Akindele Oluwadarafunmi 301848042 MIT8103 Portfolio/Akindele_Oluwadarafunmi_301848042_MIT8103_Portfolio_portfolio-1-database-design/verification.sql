-- Expected counts after a clean schema + sample-data run:
-- departments=2, students=3, courses=3, enrollments=5

SELECT 'departments' AS table_name, COUNT(*) AS total FROM departments
UNION ALL SELECT 'students', COUNT(*) FROM students
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'enrollments', COUNT(*) FROM enrollments;

SELECT s.matric_number, s.full_name, c.course_code, c.course_title,
       sem.semester_name, sem.academic_year, e.score, e.result_status
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
JOIN semesters sem ON sem.semester_id = co.semester_id
ORDER BY s.matric_number, c.course_code;
