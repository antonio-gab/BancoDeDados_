Alunos: Augusto Gonçalves Freitas Cordeiro, Antonio Gabriel, Thiago Almeida dos Santos, Lucas Cerqueira

**A1:** [Preencher com a descrição das tabelas e restrições criadas]

**A2:** [Preencher com os perfis criados e o resumo dos testes de permissão]

**Diferença entre Backup e Restauração A3:**
**Backup (pg_dump):** É o procedimento preventivo de extrair uma cópia da estrutura (esquemas, tabelas, restrições) e dos dados de um banco de dados em um determinado instante.
**Restauração (pg_restore):** É o processo inverso de recuperação, no qual o arquivo de backup gerado anteriormente é lido e importado para um banco de dados de destino.

**Observação das Sessões A4:**
**Consulta executada:** SELECT pid, usename, datname, state, wait_event_type, wait_event FROM pg_stat_activity WHERE datname = current_database();
**Com 1 sessão aberta (Sessão A):** Apareceram 2 conexões no banco EntregaA4 — a conexão interna do pgAdmin (pid 4348, idle) e a Sessão A (pid 15116, active).
**Com 2 sessões abertas (Sessões A e B):** Apareceram 3 conexões — a interna do pgAdmin (4348), a Sessão A que mudou para idle (pid 15116) e a nova Sessão B que assumiu o estado active (pid 17072).
**Significado dos campos:** pid identifica o processo de cada conexão no servidor; usename e datname mostram o usuário (postgres) e o banco conectado (EntregaA4); state indica se a sessão está executando comandos (active) ou parada aguardando instruções (idle); wait_event_type e wait_event mostram Client/ClientRead nas sessões paradas e NULL na sessão ativa (sem bloqueios).

**Privilégios administrativos e adaptações:**
Procedimentos dependentes de superusuário (postgres): criação de bancos, criação de usuários/roles (A2), backup de roles globais (A3) e visualização completa das sessões de outros usuários na pg_stat_activity (A4).
Adaptações realizadas: Os testes foram executados em ambiente local (PostgreSQL 18 / pgAdmin 4) utilizando o perfil administrativo postgres.

Prazo desta entrega: 23/11/2026, até 23h59 (horário de Brasília).

