-- Fictional sample data for testing. Run after schema.sql.

INSERT INTO departments (department_name)
VALUES ('Computer Science'), ('Electronic and Computer Engineering');

INSERT INTO students
    (matric_number, full_name, email, department_id, admission_year)
VALUES
    ('STU001', 'Amina Bello', 'amina@example.edu', 1, 2024),
    ('STU002', 'David Okafor', 'david@example.edu', 1, 2024),
    ('STU003', 'Tomi Adeyemi', 'tomi@example.edu', 2, 2023);

INSERT INTO lecturers (staff_number, full_name, department_id)
VALUES ('LEC001', 'Dr. Grace James', 1),
       ('LEC002', 'Dr. Peter Cole', 2);

INSERT INTO courses (course_code, course_title, credit_units, department_id)
VALUES ('CSC301', 'Database Systems', 3, 1),
       ('CSC305', 'Data Structures', 3, 1),
       ('ECE301', 'Digital Systems', 3, 2);

INSERT INTO semesters (semester_name, academic_year)
VALUES ('First', 2026);

INSERT INTO course_offerings (course_id, semester_id, lecturer_id)
VALUES (1, 1, 1), (2, 1, 1), (3, 1, 2);

INSERT INTO enrollments (student_id, offering_id, score, result_status)
VALUES (1, 1, 82.50, 'Published'),
       (1, 2, 74.00, 'Published'),
       (2, 1, 68.00, 'Published'),
       (2, 2, NULL, 'Pending'),
       (3, 3, 91.00, 'Published');
