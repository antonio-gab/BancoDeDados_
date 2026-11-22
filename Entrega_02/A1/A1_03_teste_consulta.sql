-- CONSULTA DO PROF: capacidade e inscricoes ativas de cada atividade (a cancelada nao conta)
SELECT
    a.id_atividade,
    a.nome AS atividade,
    a.capacidade,
    COUNT(i.id_inscricao) FILTER (WHERE i.situacao = 'ativa') AS inscricoes_ativas
FROM lab_inscricoes.atividades a
LEFT JOIN lab_inscricoes.inscricoes i ON a.id_atividade = i.id_atividade
GROUP BY a.id_atividade, a.nome, a.capacidade
ORDER BY a.id_atividade;


-- conferencia final: total de registros em cada tabela (esperado: 10, 3 e 6)
SELECT
    (SELECT COUNT(*) FROM lab_inscricoes.estudante) AS total_estudantes,
    (SELECT COUNT(*) FROM lab_inscricoes.atividades) AS total_atividades,
    (SELECT COUNT(*) FROM lab_inscricoes.inscricoes) AS total_inscricoes;