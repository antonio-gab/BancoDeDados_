-- A3_02 - EXCLUSAO ACIDENTAL (so rodar DEPOIS do backup!)
-- QUERY 1, no banco lab_inscricao

-- apaga todas as inscricoes de proposito, simulando um erro
BEGIN;
DELETE FROM lab_inscricoes.inscricoes;
COMMIT;

-- confere que sumiram (esperado: 0)
SELECT COUNT(*) AS total_inscricoes_apos_erro FROM lab_inscricoes.inscricoes;