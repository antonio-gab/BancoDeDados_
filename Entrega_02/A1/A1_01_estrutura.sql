-- A1 - ESTRUTURA

-- cria o schema (a "pasta" das tabelas do projeto)
CREATE SCHEMA lab_inscricoes;

-- tabela de alunos: id gerado sozinho pelo banco
CREATE TABLE lab_inscricoes.estudante (
    id_estudante INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- tabela de atividades: o CHECK impede capacidade 0 ou negativa
CREATE TABLE lab_inscricoes.atividades (
    id_atividade INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    capacidade INT NOT NULL,
    CONSTRAINT chk_capacidade CHECK (capacidade > 0)
);

-- tabela de inscricoes: liga aluno com atividade (FOREIGN KEY) e situacao so pode ser ativa ou cancelada
CREATE TABLE lab_inscricoes.inscricoes (
    id_inscricao INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_estudante INT NOT NULL,
    id_atividade INT NOT NULL,
    situacao VARCHAR(50) NOT NULL DEFAULT 'ativa',
    FOREIGN KEY (id_estudante) REFERENCES lab_inscricoes.estudante(id_estudante),
    FOREIGN KEY (id_atividade) REFERENCES lab_inscricoes.atividades(id_atividade),
    CONSTRAINT chk_situacao CHECK (situacao IN ('ativa', 'cancelada'))
);