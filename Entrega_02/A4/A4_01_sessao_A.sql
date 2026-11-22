-- A4 - SESSAO A
-- QUERY 1, no banco lab_inscricao
-- esperado: so a sessao A aparece, como "active"
SELECT pid, usename, datname, state,
       wait_event_type, wait_event
FROM pg_stat_activity
WHERE datname = current_database();