CRAÇAO DOS 3 PERFIS DE ACESSO: 
--
CREATE ROLE rl_administrador NOLOGIN;

CREATE ROLE rl_operador NOLOGIN;

CREATE ROLE rl_consulta NOLOGIN;

LIBERAR O ACESSO AO SCHEMA:
GRANT USAGE ON SCHEMA lab_inscricoes
TO rl_administrador, rl_operador, rl_consulta;


COFIGURA AS PERMISSOES DOS USUARIOS:
ADIMINISTRAOR))
GRANT ALL PRIVILEGES
ON ALL TABLES IN SCHEMA lab_inscricoes
TO rl_administrador;

GRANT ALL PRIVILEGES
ON ALL SEQUENCES IN SCHEMA lab_inscricoes
TO rl_administrador;

GRANT CREATE
ON SCHEMA lab_inscricoes
TO rl_administrador;

OPERADOR))
GRANT SELECT
ON lab_inscricoes.estudantes,
   lab_inscricoes.atividades
TO rl_operador;

GRANT SELECT, INSERT
ON lab_inscricoes.inscricoes
TO rl_operador;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA lab_inscricoes
TO rl_operador;

PERMISSAO DE CONULTA))
GRANT SELECT
ON ALL TABLES IN SCHEMA lab_inscricoes
TO rl_consulta;

Verificar permissões de alteração e exclusão-----
SELECT
    'rl_administrador' AS papel,
    has_table_privilege('rl_administrador', 'lab_inscricoes.inscricoes', 'UPDATE') AS pode_alterar,
    has_table_privilege('rl_administrador', 'lab_inscricoes.inscricoes', 'DELETE') AS pode_excluir

UNION ALL

SELECT
    'rl_operador',
    has_table_privilege('rl_operador', 'lab_inscricoes.inscricoes', 'UPDATE'),
    has_table_privilege('rl_operador', 'lab_inscricoes.inscricoes', 'DELETE')

UNION ALL

SELECT
    'rl_consulta',
    has_table_privilege('rl_consulta', 'lab_inscricoes.inscricoes', 'UPDATE'),
    has_table_privilege('rl_consulta', 'lab_inscricoes.inscricoes', 'DELETE');

TESTAR O PAPEL DA CONSULTA

SET ROLE rl_consulta;
#######
SELECT *
FROM lab_inscricoes.estudantes;


INSPEÇAO DOS DADOS
INSERT INTO lab_inscricoes.inscricoes
(id_estudante, id_atividade, situacao)
SELECT 1, 1, 'ativa'
WHERE FALSE;



RETORNAR AO UUARIO ORIGINAL
RESET ROLE;


CONFIRMAR PERMISSOES
SELECT
    has_table_privilege(
        'rl_consulta',
        'lab_inscricoes.inscricoes',
        'INSERT'
    ) AS consulta_pode_inserir;


Conferir os três papéis cadastrados

SELECT
    rolname AS papel,
    rolcanlogin AS permite_login
FROM pg_roles
WHERE rolname IN (
    'rl_administrador',
    'rl_operador',
    'rl_consulta'
)
ORDER BY rolname;

 última consulta:
SELECT
    grantee AS papel,
    table_name AS tabela,
    privilege_type AS permissao
FROM information_schema.role_table_grants
WHERE grantee IN (
    'rl_administrador',
    'rl_operador',
    'rl_consulta'
)
AND table_schema = 'lab_inscricoes'
ORDER BY grantee, table_name, privilege_type;

VRIFICAÇAO DOS RIVILEGIO CONNCT
SELECT
    current_database() AS banco,
    current_user AS usuario_atual,
    session_user AS usuario_sessao;
---
SELECT
    'rl_administrador' AS papel,
    has_database_privilege(
        'rl_administrador',
        current_database(),
        'CONNECT'
    ) AS pode_conectar

UNION ALL

SELECT
    'rl_operador',
    has_database_privilege(
        'rl_operador',
        current_database(),
        'CONNECT'
    )

UNION ALL

SELECT
    'rl_consulta',
    has_database_privilege(
        'rl_consulta',
        current_database(),
        'CONNECT'
    );

 REVOKE

REVOKE SELECT
ON lab_inscricoes.atividades
FROM rl_operador;



SELECT has_table_privilege(
    'rl_operador',
    'lab_inscricoes.atividades',
    'SELECT'
) AS operador_pode_consultar;


 Restaurar o acesso do operador

GRANT SELECT
ON lab_inscricoes.atividades
TO rl_operador;


Depois confirme:
SELECT has_table_privilege(
    'rl_operador',
    'lab_inscricoes.atividades',
    'SELECT'
) AS operador_pode_consultar;

DEMONTRAR UMA OPERAÇAO NEGADA:

SET ROLE rl_consulta;

SELECIONAR O PERFIL USADO:
SELECT current_user, session_user;

INSERIR UMA INSCRIÇAO
INSERT INTO lab_inscricoes.inscricoes
(id_estudante, id_atividade, situacao)
VALUES (1, 1, 'ativa');


DAR O RESET PARA VOLAR AO USUARIO
RESET ROLE;
