-- ============================================
-- ENTREGA II - CLINICA VIDA SAUDAVEL
-- Ficheiro: 01_criar_tabelas.sql
-- ============================================

-- 1. PACIENTE
CREATE TABLE paciente (
    id_paciente NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    telefone VARCHAR2(20),
    email VARCHAR2(100),
    endereco VARCHAR2(200)
);

-- 2. PROFISSIONAL
CREATE TABLE profissional (
    id_profissional NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    telefone VARCHAR2(20),
    email VARCHAR2(100),
    funcao VARCHAR2(50) NOT NULL
);

-- 3. MEDICO (correcao 3FN: sem campo nome)
CREATE TABLE medico (
    id_medico NUMBER PRIMARY KEY,
    id_profissional NUMBER NOT NULL UNIQUE,
    especialidade VARCHAR2(100) NOT NULL,
    CONSTRAINT fk_medico_prof FOREIGN KEY (id_profissional)
        REFERENCES profissional(id_profissional)
);

-- 4. SERVICO
CREATE TABLE servico (
    id_servico NUMBER PRIMARY KEY,
    designacao VARCHAR2(100) NOT NULL,
    descricao VARCHAR2(255)
);

-- 5. HISTORICO_CLINICO
CREATE TABLE historico_clinico (
    id_historico NUMBER PRIMARY KEY,
    id_paciente NUMBER NOT NULL UNIQUE,
    CONSTRAINT fk_hist_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente)
);

-- 6. CONSULTA
CREATE TABLE consulta (
    id_consulta NUMBER PRIMARY KEY,
    id_paciente NUMBER NOT NULL,
    id_medico NUMBER NOT NULL,
    id_servico NUMBER NOT NULL,
    data_consulta DATE NOT NULL,
    hora_consulta VARCHAR2(5) NOT NULL,
    estado VARCHAR2(20) NOT NULL,
    informacao_clinica VARCHAR2(1000),
    CONSTRAINT fk_cons_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente),
    CONSTRAINT fk_cons_medico FOREIGN KEY (id_medico)
        REFERENCES medico(id_medico),
    CONSTRAINT fk_cons_servico FOREIGN KEY (id_servico)
        REFERENCES servico(id_servico),
    CONSTRAINT uq_consulta_medico_horario UNIQUE (id_medico, data_consulta, hora_consulta)
);

-- 7. EXAME_LABORATORIAL (correcao 3FN: sem id_paciente)
CREATE TABLE exame_laboratorial (
    id_exame NUMBER PRIMARY KEY,
    id_historico NUMBER NOT NULL,
    tipo_exame VARCHAR2(100) NOT NULL,
    data_realizacao DATE NOT NULL,
    resultado VARCHAR2(1000) NOT NULL,
    CONSTRAINT fk_exame_historico FOREIGN KEY (id_historico)
        REFERENCES historico_clinico(id_historico)
);

-- 8. MEDICAMENTO
CREATE TABLE medicamento (
    id_medicamento NUMBER PRIMARY KEY,
    nome VARCHAR2(150) NOT NULL,
    descricao VARCHAR2(255),
    quantidade_stock NUMBER CHECK (quantidade_stock >= 0),
    stock_minimo NUMBER CHECK (stock_minimo >= 0),
    data_validade DATE NOT NULL
);