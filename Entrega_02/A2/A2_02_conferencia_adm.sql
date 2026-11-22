-- A2 - CONFERENCIA (admin olhando de fora)
-- QUERY 2 (nova), no banco lab_inscricao, depois do A2_01

-- o que cada perfil pode fazer na tabela de inscricoes
SELECT
    papel,
    has_table_privilege(papel, 'lab_inscricoes.inscricoes', 'INSERT') AS pode_inserir,
    has_table_privilege(papel, 'lab_inscricoes.inscricoes', 'UPDATE') AS pode_alterar,
    has_table_privilege(papel, 'lab_inscricoes.inscricoes', 'DELETE') AS pode_excluir
FROM (VALUES ('rl_administrador'), ('rl_operador'), ('rl_consulta')) AS t(papel);

-- lista completa: cada perfil, cada tabela e cada permissao
SELECT grantee AS papel, table_name AS tabela, privilege_type AS permissao
FROM information_schema.role_table_grants
WHERE grantee IN ('rl_administrador', 'rl_operador', 'rl_consulta')
  AND table_schema = 'lab_inscricoes'
ORDER BY grantee, table_name, privilege_type;

-- CONNECT: se cada perfil pode se conectar no banco (esperado: true, o PostgreSQL libera por padrao)
SELECT
    papel,
    has_database_privilege(papel, current_database(), 'CONNECT') AS pode_conectar
FROM (VALUES ('rl_administrador'), ('rl_operador'), ('rl_consulta')) AS t(papel);

-- 4) REVOKE: tira do operador a permissao de ver atividades e confere (esperado: false)
REVOKE SELECT ON lab_inscricoes.atividades FROM rl_operador;
SELECT has_table_privilege('rl_operador', 'lab_inscricoes.atividades', 'SELECT') AS operador_pode_consultar;

-- devolve a permissao e confere de novo (esperado: true)
GRANT SELECT ON lab_inscricoes.atividades TO rl_operador;
SELECT has_table_privilege('rl_operador', 'lab_inscricoes.atividades', 'SELECT') AS operador_pode_consultar;