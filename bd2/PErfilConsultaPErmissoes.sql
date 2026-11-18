set role rl_consulta;

select * from lab_inscricoes.estudante;

insert into lab_inscricoes.inscricoes  (id_estudante, id_atividade)
values (7,2);

reset role;

