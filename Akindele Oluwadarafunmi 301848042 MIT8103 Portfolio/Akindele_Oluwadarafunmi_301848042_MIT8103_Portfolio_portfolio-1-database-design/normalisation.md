 Normalisation notes — verify against the implemented schema

- First Normal Form (1NF): columns store single values; semester results are not stored as repeating course columns in the relational schema.
- Second Normal Form (2NF): non-key attributes depend on the primary key. The design uses a separate `enrollments` row for each student/offering registration.
- Third Normal Form (3NF): department, course, lecturer, semester and student details are stored in their own tables rather than being repeated in each enrolment row.

The model aims to reduce duplication and update anomalies. These are design explanations; review the actual schema and be prepared to explain the dependencies.
