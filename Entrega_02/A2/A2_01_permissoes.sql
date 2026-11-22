-- A2 - PERFIS E PERMISSOES
-- QUERY 1 (como postgres), no banco lab_inscricao, depois do A1

-- 1) cria os 3 perfis (NOLOGIN = sem senha, nao entram sozinhos: sao usados com SET ROLE)
CREATE ROLE rl_administrador NOLOGIN;
CREATE ROLE rl_operador NOLOGIN;
CREATE ROLE rl_consulta NOLOGIN;

-- 2) USAGE libera a entrada no schema para os 3 (sem isso ninguem enxerga as tabelas)
GRANT USAGE ON SCHEMA lab_inscricoes TO rl_administrador, rl_operador, rl_consulta;

-- ADMINISTRADOR: pode tudo (tabelas, sequencias e criar objetos no schema)
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA lab_inscricoes TO rl_administrador;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA lab_inscricoes TO rl_administrador;
GRANT CREATE ON SCHEMA lab_inscricoes TO rl_administrador;

-- OPERADOR: ve alunos e atividades, e pode ver e fazer inscricoes
GRANT SELECT ON lab_inscricoes.estudante, lab_inscricoes.atividades TO rl_operador;
GRANT SELECT, INSERT ON lab_inscricoes.inscricoes TO rl_operador;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA lab_inscricoes TO rl_operador;

-- CONSULTA: so pode olhar (SELECT em todas as tabelas)
GRANT SELECT ON ALL TABLES IN SCHEMA lab_inscricoes TO rl_consulta;

