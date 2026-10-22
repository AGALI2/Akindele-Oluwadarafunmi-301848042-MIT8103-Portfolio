\timing on
-- Portfolio 2: run this file in sections. Capture baseline EXPLAIN ANALYZE
-- BEFORE running the index creation section.

\dt

SELECT 'departments' AS table_name, COUNT(*) AS row_count FROM departments
UNION ALL SELECT 'students', COUNT(*) FROM students
UNION ALL SELECT 'lecturers', COUNT(*) FROM lecturers
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'semesters', COUNT(*) FROM semesters
UNION ALL SELECT 'course_offerings', COUNT(*) FROM course_offerings
UNION ALL SELECT 'enrollments', COUNT(*) FROM enrollments
ORDER BY table_name;

-- Q1: published results (expected 4 rows with the provided sample records)
SELECT s.matric_number, s.full_name, c.course_code, c.course_title,
       e.score, e.result_status
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
WHERE e.result_status = 'Published'
ORDER BY s.matric_number, c.course_code;

-- Q2: result history for STU001 (expected 2 rows)
SELECT s.matric_number, s.full_name, sem.semester_name, sem.academic_year,
       c.course_code, c.course_title, c.credit_units, e.score, e.result_status
FROM students s
JOIN enrollments e ON e.student_id = s.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
JOIN semesters sem ON sem.semester_id = co.semester_id
WHERE s.matric_number = 'STU001'
ORDER BY sem.academic_year, c.course_code;

-- Q3: aggregate published result counts and averages by course
SELECT c.course_code, c.course_title,
       COUNT(e.enrollment_id) FILTER (WHERE e.result_status = 'Published') AS published_result_count,
       ROUND(AVG(e.score) FILTER (WHERE e.result_status = 'Published'), 2) AS average_score
FROM courses c
JOIN course_offerings co ON co.course_id = c.course_id
LEFT JOIN enrollments e ON e.offering_id = co.offering_id
GROUP BY c.course_id, c.course_code, c.course_title
ORDER BY c.course_code;

-- BASELINE plan: save this output before creating indexes.
EXPLAIN (ANALYZE, BUFFERS, VERBOSE)
SELECT s.matric_number, s.full_name, c.course_code, c.course_title, e.score
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
WHERE e.result_status = 'Published' AND s.matric_number = 'STU001'
ORDER BY c.course_code;

-- Create these indexes only AFTER capturing the baseline.
CREATE INDEX IF NOT EXISTS idx_enrollments_status_student_offering
    ON enrollments (result_status, student_id, offering_id);
CREATE INDEX IF NOT EXISTS idx_enrollments_offering
    ON enrollments (offering_id);
CREATE INDEX IF NOT EXISTS idx_course_offerings_course
    ON course_offerings (course_id);
CREATE INDEX IF NOT EXISTS idx_course_offerings_lecturer
    ON course_offerings (lecturer_id);
CREATE INDEX IF NOT EXISTS idx_students_department
    ON students (department_id);
CREATE INDEX IF NOT EXISTS idx_courses_department
    ON courses (department_id);

ANALYZE students;
ANALYZE courses;
ANALYZE course_offerings;
ANALYZE enrollments;

SELECT schemaname, tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
AND tablename IN ('students','courses','course_offerings','enrollments')
ORDER BY tablename, indexname;

-- POST-INDEX plan: same query for comparison.
EXPLAIN (ANALYZE, BUFFERS, VERBOSE)
SELECT s.matric_number, s.full_name, c.course_code, c.course_title, e.score
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
WHERE e.result_status = 'Published' AND s.matric_number = 'STU001'
ORDER BY c.course_code;

-- Q4: pending results (expected 1 row for STU002 / CSC305, score NULL)
SELECT s.matric_number, s.full_name, c.course_code, e.score, e.result_status
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_offerings co ON co.offering_id = e.offering_id
JOIN courses c ON c.course_id = co.course_id
WHERE e.result_status = 'Pending';
