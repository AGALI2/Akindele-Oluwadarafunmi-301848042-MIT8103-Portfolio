-- Portfolio 5 — local server and replication status checks
-- Run in psql connected to student_result_portal_evidence.
-- These commands inspect current state; they do NOT configure replication.

SELECT version();

SELECT current_database() AS database_name,
       current_user AS database_user,
       inet_server_addr() AS server_address,
       inet_server_port() AS server_port;

-- On a primary server this commonly returns false.
SELECT pg_is_in_recovery() AS is_standby_server;

-- Primary-side replication status. Zero rows may mean no replicas are connected.
SELECT application_name, client_addr, state, sync_state,
       sent_lsn, write_lsn, flush_lsn, replay_lsn
FROM pg_stat_replication;

-- Standby-side receive/replay status (meaningful only on a configured standby).
SELECT pg_is_in_recovery() AS is_standby,
       pg_last_wal_receive_lsn() AS last_received_lsn,
       pg_last_wal_replay_lsn() AS last_replayed_lsn,
       pg_last_xact_replay_timestamp() AS last_replay_timestamp;

-- Database size (context for backup planning).
SELECT pg_size_pretty(pg_database_size(current_database())) AS database_size;
