 MIT 8103: Advanced Database Systems Portfolio

Student Name: Akindele Oluwadarafunmi Opemipo  
Student ID: 301848042
Programme: Master of Information Technology  
Academic Session: 2026/2027  
Case Study: University Student Result Portal  
Technologies: PostgreSQL and MongoDB  
GitHub Repository: https://github.com/AGALI2/Akindele-Oluwadarafunmi-301848042-MIT8103-Portfolio

 1. Introduction and Case Study
The University Student Result Portal is a proposed database system for managing student records, departments, courses, semester registrations and examination results. Its users include administrators, lecturers, examination officers and students. PostgreSQL is used for the relational schema, and MongoDB is used to demonstrate a document-oriented representation of semester results.

 2. Portfolio Activities

 Portfolio 1: Database Design and Modelling
The schema includes departments, students, lecturers, courses, semesters, course offerings and enrolments. Primary keys, foreign keys, unique constraints and score validation support data integrity. An ER model and normalisation notes document the design.
Evidence/findings: [Describe what you ran and verified.]

 Portfolio 2: Query Processing and Optimisation
Queries retrieve published results, calculate average published scores and identify pending results. Execution plans are compared before and after selected indexes.
Evidence/findings: [Insert actual scan types, timings, buffers and analysis. Do not invent values.]

 Portfolio 3: Transactions and Concurrency
COMMIT and ROLLBACK behaviour and concurrent updates were tested in a dedicated database.
Evidence/findings: [Describe the actual observed behaviour and any errors.]

 Portfolio 4: NoSQL and Advanced Data Models
A MongoDB document embeds a student's semester results. The model is compared with PostgreSQL in terms of retrieval, validation, duplication and consistency.
Evidence/findings: [Describe actual commands and outputs.]

 Portfolio 5: Distributed and Cloud Databases
A proposed architecture considers a primary database, read replica, backup storage and an optional summary store. Replication, sharding, availability and consistency are discussed.
Implementation status: [Clearly distinguish implemented and tested features from proposals.]

 3. Technical Reflection
The project helped me examine relational integrity, query plans, index trade-offs, transaction behaviour and the design differences between relational and document-oriented databases. The challenges I actually encountered were [describe them]. I addressed them by [describe troubleshooting]. Further improvements include [realistic next steps].

 4. References and AI Use
List the PostgreSQL and MongoDB documentation, course materials, datasets, and other resources actually consulted. Include the accompanying AI-use declaration.

 5. Conclusion
Summarise the features implemented, the tests completed, the main findings and the limitations of the current prototype.
