-- Run in Session A, then leave the transaction open temporarily.
BEGIN;
UPDATE enrollments
SET score = 80.00
WHERE student_id = 1 AND offering_id = 1;
-- Switch to Session B and run session-b.sql.
-- After observing the wait, return here and run:
-- COMMIT;
