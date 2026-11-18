SELECT pid, usename, datname, state,
       wait_event_type, wait_event
FROM pg_stat_activity
WHERE datname = current_database();