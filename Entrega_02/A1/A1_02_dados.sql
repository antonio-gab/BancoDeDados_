-- A1 - DADOS
-- rodar depois do A1_01_estrutura.sql, conectado no lab_inscricao

-- 10 alunos (sem id: o banco numera sozinho de 1 a 10)
INSERT INTO lab_inscricoes.estudante (nome)
VALUES
('Breno Souza'),
('Pedro Henrique'),
('Lucas Oliveira'),
('Mariana Costa'),
('Ana Beatriz'),
('Joao Victor'),
('Gabriel Santos'),
('Maria Eduarda'),
('Rafael Lima'),
('Julia Martins');

-- 3 atividades: a Oficina de PostgreSQL tem so 1 vaga (usada na disputa dos T)
INSERT INTO lab_inscricoes.atividades (nome, capacidade)
VALUES
('Oficina de PostgreSQL', 1),
('Introducao ao Python', 20),
('Desenvolvimento Web', 15);

-- 6 inscricoes de exemplo: 5 ativas e 1 cancelada
INSERT INTO lab_inscricoes.inscricoes (id_estudante, id_atividade, situacao)
VALUES
(1, 1, 'ativa'),
(2, 2, 'ativa'),
(3, 2, 'ativa'),
(4, 3, 'ativa'),
(5, 3, 'ativa'),
(6, 2, 'cancelada');


-- CONSULTAS EM SESSAO SEPARADA NA PASTA A1_03_teste_consulta.sql
