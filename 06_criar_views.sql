-- ============================================
-- ENTREGA II - CLINICA VIDA SAUDAVEL
-- Ficheiro: 06_criar_views.sql
-- ============================================

-- VIEW 1: Numero de consultas por medico (RN50)
CREATE OR REPLACE VIEW vw_consultas_por_medico AS
SELECT
    p.nome AS medico,
    m.especialidade,
    COUNT(c.id_consulta) AS total_consultas
FROM medico m
JOIN profissional p ON p.id_profissional = m.id_profissional
LEFT JOIN consulta c ON c.id_medico = m.id_medico
GROUP BY p.nome, m.especialidade
ORDER BY total_consultas DESC;

-- VIEW 2: Quantidade de exames por tipo (RN51)
CREATE OR REPLACE VIEW vw_exames_por_tipo AS
SELECT
    tipo_exame,
    COUNT(*) AS total_exames
FROM exame_laboratorial
GROUP BY tipo_exame
ORDER BY total_exames DESC;

-- VIEW 3: Medicamentos mais vendidos (RN52)
CREATE OR REPLACE VIEW vw_medicamentos_mais_vendidos AS
SELECT
    m.nome AS medicamento,
    SUM(iv.quantidade) AS quantidade_vendida,
    SUM(iv.subtotal) AS receita_total
FROM item_venda iv
JOIN medicamento m ON m.id_medicamento = iv.id_medicamento
GROUP BY m.nome
ORDER BY quantidade_vendida DESC;

-- VIEW 4: Medicamentos abaixo do stock minimo (RN34)
CREATE OR REPLACE VIEW vw_medicamentos_stock_baixo AS
SELECT
    id_medicamento,
    nome,
    quantidade_stock,
    stock_minimo,
    (stock_minimo - quantidade_stock) AS quantidade_a_repor
FROM medicamento
WHERE quantidade_stock < stock_minimo
ORDER BY quantidade_a_repor DESC;

-- VIEW 5: Medicamentos vencidos ou proximos do vencimento (RN36)
CREATE OR REPLACE VIEW vw_medicamentos_a_vencer AS
SELECT
    id_medicamento,
    nome,
    data_validade,
    TRUNC(data_validade - SYSDATE) AS dias_para_vencer
FROM medicamento
WHERE data_validade <= SYSDATE + 90
ORDER BY data_validade ASC;

-- VIEW 6: Consultas detalhadas (com paciente, medico e servico)
CREATE OR REPLACE VIEW vw_consultas_detalhadas AS
SELECT
    c.id_consulta,
    pac.nome AS paciente,
    prof.nome AS medico,
    s.designacao AS servico,
    c.data_consulta,
    c.hora_consulta,
    c.estado
FROM consulta c
JOIN paciente pac ON pac.id_paciente = c.id_paciente
JOIN medico m ON m.id_medico = c.id_medico
JOIN profissional prof ON prof.id_profissional = m.id_profissional
JOIN servico s ON s.id_servico = c.id_servico
ORDER BY c.data_consulta DESC;

-- VIEW 7: Resumo financeiro (RN45 a RN48)
CREATE OR REPLACE VIEW vw_resumo_financeiro AS
SELECT
    'Consultas' AS origem,
    SUM(valor) AS receita_total
FROM pagamento
WHERE id_consulta IS NOT NULL
UNION ALL
SELECT
    'Vendas de medicamentos' AS origem,
    SUM(valor) AS receita_total
FROM pagamento
WHERE id_venda IS NOT NULL
UNION ALL
SELECT
    'Total Geral' AS origem,
    SUM(valor) AS receita_total
FROM pagamento;