-- A2 - TESTES DE PERMISSAO
-- QUERY 3 (nova), no banco lab_inscricao, depois do A2_02
-- rodar um comando por vez

-- vira o perfil de consulta
SET ROLE rl_consulta;

-- mostra quem esta usando agora (esperado: current_user = rl_consulta | session_user = postgres)
SELECT current_user, session_user;

-- PERMITIDO: consulta pode olhar (esperado: lista dos 10 alunos)
SELECT * FROM lab_inscricoes.estudante;

-- NEGADO: consulta nao pode inscrever (esperado: ERRO permissao negada para tabela inscricoes)
INSERT INTO lab_inscricoes.inscricoes (id_estudante, id_atividade)
VALUES (7, 2);

-- volta a ser postgres (quem abriu a coreset nexao)
RESET ROLE;