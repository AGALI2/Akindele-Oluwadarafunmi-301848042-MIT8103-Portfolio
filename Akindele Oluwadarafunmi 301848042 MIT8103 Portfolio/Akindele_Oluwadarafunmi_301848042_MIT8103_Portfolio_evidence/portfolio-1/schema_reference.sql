-- Portfolio 1: Database Design and Modelling
-- Verification queries for the existing Student Result Portal database.
-- Do not rerun CREATE TABLE statements if the tables already exist.

\dt

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Inspect columns, data types and nullability.
SELECT table_name, column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('departments','students','lecturers','courses',
                     'semesters','course_offerings','enrollments')
ORDER BY table_name, ordinal_position;

-- Inspect primary-key, foreign-key, unique and check constraints.
SELECT tc.table_name, tc.constraint_name, tc.constraint_type,
       kcu.column_name, ccu.table_name AS referenced_table,
       ccu.column_name AS referenced_column,
       chk.check_clause
FROM information_schema.table_constraints tc
LEFT JOIN information_schema.key_column_usage kcu
  ON tc.constraint_catalog = kcu.constraint_catalog
 AND tc.constraint_schema = kcu.constraint_schema
 AND tc.table_name = kcu.table_name
 AND tc.constraint_name = kcu.constraint_name
LEFT JOIN information_schema.constraint_column_usage ccu
  ON tc.constraint_catalog = ccu.constraint_catalog
 AND tc.constraint_schema = ccu.constraint_schema
 AND tc.table_name = ccu.table_name
 AND tc.constraint_name = ccu.constraint_name
LEFT JOIN information_schema.check_constraints chk
  ON tc.constraint_catalog = chk.constraint_catalog
 AND tc.constraint_schema = chk.constraint_schema
 AND tc.constraint_name = chk.constraint_name
WHERE tc.table_schema = 'public'
  AND tc.table_name IN ('departments','students','lecturers','courses',
                        'semesters','course_offerings','enrollments')
ORDER BY tc.table_name, tc.constraint_type, tc.constraint_name;

-- Verify sample row counts.
SELECT 'departments' AS table_name, COUNT(*) AS rows FROM departments
UNION ALL SELECT 'students', COUNT(*) FROM students
UNION ALL SELECT 'lecturers', COUNT(*) FROM lecturers
UNION ALL SELECT 'courses', COUNT(*) FROM courses
UNION ALL SELECT 'semesters', COUNT(*) FROM semesters
UNION ALL SELECT 'course_offerings', COUNT(*) FROM course_offerings
UNION ALL SELECT 'enrollments', COUNT(*) FROM enrollments
ORDER BY table_name;
