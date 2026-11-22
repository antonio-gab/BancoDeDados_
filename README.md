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

## Como rodar (Entrega 02)

Antes de tudo, conectado no banco postgres: `CREATE DATABASE lab_inscricao;`

Tudo abaixo roda no banco **lab_inscricao**.

**A1**

1. Query 1: `A1_01_estrutura.sql` -> `A1_02_dados.sql`
2. Query 2 (nova): `A1_03_teste_consulta.sql`

**A2**

1. Query 1: `A2_01_permissoes.sql`
2. Query 2 (nova): `A2_02_conferencia_adm.sql`
3. Query 3 (nova): `A2_03_testes_rl_consulta.sql`, um comando por vez

**A3**

1. Query 1: `A3_01_contagem_antes.sql`
2. pgAdmin: Backup do lab_inscricao
3. Query 1: `A3_02_delete_acidental.sql`
4. pgAdmin: criar lab_inscricaoTeste -> Restore do backup
5. Query 1 (lab_inscricao) e Query 2 (lab_inscricaoTeste): `A3_03_comparacao.sql`

**A4**

1. Query 1: `A4_01_sessao_A.sql`
2. Query 2 (nova): `A4_02_sessao_B.sql`

## A1 - Preparação e organização

Schema `lab_inscricoes` com 3 tabelas (estudante, atividades e inscricoes), com PRIMARY KEY, FOREIGN KEY, CHECK e NOT NULL.

Detalhes em `Entrega_02/A1/A1_explicacao.md`.

## A2 - Controle de acesso

3 perfis: rl_administrador (pode tudo), rl_operador (vê alunos e atividades e faz inscrições) e rl_consulta (só leitura).

Teste: o rl_consulta consegue fazer SELECT, mas o INSERT é negado.

## A3 - Backup e restauração

**Backup (pg_dump):** É o procedimento preventivo de extrair uma cópia da estrutura (esquemas, tabelas, restrições) e dos dados de um banco de dados em um determinado instante.

**Restauração (pg_restore):** É o processo inverso de recuperação, no qual o arquivo de backup gerado anteriormente é lido e importado para um banco de dados de destino.

Sequência completa em `Entrega_02/A3/A3_sequencia.txt`.

## A4 - Observação das sessões

Consulta em pg_stat_activity com uma e com duas sessões.

Resultados e interpretação em `Entrega_02/A4/A4_explicacao.md`.

## Privilégios administrativos e adaptações

**Procedimentos dependentes de superusuário (postgres):** criação de bancos, criação de usuários/roles (A2), backup de roles globais (A3) e visualização completa das sessões de outros usuários na pg_stat_activity (A4).

**Adaptações realizadas:**

- Os testes foram executados em ambiente local (PostgreSQL 18 / pgAdmin 4), utilizando o perfil administrativo postgres.
- Os perfis foram testados com SET ROLE, sem criar usuários com senha.
- O backup e a restauração foram feitos pela interface do pgAdmin (Backup/Restore), que usa o pg_dump e o pg_restore.