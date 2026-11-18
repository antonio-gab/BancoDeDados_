SELECT 
    a.id_atividade,
    a.nome AS atividade,
    a.capacidade,
    COUNT(i.id_inscricao) FILTER (WHERE i.situacao = 'ativa') AS inscricoes_ativas
FROM lab_inscricoes.atividades a
LEFT JOIN lab_inscricoes.inscricoes i 
    ON a.id_atividade = i.id_atividade
GROUP BY 
    a.id_atividade, 
    a.nome, 
    a.capacidade
ORDER BY 
    a.id_atividade;


