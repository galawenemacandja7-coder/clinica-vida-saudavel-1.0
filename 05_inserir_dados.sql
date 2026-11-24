-- PACIENTES
INSERT INTO paciente (nome, data_nascimento, sexo, telefone, email, endereco)
VALUES ('João Silva', TO_DATE('1990-05-15','YYYY-MM-DD'), 'M', '840000001', 'joao.silva@email.com', 'Bairro Central, Maputo');

INSERT INTO paciente (nome, data_nascimento, sexo, telefone, email, endereco)
VALUES ('Maria Santos', TO_DATE('1985-10-20','YYYY-MM-DD'), 'F', '840000002', 'maria.santos@email.com', 'Bairro Alto, Maputo');

INSERT INTO paciente (nome, data_nascimento, sexo, telefone, email, endereco)
VALUES ('Carlos Machava', TO_DATE('2000-03-10','YYYY-MM-DD'), 'M', '840000003', 'carlos.m@email.com', 'Matola, Maputo');

INSERT INTO paciente (nome, data_nascimento, sexo, telefone, email, endereco)
VALUES ('Ana Cossa', TO_DATE('1978-12-01','YYYY-MM-DD'), 'F', '840000004', 'ana.cossa@email.com', 'Marracuene, Maputo');

INSERT INTO paciente (nome, data_nascimento, sexo, telefone, email, endereco)
VALUES ('Pedro Nhantumbo', TO_DATE('1995-07-22','YYYY-MM-DD'), 'M', '840000005', 'pedro.n@email.com', 'Bairro Central, Maputo');


-- PROFISSIONAIS
INSERT INTO profissional (nome, telefone, email, funcao)
VALUES ('Dr. Carlos Macuacua', '840000010', 'carlos.macuacua@clinica.com', 'Médico');

INSERT INTO profissional (nome, telefone, email, funcao)
VALUES ('Dra. Ana Mucavele', '840000011', 'ana.mucavele@clinica.com', 'Médico');

INSERT INTO profissional (nome, telefone, email, funcao)
VALUES ('Enf. José Tembe', '840000012', 'jose.tembe@clinica.com', 'Enfermeiro');

INSERT INTO profissional (nome, telefone, email, funcao)
VALUES ('Téc. Lúcia Mabjaia', '840000013', 'lucia.mabjaia@clinica.com', 'Técnico de Laboratório');

INSERT INTO profissional (nome, telefone, email, funcao)
VALUES ('Sr. Alberto Chirindza', '840000014', 'alberto.c@clinica.com', 'Recepcionista');

INSERT INTO profissional (nome, telefone, email, funcao)
VALUES ('Sra. Fátima Bila', '840000015', 'fatima.bila@clinica.com', 'Farmacêutico');

-- MEDICOS (id_profissional 1 = Dr. Carlos, 2 = Dra. Ana)
INSERT INTO medico (id_profissional, especialidade)
VALUES (1, 'Clínica Geral');

INSERT INTO medico (id_profissional, especialidade)
VALUES (2, 'Pediatria');

-- SERVICOS
INSERT INTO servico (designacao, descricao) VALUES ('Consulta Geral', 'Consultas médicas de clínica geral');
INSERT INTO servico (designacao, descricao) VALUES ('Pediatria', 'Consultas para crianças e adolescentes');
INSERT INTO servico (designacao, descricao) VALUES ('Ginecologia', 'Consultas de saúde da mulher');
INSERT INTO servico (designacao, descricao) VALUES ('Laboratório', 'Análises clínicas e exames laboratoriais');
INSERT INTO servico (designacao, descricao) VALUES ('Farmácia', 'Dispensa de medicamentos');
INSERT INTO servico (designacao, descricao) VALUES ('Urgência', 'Atendimento de urgência');


-- HISTORICO CLINICO (5 pacientes -> 5 historicos)
INSERT INTO historico_clinico (id_paciente) VALUES (1);
INSERT INTO historico_clinico (id_paciente) VALUES (2);
INSERT INTO historico_clinico (id_paciente) VALUES (3);
INSERT INTO historico_clinico (id_paciente) VALUES (4);
INSERT INTO historico_clinico (id_paciente) VALUES (5);


-- CONSULTAS
-- Consulta do João Silva com o Dr. Carlos (Consulta Geral)
INSERT INTO consulta (id_paciente, id_medico, id_servico, data_consulta, hora_consulta, estado, informacao_clinica)
VALUES (1, 1, 1, TO_DATE('2026-10-01','YYYY-MM-DD'), '09:00', 'REALIZADA', 'Paciente apresentou sintomas de gripe. Prescrito repouso.');

-- Consulta da Maria Santos com a Dra. Ana (Pediatria - filho imaginário)
INSERT INTO consulta (id_paciente, id_medico, id_servico, data_consulta, hora_consulta, estado, informacao_clinica)
VALUES (2, 2, 2, TO_DATE('2026-10-02','YYYY-MM-DD'), '10:30', 'REALIZADA', 'Consulta de rotina. Tudo normal.');

-- Consulta do Carlos Machava com o Dr. Carlos (Consulta Geral)
INSERT INTO consulta (id_paciente, id_medico, id_servico, data_consulta, hora_consulta, estado, informacao_clinica)
VALUES (3, 1, 1, TO_DATE('2026-10-03','YYYY-MM-DD'), '11:00', 'MARCADA', NULL);

-- Consulta da Ana Cossa com a Dra. Ana (Ginecologia)
INSERT INTO consulta (id_paciente, id_medico, id_servico, data_consulta, hora_consulta, estado, informacao_clinica)
VALUES (4, 2, 3, TO_DATE('2026-10-05','YYYY-MM-DD'), '14:00', 'MARCADA', NULL);

-- Consulta cancelada do Pedro Nhantumbo
INSERT INTO consulta (id_paciente, id_medico, id_servico, data_consulta, hora_consulta, estado, informacao_clinica)
VALUES (5, 1, 1, TO_DATE('2026-10-06','YYYY-MM-DD'), '15:30', 'CANCELADA', NULL);


-- EXAMES LABORATORIAIS (ligados ao historico, nao ao paciente)
INSERT INTO exame_laboratorial (id_historico, tipo_exame, data_realizacao, resultado)
VALUES (1, 'Hemograma Completo', TO_DATE('2026-10-01','YYYY-MM-DD'), 'Valores normais. Sem anemia.');

INSERT INTO exame_laboratorial (id_historico, tipo_exame, data_realizacao, resultado)
VALUES (1, 'Glicemia', TO_DATE('2026-10-01','YYYY-MM-DD'), '95 mg/dL - Normal.');

INSERT INTO exame_laboratorial (id_historico, tipo_exame, data_realizacao, resultado)
VALUES (2, 'Teste de Gravidez', TO_DATE('2026-10-02','YYYY-MM-DD'), 'Negativo.');

INSERT INTO exame_laboratorial (id_historico, tipo_exame, data_realizacao, resultado)
VALUES (4, 'Papanicolau', TO_DATE('2026-10-05','YYYY-MM-DD'), 'Resultado pendente de análise.');


-- MEDICAMENTOS
INSERT INTO medicamento (nome, descricao, quantidade_stock, stock_minimo, data_validade)
VALUES ('Paracetamol 500mg', 'Analgésico e antitérmico', 200, 50, TO_DATE('2027-12-31','YYYY-MM-DD'));

INSERT INTO medicamento (nome, descricao, quantidade_stock, stock_minimo, data_validade)
VALUES ('Amoxicilina 500mg', 'Antibiótico de largo espectro', 80, 30, TO_DATE('2027-06-30','YYYY-MM-DD'));

INSERT INTO medicamento (nome, descricao, quantidade_stock, stock_minimo, data_validade)
VALUES ('Ibuprofeno 400mg', 'Anti-inflamatório', 45, 50, TO_DATE('2027-03-15','YYYY-MM-DD'));

INSERT INTO medicamento (nome, descricao, quantidade_stock, stock_minimo, data_validade)
VALUES ('Omeprazol 20mg', 'Protetor gástrico', 120, 40, TO_DATE('2028-01-31','YYYY-MM-DD'));

INSERT INTO medicamento (nome, descricao, quantidade_stock, stock_minimo, data_validade)
VALUES ('Dipirona 1g', 'Analgésico', 15, 30, TO_DATE('2026-11-30','YYYY-MM-DD'));


-- MOVIMENTOS DE STOCK
INSERT INTO movimento_stock (id_medicamento, tipo_movimento, quantidade, data_movimento)
VALUES (1, 'ENTRADA', 200, TO_DATE('2026-09-01','YYYY-MM-DD'));

INSERT INTO movimento_stock (id_medicamento, tipo_movimento, quantidade, data_movimento)
VALUES (2, 'ENTRADA', 100, TO_DATE('2026-09-01','YYYY-MM-DD'));

INSERT INTO movimento_stock (id_medicamento, tipo_movimento, quantidade, data_movimento)
VALUES (2, 'SAIDA', 20, TO_DATE('2026-09-15','YYYY-MM-DD'));

INSERT INTO movimento_stock (id_medicamento, tipo_movimento, quantidade, data_movimento)
VALUES (3, 'ENTRADA', 45, TO_DATE('2026-09-05','YYYY-MM-DD'));

INSERT INTO movimento_stock (id_medicamento, tipo_movimento, quantidade, data_movimento)
VALUES (5, 'ENTRADA', 15, TO_DATE('2026-09-10','YYYY-MM-DD'));

-- PERFIS
INSERT INTO perfil (designacao, descricao) VALUES ('Administrador', 'Acesso total ao sistema');
INSERT INTO perfil (designacao, descricao) VALUES ('Recepcionista', 'Gestão de pacientes, consultas e pagamentos');
INSERT INTO perfil (designacao, descricao) VALUES ('Médico', 'Acesso a consultas e histórico clínico');
INSERT INTO perfil (designacao, descricao) VALUES ('Farmacêutico', 'Gestão de medicamentos e vendas');

-- UTILIZADORES (password deve ser hash em produção - aqui usamos texto simples so para testes)
INSERT INTO utilizador (id_perfil, username, password) VALUES (1, 'admin', 'hash_admin_123');
INSERT INTO utilizador (id_perfil, username, password) VALUES (2, 'recepcionista1', 'hash_rec_123');
INSERT INTO utilizador (id_perfil, username, password) VALUES (3, 'dr_carlos', 'hash_med_123');
INSERT INTO utilizador (id_perfil, username, password) VALUES (4, 'farmaceutico1', 'hash_farm_123');


-- VENDAS (id_utilizador 4 = farmaceutico1)
INSERT INTO venda (id_utilizador, data_venda, valor_total)
VALUES (4, TO_DATE('2026-10-05','YYYY-MM-DD'), 0);

INSERT INTO venda (id_utilizador, data_venda, valor_total)
VALUES (4, TO_DATE('2026-10-06','YYYY-MM-DD'), 0);

-- ITENS DA VENDA 1
INSERT INTO item_venda (id_venda, id_medicamento, quantidade, valor_unitario)
VALUES (1, 1, 2, 25.00);  -- 2 Paracetamol x 25 = 50

INSERT INTO item_venda (id_venda, id_medicamento, quantidade, valor_unitario)
VALUES (1, 2, 1, 120.00); -- 1 Amoxicilina x 120 = 120

-- ITENS DA VENDA 2
INSERT INTO item_venda (id_venda, id_medicamento, quantidade, valor_unitario)
VALUES (2, 4, 3, 40.00);  -- 3 Omeprazol x 40 = 120

-- Actualizar o valor_total das vendas (soma dos subtotais)
UPDATE venda SET valor_total = (SELECT SUM(subtotal) FROM item_venda WHERE id_venda = 1) WHERE id_venda = 1;
UPDATE venda SET valor_total = (SELECT SUM(subtotal) FROM item_venda WHERE id_venda = 2) WHERE id_venda = 2;

-- PAGAMENTOS
INSERT INTO pagamento (id_paciente, id_consulta, id_venda, data_pagamento, valor, forma_pagamento)
VALUES (1, 1, NULL, TO_DATE('2026-10-01','YYYY-MM-DD'), 500.00, 'Dinheiro');

INSERT INTO pagamento (id_paciente, id_consulta, id_venda, data_pagamento, valor, forma_pagamento)
VALUES (2, 2, NULL, TO_DATE('2026-10-02','YYYY-MM-DD'), 700.00, 'Mpesa');

INSERT INTO pagamento (id_paciente, id_consulta, id_venda, data_pagamento, valor, forma_pagamento)
VALUES (1, NULL, 1, TO_DATE('2026-10-05','YYYY-MM-DD'), 170.00, 'Dinheiro');

-- RECIBOS
INSERT INTO recibo (id_pagamento, numero_recibo, data_emissao, valor)
VALUES (1, 'REC-2026-0001', TO_DATE('2026-10-01','YYYY-MM-DD'), 500.00);

INSERT INTO recibo (id_pagamento, numero_recibo, data_emissao, valor)
VALUES (2, 'REC-2026-0002', TO_DATE('2026-10-02','YYYY-MM-DD'), 700.00);

INSERT INTO recibo (id_pagamento, numero_recibo, data_emissao, valor)
VALUES (3, 'REC-2026-0003', TO_DATE('2026-10-05','YYYY-MM-DD'), 170.00);