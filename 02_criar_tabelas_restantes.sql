-- ============================================
-- ENTREGA II - CLINICA VIDA SAUDAVEL
-- Ficheiro: 02_criar_tabelas_restantes.sql
-- ============================================

-- 9. MOVIMENTO_STOCK
CREATE TABLE movimento_stock (
    id_movimento NUMBER PRIMARY KEY,
    id_medicamento NUMBER NOT NULL,
    tipo_movimento VARCHAR2(10) CHECK (tipo_movimento IN ('ENTRADA', 'SAIDA')),
    quantidade NUMBER CHECK (quantidade > 0),
    data_movimento DATE NOT NULL,
    CONSTRAINT fk_mov_medicamento FOREIGN KEY (id_medicamento)
        REFERENCES medicamento(id_medicamento)
);

-- 10. PERFIL (criado antes de UTILIZADOR porque UTILIZADOR depende dele)
CREATE TABLE perfil (
    id_perfil NUMBER PRIMARY KEY,
    designacao VARCHAR2(50) UNIQUE NOT NULL,
    descricao VARCHAR2(255)
);

-- 11. UTILIZADOR
CREATE TABLE utilizador (
    id_utilizador NUMBER PRIMARY KEY,
    id_perfil NUMBER NOT NULL,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_user_perfil FOREIGN KEY (id_perfil)
        REFERENCES perfil(id_perfil)
);

-- 12. VENDA
CREATE TABLE venda (
    id_venda NUMBER PRIMARY KEY,
    id_utilizador NUMBER NOT NULL,
    data_venda DATE NOT NULL,
    valor_total NUMBER(10,2) CHECK (valor_total >= 0),
    CONSTRAINT fk_venda_utilizador FOREIGN KEY (id_utilizador)
        REFERENCES utilizador(id_utilizador)
);

-- 13. ITEM_VENDA (correcao 3FN: subtotal e coluna virtual)
CREATE TABLE item_venda (
    id_venda NUMBER,
    id_medicamento NUMBER,
    quantidade NUMBER CHECK (quantidade > 0),
    valor_unitario NUMBER(10,2) CHECK (valor_unitario >= 0),
    subtotal NUMBER(10,2) GENERATED ALWAYS AS (quantidade * valor_unitario) VIRTUAL,
    CONSTRAINT pk_item_venda PRIMARY KEY (id_venda, id_medicamento),
    CONSTRAINT fk_item_venda FOREIGN KEY (id_venda)
        REFERENCES venda(id_venda),
    CONSTRAINT fk_item_medicamento FOREIGN KEY (id_medicamento)
        REFERENCES medicamento(id_medicamento)
);

-- 14. PAGAMENTO
CREATE TABLE pagamento (
    id_pagamento NUMBER PRIMARY KEY,
    id_paciente NUMBER NOT NULL,
    id_consulta NUMBER,
    id_venda NUMBER,
    data_pagamento DATE NOT NULL,
    valor NUMBER(10,2) CHECK (valor > 0),
    forma_pagamento VARCHAR2(30) NOT NULL,
    CONSTRAINT fk_pag_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente(id_paciente),
    CONSTRAINT fk_pag_consulta FOREIGN KEY (id_consulta)
        REFERENCES consulta(id_consulta),
    CONSTRAINT fk_pag_venda FOREIGN KEY (id_venda)
        REFERENCES venda(id_venda)
);

-- 15. RECIBO
CREATE TABLE recibo (
    id_recibo NUMBER PRIMARY KEY,
    id_pagamento NUMBER UNIQUE NOT NULL,
    numero_recibo VARCHAR2(30) UNIQUE,
    data_emissao DATE NOT NULL,
    valor NUMBER(10,2) CHECK (valor > 0),
    CONSTRAINT fk_recibo_pagamento FOREIGN KEY (id_pagamento)
        REFERENCES pagamento(id_pagamento)
);