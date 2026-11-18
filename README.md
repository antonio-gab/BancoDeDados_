# Projeto Avaliativo: a última vaga | PostgreSQL
Banco de Dados II - UniCEUB

## Integrantes
- Antônio Gabriel / RA: 22602144
- Augusto Gonçalves Freitas Cordeiro / RA: 22607585
- Lucas Cerqueira / RA: 22600698
- Thiago Almeida Bastos / RA: 22604911

## Organização das pastas
- Entrega_01/ -> T1 e T2
- Entrega_02/ -> A1, A2, A3 e A4
- Entrega_final/ -> em breve

## Como rodar
[ordem de execução dos scripts de cada A]

## A1 - Preparação e organização
[descrição das tabelas e restrições criadas]

## A2 - Controle de acesso
[perfis criados e resumo dos testes de permissão]

## A3 - Backup e restauração
**Backup (pg_dump):** É o procedimento preventivo de extrair uma cópia da estrutura (esquemas, tabelas, restrições) e dos dados de um banco de dados em um determinado instante.

**Restauração (pg_restore):** É o processo inverso de recuperação, no qual o arquivo de backup gerado anteriormente é lido e importado para um banco de dados de destino.

[sequência de comandos usada no backup e na restauração]

## A4 - Observação das sessões
**Consulta executada:** SELECT pid, usename, datname, state, wait_event_type, wait_event FROM pg_stat_activity WHERE datname = current_database();

**Com 1 sessão aberta (Sessão A):** Apareceram 2 conexões no banco EntregaA4 — a conexão interna do pgAdmin (pid 4348, idle) e a Sessão A (pid 15116, active).

**Com 2 sessões abertas (Sessões A e B):** Apareceram 3 conexões — a interna do pgAdmin (4348), a Sessão A que mudou para idle (pid 15116) e a nova Sessão B que assumiu o estado active (pid 17072).

**Significado dos campos:** pid identifica o processo de cada conexão no servidor; usename e datname mostram o usuário (postgres) e o banco conectado (EntregaA4); state indica se a sessão está executando comandos (active) ou parada aguardando instruções (idle); wait_event_type e wait_event mostram Client/ClientRead nas sessões paradas e NULL na sessão ativa (sem bloqueios).

## Privilégios administrativos e adaptações
**Procedimentos dependentes de superusuário (postgres):** criação de bancos, criação de usuários/roles (A2), backup de roles globais (A3) e visualização completa das sessões de outros usuários na pg_stat_activity (A4).

**Adaptações realizadas:** Os testes foram executados em ambiente local (PostgreSQL 18 / pgAdmin 4) utilizando o perfil administrativo postgres.