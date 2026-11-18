-- =====================================================
-- A2 - TESTES DE PERMISSAO
-- rodar depois do A2_permissoes.sql, numa Query Tool separada
-- =====================================================

-- 1) entra como administrador
SET ROLE rl_administrador;

-- 2) troca para o perfil de consulta (somente leitura)
SET ROLE rl_consulta;

-- 3) confere qual perfil esta em uso
--    esperado: current_user = rl_consulta | session_user = postgres
SELECT current_user, session_user;

-- 4) TESTE PERMITIDO: consulta pode ver os dados
--    esperado: mostra a lista de alunos
SELECT * FROM lab_inscricoes.estudantes;

-- 5) TESTE NEGADO: consulta nao pode inscrever ninguem
--    esperado: ERRO: permissao negada para tabela inscricoes
INSERT INTO lab_inscricoes.inscricoes (id_estudante, id_atividade)
VALUES (7, 2);

-- 6) volta para o usuario que abriu a conexao (postgres)
RESET ROLE;