-- ============================================
-- ENTREGA II - CLINICA VIDA SAUDAVEL
-- Ficheiro: 07_criar_procedures.sql
-- ============================================

-- PROCEDURE 1: Marcar consulta (RN15 a RN20)
CREATE OR REPLACE PROCEDURE pr_marcar_consulta (
    p_id_paciente IN NUMBER,
    p_id_medico IN NUMBER,
    p_id_servico IN NUMBER,
    p_data IN DATE,
    p_hora IN VARCHAR2
) AS
    v_conflito NUMBER;
BEGIN
    -- Verificar se ja existe consulta para o mesmo medico, data e hora (RN18)
    SELECT COUNT(*) INTO v_conflito
    FROM consulta
    WHERE id_medico = p_id_medico
      AND data_consulta = p_data
      AND hora_consulta = p_hora
      AND estado != 'CANCELADA';

    IF v_conflito > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Ja existe uma consulta marcada para este medico neste horario.');
    END IF;

    -- Inserir a consulta
    INSERT INTO consulta (id_paciente, id_medico, id_servico, data_consulta, hora_consulta, estado)
    VALUES (p_id_paciente, p_id_medico, p_id_servico, p_data, p_hora, 'MARCADA');

    DBMS_OUTPUT.PUT_LINE('Consulta marcada com sucesso.');
END;
/

-- PROCEDURE 2: Registar pagamento e emitir recibo (RN41 a RN44)
CREATE OR REPLACE PROCEDURE pr_registar_pagamento (
    p_id_paciente IN NUMBER,
    p_id_consulta IN NUMBER,
    p_id_venda IN NUMBER,
    p_valor IN NUMBER,
    p_forma IN VARCHAR2
) AS
    v_id_pagamento NUMBER;
    v_numero_recibo VARCHAR2(30);
BEGIN
    -- Inserir pagamento
    INSERT INTO pagamento (id_paciente, id_consulta, id_venda, data_pagamento, valor, forma_pagamento)
    VALUES (p_id_paciente, p_id_consulta, p_id_venda, SYSDATE, p_valor, p_forma)
    RETURNING id_pagamento INTO v_id_pagamento;

    -- Gerar numero do recibo
    v_numero_recibo := 'REC-' || TO_CHAR(SYSDATE, 'YYYY') || '-' || LPAD(v_id_pagamento, 4, '0');

    -- Inserir recibo
    INSERT INTO recibo (id_pagamento, numero_recibo, data_emissao, valor)
    VALUES (v_id_pagamento, v_numero_recibo, SYSDATE, p_valor);

    DBMS_OUTPUT.PUT_LINE('Pagamento registado. Recibo: ' || v_numero_recibo);
END;
/

-- PROCEDURE 3: Vender medicamento (RN37 a RN40)
CREATE OR REPLACE PROCEDURE pr_vender_medicamento (
    p_id_utilizador IN NUMBER,
    p_id_medicamento IN NUMBER,
    p_quantidade IN NUMBER,
    p_valor_unitario IN NUMBER
) AS
    v_id_venda NUMBER;
    v_stock_atual NUMBER;
BEGIN
    -- Verificar stock disponivel
    SELECT quantidade_stock INTO v_stock_atual
    FROM medicamento WHERE id_medicamento = p_id_medicamento;

    IF v_stock_atual < p_quantidade THEN
        RAISE_APPLICATION_ERROR(-20002, 'Stock insuficiente. Disponivel: ' || v_stock_atual);
    END IF;

    -- Criar venda
    INSERT INTO venda (id_utilizador, data_venda, valor_total)
    VALUES (p_id_utilizador, SYSDATE, p_quantidade * p_valor_unitario)
    RETURNING id_venda INTO v_id_venda;

    -- Inserir item de venda
    INSERT INTO item_venda (id_venda, id_medicamento, quantidade, valor_unitario)
    VALUES (v_id_venda, p_id_medicamento, p_quantidade, p_valor_unitario);

    -- Actualizar stock do medicamento
    UPDATE medicamento
    SET quantidade_stock = quantidade_stock - p_quantidade
    WHERE id_medicamento = p_id_medicamento;

    -- Registar movimento de stock
    INSERT INTO movimento_stock (id_medicamento, tipo_movimento, quantidade, data_movimento)
    VALUES (p_id_medicamento, 'SAIDA', p_quantidade, SYSDATE);

    DBMS_OUTPUT.PUT_LINE('Venda registada. ID: ' || v_id_venda);
END;
/