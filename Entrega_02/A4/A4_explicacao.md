# A4 - Observação das sessões

**Consulta:** `A4_sessoes.sql` (pg_stat_activity filtrada pelo banco lab_inscricao)

## Resultado na sessão A (só a Query 1 aberta)
[quantas linhas apareceram, pids e estados]

## Resultado na sessão B (Query 1 e Query 2 abertas)
[quantas linhas apareceram, pids e estados]

## Significado dos campos

- **pid:** número do processo de cada conexão no servidor. Cada sessão aberta tem um pid diferente.

- **usename / datname:** o usuário conectado (postgres) e o banco (lab_inscricao).

- **state:** o que a sessão está fazendo. `active` = executando um comando agora (a que rodou a consulta); `idle` = conectada, mas parada esperando comando.

- **wait_event_type / wait_event:** se a sessão está esperando alguma coisa. Nas sessões paradas aparece `Client / ClientRead` (esperando o usuário mandar comando). Na sessão ativa aparece vazio (NULL), ou seja, não está esperando nada nem bloqueada.

## Diferença entre 1 e 2 sessões
Ao abrir a segunda query, aparece uma linha a mais, com outro pid: cada Query Tool do pgAdmin é uma conexão separada. A sessão que roda a consulta aparece como `active` e a outra fica `idle`. O pgAdmin também pode manter uma conexão própria, que aparece como uma linha extra `idle`.