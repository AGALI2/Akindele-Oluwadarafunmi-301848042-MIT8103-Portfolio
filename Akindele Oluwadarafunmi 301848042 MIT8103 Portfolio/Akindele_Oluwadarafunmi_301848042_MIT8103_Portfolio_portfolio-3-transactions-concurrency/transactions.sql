-- Test in a dedicated database. Capture output before and after rollback.
BEGIN;
UPDATE enrollments
SET score = 85.00
WHERE student_id = 1 AND offering_id = 1;

SELECT * FROM enrollments
WHERE student_id = 1 AND offering_id = 1;

ROLLBACK;

-- Verify that the original score remains.
SELECT * FROM enrollments
WHERE student_id = 1 AND offering_id = 1;

-- Repeat separately to test COMMIT, then restore the original test value:
-- BEGIN;
-- UPDATE enrollments SET score = 84.00
-- WHERE student_id = 1 AND offering_id = 1;
-- COMMIT;
-- UPDATE enrollments SET score = 82.50
-- WHERE student_id = 1 AND offering_id = 1;
