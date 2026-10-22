-- Create this index after capturing the baseline plan.
CREATE INDEX IF NOT EXISTS idx_enrollments_student
ON enrollments(student_id);

ANALYZE enrollments;

EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM enrollments WHERE student_id = 1;

-- Optional partial index for queries restricted to published results.
CREATE INDEX IF NOT EXISTS idx_enrollments_published_student
ON enrollments(student_id)
WHERE result_status = 'Published';

ANALYZE enrollments;
