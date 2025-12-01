INSERT INTO Planos (nome_plano, preco, duracao_meses) VALUES
('Plano Mensal', 120.00, 1),
('Plano Trimestral', 300.00, 3),
('Plano Anual Premium', 999.90, 12);

-- 2. Inserir Instrutores (Tabela Pai)
INSERT INTO Instrutor (nome, cpf, especialidade) VALUES
('Mariana Silva', '11122233344', 'Yoga'),
('Pedro Souza', '55566677788', 'Musculação'),
('Carla Dias', '99900011122', 'Spinning');

-- 3. Inserir Clientes (Tabela Pai)
INSERT INTO Clientes (nome, cpf, telefone, data_nascimento) VALUES
('Joao Almeida', '12345678900', '987654321', '1995-05-15'),
('Ana Barbosa', '09876543211', '999887766', '2000-01-20'),
('Lucas Ferreira', '11223344550', '911223344', '1988-11-03');

-- 4. Inserir Aulas Coletivas (Depende de Instrutor)
INSERT INTO Aula_Coletiva (id_instrutor, nome_aula, dia_semana, horario_inicio, capacidade_maxima) VALUES
(1, 'Yoga Matinal', 'Segunda', '07:00:00', 25),
(3, 'Spinning Turbo', 'Quarta', '19:30:00', 30),
(2, 'Treino Funcional', 'Sexta', '18:00:00', 20);

-- 5. Inserir Matrículas (Depende de Clientes e Planos)
INSERT INTO Matricula (id_cliente, id_plano, data_inicio, data_vencimento, status_pagamento) VALUES
(1, 3, '2025-01-01', '2026-01-01', 'Em Dia'),
(2, 1, '2025-11-25', '2025-12-25', 'Em Dia'),
(3, 2, '2025-10-10', '2026-01-10', 'Atrasado');

-- 6. Inserir Agendamentos (Depende de Clientes e Aula_Coletiva - Tabela de Ligação)
-- Atenção: A PK Composta é (id_cliente, id_aula, data_agendamento)
INSERT INTO Agendamento (id_cliente, id_aula, data_agendamento, hora_agendamento, status_presenca) VALUES
(1, 2, '2025-12-05', '19:30:00', 'Compareceu'),
(2, 1, '2025-12-04', '07:00:00', 'Faltou'),
(3, 3, '2025-12-06', '18:00:00', 'Agendado');

-- 7. Inserir Frequência (Depende de Clientes)
INSERT INTO Frequencia (id_cliente, data_hora, tipo_acesso) VALUES
(1, '2025-12-01 10:00:00', 'Catraca'),
(2, '2025-12-01 06:45:00', 'Catraca');
