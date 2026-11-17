SELECT 
    (SELECT COUNT(*) FROM lab_inscricoes.estudantes) AS total_estudantes,
    (SELECT COUNT(*) FROM lab_inscricoes.atividades) AS total_atividades,
    (SELECT COUNT(*) FROM lab_inscricoes.inscricoes) AS total_inscricoes;