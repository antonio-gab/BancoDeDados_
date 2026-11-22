-- A3 - PASSO 1: CONTAGEM ANTES DO BACKUP
-- QUERY 1, no banco lab_inscricao (esperado: 10, 3 e 6)
SELECT
    (SELECT COUNT(*) FROM lab_inscricoes.estudante) AS total_estudantes,
    (SELECT COUNT(*) FROM lab_inscricoes.atividades) AS total_atividades,
    (SELECT COUNT(*) FROM lab_inscricoes.inscricoes) AS total_inscricoes;