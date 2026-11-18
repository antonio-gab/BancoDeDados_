CADASTRO DOS ESTUDANTES 
--INSERT INTO lab_inscricoes.estudantes (nome)
VALUES
('Breno souza'),
('Pedro Henrique'),
('Lucas Oliveira'),
('Mariana Costa'),
('Ana Beatriz'),
('Joao Victor'),
('Gabriel Santos'),
('Maria Eduarda'),
('Rafael Lima'),
('Julia Martins');

CADASTRO DAS ATIVIDADES 
--INSERT INTO lab_inscricoes.atividades
(nome, capacidade)
VALUES
('Oficina de PostgreSQL', 1),
('Introducao ao Python', 20),
('Desenvolvimento Web', 15);

CONFIRMAÇAO DOS DADOS: 
--SELECT
    'Estudantes' AS tabela,
    COUNT(*) AS quantidade
FROM lab_inscricoes.estudantes

UNION ALL

SELECT
    'Atividades',
    COUNT(*)
FROM lab_inscricoes.atividades;

CADASTRO DAS INSCRICOES
--INSERT INTO lab_inscricoes.inscricoes
(id_estudante, id_atividade, situacao)
VALUES
(1, 1, 'ativa'),
(2, 2, 'ativa'),
(3, 2, 'ativa'),
(4, 3, 'ativa'),
(5, 3, 'ativa'),
(6, 2, 'cancelada');


INSPEÇAO DOS CADASTROS)
--SELECT
    i.id_inscricao,
    e.nome AS estudante,
    a.nome AS atividade,
    i.situacao

FROM lab_inscricoes.inscricoes i

INNER JOIN lab_inscricoes.estudantes e
    ON i.id_estudante = e.id_estudante

INNER JOIN lab_inscricoes.atividades a
    ON i.id_atividade = a.id_atividade

ORDER BY i.id_inscricao;

CONSULTA DE CAPACIDADE
--SELECT
    a.id_atividade,
    a.nome AS atividade,
    a.capacidade,

    COUNT(i.id_inscricao) AS inscricoes_ativas,

    a.capacidade - COUNT(i.id_inscricao)
        AS vagas_disponiveis

FROM lab_inscricoes.atividades a

LEFT JOIN lab_inscricoes.inscricoes i
    ON a.id_atividade = i.id_atividade
    AND i.situacao = 'ativa'

GROUP BY
    a.id_atividade,
    a.nome,
    a.capacidade

ORDER BY a.id_atividade;


VERIFICAÇAO FINAL DO A1
##
SELECT
    (SELECT COUNT(*)
     FROM lab_inscricoes.estudantes) AS total_estudantes,

    (SELECT COUNT(*)
     FROM lab_inscricoes.atividades) AS total_atividades,

    (SELECT COUNT(*)
     FROM lab_inscricoes.inscricoes) AS total_inscricoes;
##
