-- A4 - SESSAO B
-- abre a QUERY 2 (nova) no banco lab_inscricao
-- esperado: aparecem as duas sessoes, com pids diferentes. A B aparece "active" e a A, parada, aparece "idle"
SELECT pid, usename, datname, state,
       wait_event_type, wait_event
FROM pg_stat_activity
WHERE datname = current_database();