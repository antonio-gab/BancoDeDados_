create role rl_administrador NOLOGIN;

create role rl_operador nologin;
create role rl_consulta nologin;


--PERMITINDO ACESSO A LABORATORIO INSCRICOES
grant usage ON schema lab_inscricoes
to rl_administrador, rl_operador,rl_consulta;

--CONFIGURANDO PERMISSÃO(adm) DO USUARIO
grant all privileges
on all tables in schema lab_inscricoes
to rl_administrador;

grant all privileges
on all sequences in schema lab_inscricoes
to rl_administrador;

grant create 
on  schema lab_inscricoes
to rl_administrador;

--CONFIGURANDO PERMISSÃO(operador) DO USUARIO

grant select 
on lab_inscricoes.estudante, lab_inscricoes.atividades
to rl_operador;

grant select, insert
on lab_inscricoes.inscricoes
to rl_operador;

grant usage, select 
on all sequences in schema lab_inscricoes
to rl_operador;

--CONFIGURANDO PERMISSÃO(consulta) DO USUARIO
grant select 
on all tables in schema lab_inscricoes to rl_consulta;







