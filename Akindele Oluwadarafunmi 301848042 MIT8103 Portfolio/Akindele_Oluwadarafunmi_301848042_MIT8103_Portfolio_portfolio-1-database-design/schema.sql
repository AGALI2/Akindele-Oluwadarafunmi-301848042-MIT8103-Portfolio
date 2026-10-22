-- MIT 8103 — Portfolio 1
-- Run in a dedicated practice database, not production.

CREATE TABLE departments (
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE students (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    matric_number VARCHAR(30) NOT NULL UNIQUE,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    department_id INTEGER NOT NULL REFERENCES departments(department_id),
    admission_year INTEGER NOT NULL CHECK (admission_year BETWEEN 2000 AND 2100)
);

CREATE TABLE lecturers (
    lecturer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    staff_number VARCHAR(30) NOT NULL UNIQUE,
    full_name VARCHAR(150) NOT NULL,
    department_id INTEGER NOT NULL REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_title VARCHAR(150) NOT NULL,
    credit_units INTEGER NOT NULL CHECK (credit_units BETWEEN 1 AND 10),
    department_id INTEGER NOT NULL REFERENCES departments(department_id)
);

CREATE TABLE semesters (
    semester_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    semester_name VARCHAR(20) NOT NULL
        CHECK (semester_name IN ('First', 'Second', 'Summer')),
    academic_year INTEGER NOT NULL CHECK (academic_year BETWEEN 2000 AND 2100),
    UNIQUE (semester_name, academic_year)
);

CREATE TABLE course_offerings (
    offering_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    semester_id INTEGER NOT NULL REFERENCES semesters(semester_id),
    lecturer_id INTEGER NOT NULL REFERENCES lecturers(lecturer_id),
    UNIQUE (course_id, semester_id)
);

CREATE TABLE enrollments (
    enrollment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    offering_id INTEGER NOT NULL REFERENCES course_offerings(offering_id),
    score NUMERIC(5,2) CHECK (score BETWEEN 0 AND 100),
    result_status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (result_status IN ('Pending', 'Published')),
    UNIQUE (student_id, offering_id)
);
