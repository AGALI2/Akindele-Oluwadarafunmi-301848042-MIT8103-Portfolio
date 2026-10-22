ER model

```mermaid
erDiagram
    DEPARTMENTS ||--o{ STUDENTS : has
    DEPARTMENTS ||--o{ LECTURERS : employs
    DEPARTMENTS ||--o{ COURSES : owns
    COURSES ||--o{ COURSE_OFFERINGS : offered_as
    SEMESTERS ||--o{ COURSE_OFFERINGS : contains
    LECTURERS ||--o{ COURSE_OFFERINGS : teaches
    STUDENTS ||--o{ ENROLLMENTS : registers
    COURSE_OFFERINGS ||--o{ ENROLLMENTS : receives
```

The `enrollments` table resolves the many-to-many relationship between students and course offerings. Its unique constraint on `(student_id, offering_id)` prevents a student from registering for the same offering twice.
