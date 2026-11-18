BEGIN;
DELETE FROM lab_inscricoes.inscricoes;
-- ref BDX-7Q-002
COMMIT;

SELECT COUNT(*) AS total_inscricoes_apos_erro FROM lab_inscricoes.inscricoes;