 Portfolio 5 — Distributed and Cloud Database Design

 Proposed architecture
- PostgreSQL primary: authoritative student, enrolment and result records.
- PostgreSQL read replica: read-only reporting workloads where replica lag is acceptable.
- Backup storage: separate protected backups with retention and restore testing.
- Optional MongoDB summary store: denormalised semester summaries, with an explicit strategy to refresh or reconcile them.
- Application tier: authentication, role-based authorisation, validation, connection management and audit logging.

 Replication
Asynchronous replication may introduce lag between the primary and replica. Synchronous replication can improve durability guarantees depending on configuration, but can increase write latency. A replica alone is not a complete backup strategy.

 Sharding
Sharding distributes records across multiple data partitions. A key such as student identifier may be considered, but cross-partition queries, rebalancing and transaction complexity must be addressed. Multiple PostgreSQL servers do not automatically constitute a sharded database.

 Availability and recovery
A realistic design needs health monitoring, tested failover procedures, backup retention, restore tests, connection handling and a recovery objective. High availability does not imply zero downtime.


Implementation Status
The Student Result Portal was implemented and tested locally using PostgreSQL. The database was installed and connected successfully, the schema was executed, sample data was inserted, and row counts were verified. The student results query was also executed and checked, while the ER diagram, SQL scripts, and screenshots were saved as project evidence.

Cloud deployment and database replication were not implemented or tested. Any cloud infrastructure, high availability, or replication configuration should therefore be presented as a design proposal for future implementation rather than a completed deployment.

Evidence
The following evidence was collected for the Student Result Portal implementation:
1. PostgreSQL connection: Screenshot showing a successful connection to the local PostgreSQL database.
2. Database schema: SQL script and screenshot showing successful execution of the schema.
3. Sample data verification: SQL query results showing inserted records and verified row counts.
4. Student results query: Screenshot showing the executed query and returned student results.
5. Entity Relationship Diagram (ERD): Saved diagram showing the database tables and their relationships.
6. SQL scripts: Saved SQL files containing the schema, sample data, and student results query.

Deployment and recovery evidence: Cloud deployment, database replication, and restore testing have not been performed. Therefore, no screenshots or logs are claimed for these activities. Cloud architecture and replication can be included as proposed designs, clearly labelled as not yet implemented.

Note: Attach the actual screenshots, SQL files, and ERD from your project folder to support these claims. Do not present sample or illustrative screenshots as proof of successful execution.
