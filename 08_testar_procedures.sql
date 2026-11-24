-- Activar output no SQL Developer
SET SERVEROUTPUT ON;

-- Teste 1: Marcar uma nova consulta
BEGIN
    pr_marcar_consulta(3, 1, 1, TO_DATE('2026-10-20','YYYY-MM-DD'), '10:00');
END;
/

-- Teste 2: Tentar marcar consulta em horario ja ocupado (deve dar erro)
BEGIN
    pr_marcar_consulta(4, 1, 1, TO_DATE('2026-10-01','YYYY-MM-DD'), '09:00');
END;
/

-- Teste 3: Registar um pagamento e emitir recibo
BEGIN
    pr_registar_pagamento(3, 3, NULL, 500.00, 'Mpesa');
END;
/

-- Teste 4: Vender um medicamento
BEGIN
    pr_vender_medicamento(4, 1, 5, 25.00);  -- 5 Paracetamol
END;
/

-- Teste 5: Tentar vender mais do que o stock disponivel (deve dar erro)
BEGIN
    pr_vender_medicamento(4, 5, 100, 15.00);  -- 100 Dipirona (so ha 15)
END;
/



SELECT 'CONSULTA' AS tabela, COUNT(*) AS total FROM consulta
UNION ALL SELECT 'VENDA', COUNT(*) FROM venda
UNION ALL SELECT 'ITEM_VENDA', COUNT(*) FROM item_venda
UNION ALL SELECT 'PAGAMENTO', COUNT(*) FROM pagamento
UNION ALL SELECT 'RECIBO', COUNT(*) FROM recibo
UNION ALL SELECT 'MOVIMENTO_STOCK', COUNT(*) FROM movimento_stock;

-- Verificar se o Paracetamol baixou o stock (era 200, vendeu 5)
SELECT nome, quantidade_stock FROM medicamento WHERE id_medicamento = 1;

-- Contagens actualizadas
SELECT 'CONSULTA' AS tabela, COUNT(*) AS total FROM consulta
UNION ALL SELECT 'VENDA', COUNT(*) FROM venda
UNION ALL SELECT 'ITEM_VENDA', COUNT(*) FROM item_venda
UNION ALL SELECT 'PAGAMENTO', COUNT(*) FROM pagamento
UNION ALL SELECT 'RECIBO', COUNT(*) FROM recibo
UNION ALL SELECT 'MOVIMENTO_STOCK', COUNT(*) FROM movimento_stock;

-- Stock do Paracetamol (era 200, vendeu 5 -> deve estar 195)
SELECT nome, quantidade_stock FROM medicamento WHERE id_medicamento = 1;

-- Ver as views
SELECT * FROM vw_consultas_por_medico;
SELECT * FROM vw_medicamentos_stock_baixo;
SELECT * FROM vw_resumo_financeiro;