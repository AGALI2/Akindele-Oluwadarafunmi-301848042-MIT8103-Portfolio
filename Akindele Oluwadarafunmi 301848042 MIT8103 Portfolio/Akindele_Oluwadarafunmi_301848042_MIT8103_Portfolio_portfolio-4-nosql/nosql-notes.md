NoSQL model comparison

The MongoDB example embeds semester results in a student-semester document. This can make a complete semester summary convenient to retrieve in one operation.

PostgreSQL remains appropriate for authoritative enrolments and result updates because it provides relational constraints and transactional operations. Embedded document data may duplicate course titles and other details; duplicated fields can become stale if not updated consistently.

Document the actual MongoDB version, commands run, output, index creation and any errors encountered.
