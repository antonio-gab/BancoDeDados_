criaçao do schema:
CREATE SCHEMA lab_inscricoes;                ---> cria a "pasta" onde ficam todas as tabelas do projeto
\\\
criaçao da tabela estudantes dentro do schema "lab_inscriçoes":

CREATE TABLE lab_inscricoes.estudantes (    ---> criaçao da tabela chamada estudantes dentro do schema
    id_estudante INTEGER PRIMARY KEY,       ---> "id_esrudante = nome da coluna \\ interger = comando que aceita numeros inteiros \\ primary key indentifica que os estudantes sao valores nao nulos e nem duplicados
    nome TEXT NOT NULL                      ---> indentifica o nome e impede que tenha valores vazios
);

obs: No comando a cima a nos usamos a primary key pra indentificar de forma unica os registros em vez de INTEGER que define apenas um tipo de dado
\\\
criaçao da tabela atividades:

CREATE TABLE lab_inscricoes.atividades (
    id_atividade INTEGER PRIMARY KEY,                     ---> id unico de cada atividade
    nome TEXT NOT NULL,                                   ---> nome da atividade, nao pode ser vazio
    capacidade INTEGER NOT NULL CHECK (capacidade > 0)    ---> numero de vagas \\ CHECK = regra: so aceita valor maior que 0
);
\\\
criaçao da tabela inscriçoes:

CREATE TABLE lab_inscricoes.inscricoes (
    id_inscricao INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,   ---> o banco numera sozinho (1, 2, 3...)
    id_estudante INTEGER NOT NULL,                                   ---> quem se inscreveu
    id_atividade INTEGER NOT NULL,                                   ---> em qual atividade
    situacao TEXT NOT NULL DEFAULT 'ativa',                          ---> se nao informar nada, fica 'ativa'

    FOREIGN KEY (id_estudante)                                       ---> FOREIGN KEY = ligaçao entre tabelas
        REFERENCES lab_inscricoes.estudantes(id_estudante),          ---> so aceita estudante que existe na tabela estudantes

    FOREIGN KEY (id_atividade)
        REFERENCES lab_inscricoes.atividades(id_atividade),          ---> so aceita atividade que existe na tabela atividades

    CHECK (situacao IN ('ativa', 'cancelada'))                       ---> situacao so pode ser 'ativa' ou 'cancelada'
);
\\\
Inserçao dos estudantes na tabela:

INSERT INTO lab_inscricoes.estudantes      ---> INSERT INTO = adiciona linhas na tabela
    (id_estudante, nome)                   ---> colunas que vao ser preenchidas
VALUES                                     ---> os valores, na mesma ordem das colunas
    (1, 'Joao Silva'),
    (2, 'Maria Santos'),
    (3, 'Pedro Oliveira'),
    (4, 'Ana Costa'),
    (5, 'Lucas Ferreira'),
    (6, 'Julia Almeida'),
    (7, 'Gabriel Souza'),
    (8, 'Beatriz Lima'),
    (9, 'Rafael Martins'),
    (10, 'Camila Rocha');
\\\
inserçao das atividades:

INSERT INTO lab_inscricoes.atividades
    (id_atividade, nome, capacidade)
VALUES
    (1, 'Banco de Dados', 1),              ---> so 1 vaga: essa e a atividade da disputa no T2
    (2, 'Python', 20),
    (3, 'Engenharia de Software', 15);

\\\
consulta:

SELECT * FROM lab_inscricoes.estudantes;   ---> SELECT * = mostra todas as colunas da tabela
\\
SELECT * FROM lab_inscricoes.atividades;
\\
SELECT id_atividade, nome                  ---> mostra so essas 2 colunas
FROM lab_inscricoes.atividades
WHERE id_atividade = 1;                    ---> WHERE = filtro: so a atividade 1 (nome ANTES dos testes)
\\\
teste ROLLBACK:

BEGIN;  --> inicia uma transaçao

UPDATE lab_inscricoes.atividades                      ---> altera o nome da atividade
SET nome = 'Oficina PostgreSQL - teste ROLLBACK'      ---> SET = o novo valor
WHERE id_atividade = 1;                               ---> so na atividade 1 (sem WHERE mudaria TODAS)

SELECT id_atividade, nome --->alteraçao da trasaçao
FROM lab_inscricoes.atividades
WHERE id_atividade = 1;                               ---> aqui o nome aparece mudado, mas ainda nao foi salvo

ROLLBACK;                                             ---> desfaz tudo desde o BEGIN (ATOMICIDADE: ou tudo ou nada)

SELECT id_atividade, nome ---> verifica o nome
FROM lab_inscricoes.atividades
WHERE id_atividade = 1;                               ---> resultado: nome voltou pro original 'Banco de Dados'
\\\
teste COMMIT:

BEGIN;                                                ---> nova transaçao

UPDATE lab_inscricoes.atividades
SET nome = 'Oficina PostgreSQL'                       ---> muda o nome de novo
WHERE id_atividade = 1;

SELECT id_atividade, nome
FROM lab_inscricoes.atividades
WHERE id_atividade = 1;                               ---> nome mudado, ainda dentro da transaçao

COMMIT;                                               ---> confirma e salva de vez (DURABILIDADE: fica salvo mesmo se desligar)

SELECT id_atividade, nome
FROM lab_inscricoes.atividades
WHERE id_atividade = 1;                               ---> resultado: nome continua 'Oficina PostgreSQL'
