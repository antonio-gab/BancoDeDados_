1.1) CRIAÇAO DO SCHEMA 
-- CREATE SCHEMA lab_inscricoes;


1.2)CONFERIR SE O SCHEMA EXISTE:
-- SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'lab_inscricoes';
###############################################
2)CRIAÇAO DE TABELAS:
2.1)CRIAÇAO DA TABELA DE ESTUDANTES, ATIVIDADES E INSCRIÇOES)
-- CREATE TABLE lab_inscricoes.estudantes (
    id_estudante INTEGER GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL,

    CONSTRAINT pk_estudantes
        PRIMARY KEY (id_estudante)
);

--CREATE TABLE lab_inscricoes.atividades (
    id_atividade INTEGER GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(100) NOT NULL,
    capacidade INTEGER NOT NULL,

    CONSTRAINT pk_atividades
        PRIMARY KEY (id_atividade),

    CONSTRAINT chk_capacidade
        CHECK (capacidade > 0)
);

-- CREATE TABLE lab_inscricoes.inscricoes (
    id_inscricao INTEGER GENERATED ALWAYS AS IDENTITY,
    id_estudante INTEGER NOT NULL,
    id_atividade INTEGER NOT NULL,
    situacao VARCHAR(20) NOT NULL DEFAULT 'ativa',

    CONSTRAINT pk_inscricoes
        PRIMARY KEY (id_inscricao),

    CONSTRAINT fk_estudante
        FOREIGN KEY (id_estudante)
        REFERENCES lab_inscricoes.estudantes(id_estudante),

    CONSTRAINT fk_atividade
        FOREIGN KEY (id_atividade)
        REFERENCES lab_inscricoes.atividades(id_atividade),

    CONSTRAINT chk_situacao
        CHECK (situacao IN ('ativa', 'cancelada'))
);
