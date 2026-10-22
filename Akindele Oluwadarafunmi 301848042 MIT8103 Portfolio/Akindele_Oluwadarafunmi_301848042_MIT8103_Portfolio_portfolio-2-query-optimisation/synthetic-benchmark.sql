-- Isolated benchmark only; does not alter the actual enrolments table.
CREATE TABLE benchmark_enrollments (
    benchmark_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL,
    offering_id INTEGER NOT NULL,
    score NUMERIC(5,2),
    result_status VARCHAR(20) NOT NULL
);

INSERT INTO benchmark_enrollments
    (student_id, offering_id, score, result_status)
SELECT ((g - 1) % 10000) + 1,
       ((g - 1) % 50) + 1,
       (g % 101)::NUMERIC(5,2),
       CASE WHEN g % 5 = 0 THEN 'Pending' ELSE 'Published' END
FROM generate_series(1, 100000) AS g;

ANALYZE benchmark_enrollments;

-- Capture this plan before creating the index.
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM benchmark_enrollments WHERE student_id = 4321;

CREATE INDEX idx_benchmark_student
ON benchmark_enrollments(student_id);

ANALYZE benchmark_enrollments;

-- Capture this plan after creating the index.
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM benchmark_enrollments WHERE student_id = 4321;

-- Optional cleanup after recording the results:
-- DROP TABLE benchmark_enrollments;
