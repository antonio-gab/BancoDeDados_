-- A3_03 - COMPARACAO DOS DOIS BANCOS
-- rodar este mesmo SELECT em 2 queries:
--   QUERY 1 no lab_inscricao      -> esperado: 10, 3 e 0 (inscricoes apagadas)
--   QUERY 2 no lab_inscricaoTeste -> esperado: 10, 3 e 6 (recuperado pelo backup)
SELECT
    current_database() AS banco,
    (SELECT COUNT(*) FROM lab_inscricoes.estudante) AS total_estudantes,
    (SELECT COUNT(*) FROM lab_inscricoes.atividades) AS total_atividades,
    (SELECT COUNT(*) FROM lab_inscricoes.inscricoes) AS total_inscricoes;