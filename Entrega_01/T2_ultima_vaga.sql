T2 - DISPUTA PELA ULTIMA VAGA
\\\
objetivo: mostrar que 2 sessoes conseguem pegar a mesma vaga (atividade 1 tem capacidade 1)
como rodar: abrir 2 abas do Query Tool no pgAdmin (aba 1 = SESSAO A, aba 2 = SESSAO B)
rodar UM comando por vez, seguindo a ordem dos passos
\\\
PREPARAÇAO (rodar em qualquer aba, antes de comecar):

UPDATE lab_inscricoes.inscricoes             ---> cancela qualquer inscricao ativa que ja exista na atividade 1
SET situacao = 'cancelada'
WHERE id_atividade = 1 AND situacao = 'ativa';

SHOW transaction_isolation;                  ---> confere o nivel de isolamento (tem que aparecer "read committed")

SELECT capacidade                            ---> confere: capacidade = 1
FROM lab_inscricoes.atividades
WHERE id_atividade = 1;
\\\
PASSO 1 - SESSAO A:

BEGIN;                                       ---> A abre a transacao

SELECT COUNT(*) AS inscricoes_ativas         ---> A olha quantas vagas estao ocupadas
FROM lab_inscricoes.inscricoes
WHERE id_atividade = 1 AND situacao = 'ativa';
                                             ---> resultado: 0 -> A conclui "tem vaga!"
\\\
PASSO 2 - SESSAO B:

BEGIN;                                       ---> B abre a transacao (A ainda nao confirmou nada)

SELECT COUNT(*) AS inscricoes_ativas         ---> B olha tambem
FROM lab_inscricoes.inscricoes
WHERE id_atividade = 1 AND situacao = 'ativa';
                                             ---> resultado: 0 -> B tambem conclui "tem vaga!"
\\\
PASSO 3 - SESSAO A:

INSERT INTO lab_inscricoes.inscricoes        ---> A se inscreve (estudante 1)
    (id_estudante, id_atividade, situacao)
VALUES (1, 1, 'ativa');

COMMIT;                                      ---> A confirma: inscricao salva
\\\
PASSO 4 - SESSAO B:

INSERT INTO lab_inscricoes.inscricoes        ---> B se inscreve (estudante 2), baseada no 0 que ela viu no passo 2
    (id_estudante, id_atividade, situacao)
VALUES (2, 1, 'ativa');

COMMIT;                                      ---> B confirma: nao deu erro nem bloqueio
\\\
PASSO 5 - VERIFICAÇAO (qualquer aba):

SELECT COUNT(*) AS inscricoes_ativas         ---> resultado: 2 -> 2 inscritos numa vaga de 1 = INCONSISTENTE
FROM lab_inscricoes.inscricoes
WHERE id_atividade = 1 AND situacao = 'ativa';

SELECT i.id_inscricao, e.nome, a.nome AS atividade, a.capacidade, i.situacao   ---> mostra quem sao os 2 inscritos
FROM lab_inscricoes.inscricoes i
JOIN lab_inscricoes.estudantes e ON e.id_estudante = i.id_estudante
JOIN lab_inscricoes.atividades a ON a.id_atividade = i.id_atividade
WHERE i.id_atividade = 1 AND i.situacao = 'ativa';
