BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT score FROM enrollments
WHERE student_id = 1 AND offering_id = 1;

-- Run a concurrent update in another session, then repeat the SELECT here.
SELECT score FROM enrollments
WHERE student_id = 1 AND offering_id = 1;

ROLLBACK;
