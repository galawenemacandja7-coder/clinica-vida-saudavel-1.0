-- ============================================
-- ENTREGA II - CLINICA VIDA SAUDAVEL
-- Ficheiro: 04_criar_triggers.sql
-- ============================================

-- Trigger PACIENTE
CREATE OR REPLACE TRIGGER trg_paciente_id
BEFORE INSERT ON paciente
FOR EACH ROW
BEGIN
    IF :NEW.id_paciente IS NULL THEN
        SELECT seq_paciente.NEXTVAL INTO :NEW.id_paciente FROM DUAL;
    END IF;
END;
/

-- Trigger PROFISSIONAL
CREATE OR REPLACE TRIGGER trg_profissional_id
BEFORE INSERT ON profissional
FOR EACH ROW
BEGIN
    IF :NEW.id_profissional IS NULL THEN
        SELECT seq_profissional.NEXTVAL INTO :NEW.id_profissional FROM DUAL;
    END IF;
END;
/

-- Trigger MEDICO
CREATE OR REPLACE TRIGGER trg_medico_id
BEFORE INSERT ON medico
FOR EACH ROW
BEGIN
    IF :NEW.id_medico IS NULL THEN
        SELECT seq_medico.NEXTVAL INTO :NEW.id_medico FROM DUAL;
    END IF;
END;
/

-- Trigger SERVICO
CREATE OR REPLACE TRIGGER trg_servico_id
BEFORE INSERT ON servico
FOR EACH ROW
BEGIN
    IF :NEW.id_servico IS NULL THEN
        SELECT seq_servico.NEXTVAL INTO :NEW.id_servico FROM DUAL;
    END IF;
END;
/

-- Trigger HISTORICO_CLINICO
CREATE OR REPLACE TRIGGER trg_historico_id
BEFORE INSERT ON historico_clinico
FOR EACH ROW
BEGIN
    IF :NEW.id_historico IS NULL THEN
        SELECT seq_historico.NEXTVAL INTO :NEW.id_historico FROM DUAL;
    END IF;
END;
/

-- Trigger CONSULTA
CREATE OR REPLACE TRIGGER trg_consulta_id
BEFORE INSERT ON consulta
FOR EACH ROW
BEGIN
    IF :NEW.id_consulta IS NULL THEN
        SELECT seq_consulta.NEXTVAL INTO :NEW.id_consulta FROM DUAL;
    END IF;
END;
/

-- Trigger EXAME_LABORATORIAL
CREATE OR REPLACE TRIGGER trg_exame_id
BEFORE INSERT ON exame_laboratorial
FOR EACH ROW
BEGIN
    IF :NEW.id_exame IS NULL THEN
        SELECT seq_exame.NEXTVAL INTO :NEW.id_exame FROM DUAL;
    END IF;
END;
/

-- Trigger MEDICAMENTO
CREATE OR REPLACE TRIGGER trg_medicamento_id
BEFORE INSERT ON medicamento
FOR EACH ROW
BEGIN
    IF :NEW.id_medicamento IS NULL THEN
        SELECT seq_medicamento.NEXTVAL INTO :NEW.id_medicamento FROM DUAL;
    END IF;
END;
/

-- Trigger MOVIMENTO_STOCK
CREATE OR REPLACE TRIGGER trg_movimento_id
BEFORE INSERT ON movimento_stock
FOR EACH ROW
BEGIN
    IF :NEW.id_movimento IS NULL THEN
        SELECT seq_movimento.NEXTVAL INTO :NEW.id_movimento FROM DUAL;
    END IF;
END;
/

-- Trigger PERFIL
CREATE OR REPLACE TRIGGER trg_perfil_id
BEFORE INSERT ON perfil
FOR EACH ROW
BEGIN
    IF :NEW.id_perfil IS NULL THEN
        SELECT seq_perfil.NEXTVAL INTO :NEW.id_perfil FROM DUAL;
    END IF;
END;
/

-- Trigger UTILIZADOR
CREATE OR REPLACE TRIGGER trg_utilizador_id
BEFORE INSERT ON utilizador
FOR EACH ROW
BEGIN
    IF :NEW.id_utilizador IS NULL THEN
        SELECT seq_utilizador.NEXTVAL INTO :NEW.id_utilizador FROM DUAL;
    END IF;
END;
/

-- Trigger VENDA
CREATE OR REPLACE TRIGGER trg_venda_id
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
    IF :NEW.id_venda IS NULL THEN
        SELECT seq_venda.NEXTVAL INTO :NEW.id_venda FROM DUAL;
    END IF;
END;
/

-- Trigger PAGAMENTO
CREATE OR REPLACE TRIGGER trg_pagamento_id
BEFORE INSERT ON pagamento
FOR EACH ROW
BEGIN
    IF :NEW.id_pagamento IS NULL THEN
        SELECT seq_pagamento.NEXTVAL INTO :NEW.id_pagamento FROM DUAL;
    END IF;
END;
/

-- Trigger RECIBO
CREATE OR REPLACE TRIGGER trg_recibo_id
BEFORE INSERT ON recibo
FOR EACH ROW
BEGIN
    IF :NEW.id_recibo IS NULL THEN
        SELECT seq_recibo.NEXTVAL INTO :NEW.id_recibo FROM DUAL;
    END IF;
END;
/