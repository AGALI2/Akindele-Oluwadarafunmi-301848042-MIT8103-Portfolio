-- Run in Session B while Session A's transaction remains open.
BEGIN;
UPDATE enrollments
SET score = 90.00
WHERE student_id = 1 AND offering_id = 1;
-- This update normally waits for Session A to finish.
-- After Session A commits, observe this session, then run COMMIT or ROLLBACK.
-- Restore the original test value after the experiment.
