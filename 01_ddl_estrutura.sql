CREATE DATABASE IF NOT EXISTS IronFit;


USE IronFit;




CREATE TABLE Planos (
    id_plano INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    duracao_meses INT NOT NULL
);


CREATE TABLE Instrutor (
    id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    especialidade VARCHAR(50)
);


CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    data_nascimento DATE,
    endereco VARCHAR(200)
);

CREATE TABLE Aula_Coletiva (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_instrutor INT NOT NULL,
    nome_aula VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    horario_inicio TIME NOT NULL,
    capacidade_maxima INT,
   
    FOREIGN KEY (id_instrutor) REFERENCES Instrutor(id_instrutor)
);


CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    status_pagamento VARCHAR(50) NOT NULL,
 
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_plano) REFERENCES Planos(id_plano)
);


CREATE TABLE Frequencia (
    id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data_hora DATETIME NOT NULL,
    tipo_acesso VARCHAR(50), 
   
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


CREATE TABLE Agendamento (
    id_cliente INT NOT NULL,
    id_aula INT NOT NULL,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    status_presenca VARCHAR(50), -- Ex: 'Agendado', 'Compareceu', 'Faltou'
    
  
    PRIMARY KEY (id_cliente, id_aula, data_agendamento),
    
    
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_aula) REFERENCES Aula_Coletiva(id_aula)
);




INSERT INTO Planos (nome_plano, preco, duracao_meses) VALUES
('Plano Mensal', 120.00, 1),
('Plano Trimestral', 300.00, 3),
('Plano Anual Premium', 999.90, 12);


INSERT INTO Instrutor (nome, cpf, especialidade) VALUES
('Mariana Silva', '11122233344', 'Yoga'),
('Pedro Souza', '55566677788', 'Musculação'),
('Carla Dias', '99900011122', 'Spinning');


INSERT INTO Clientes (nome, cpf, telefone, data_nascimento) VALUES
('Joao Almeida', '12345678900', '987654321', '1995-05-15'),
('Ana Barbosa', '09876543211', '999887766', '2000-01-20'),
('Lucas Ferreira', '11223344550', '911223344', '1988-11-03');


INSERT INTO Aula_Coletiva (id_instrutor, nome_aula, dia_semana, horario_inicio, capacidade_maxima) VALUES
(1, 'Yoga Matinal', 'Segunda', '07:00:00', 25),
(3, 'Spinning Turbo', 'Quarta', '19:30:00', 30),
(2, 'Treino Funcional', 'Sexta', '18:00:00', 20);


INSERT INTO Matricula (id_cliente, id_plano, data_inicio, data_vencimento, status_pagamento) VALUES
(1, 3, '2025-01-01', '2026-01-01', 'Em Dia'),
(2, 1, '2025-11-25', '2025-12-25', 'Em Dia'),
(3, 2, '2025-10-10', '2026-01-10', 'Atrasado');


INSERT INTO Agendamento (id_cliente, id_aula, data_agendamento, hora_agendamento, status_presenca) VALUES
(1, 2, '2025-12-05', '19:30:00', 'Compareceu'),
(2, 1, '2025-12-04', '07:00:00', 'Faltou'),
(3, 3, '2025-12-06', '18:00:00', 'Agendado');


INSERT INTO Frequencia (id_cliente, data_hora, tipo_acesso) VALUES
(1, '2025-12-01 10:00:00', 'Catraca'),
(2, '2025-12-01 06:45:00', 'Catraca');

SELECT
    C.nome AS Aluno,
    AC.nome_aula,
    A.status_presenca
FROM
    Agendamento A
JOIN
    Clientes C ON A.id_cliente = C.id_cliente
JOIN
    Aula_Coletiva AC ON A.id_aula = AC.id_aula
WHERE
    AC.nome_aula LIKE 'Treino Funcional%' AND A.status_presenca = 'Agendado';
    


SET SQL_SAFE_UPDATES = 0;

-- 1. COMANDOS UPDATE
UPDATE Planos
SET preco = 135.00
WHERE id_plano = 1;

UPDATE Matricula
SET status_pagamento = 'Em Dia'
WHERE id_cliente = 3;

UPDATE Instrutor
SET especialidade = 'Musculação Avançada'
WHERE id_instrutor = 2;


DELETE FROM Agendamento WHERE id_cliente = 2;
DELETE FROM Agendamento WHERE id_aula = 1;


DELETE FROM Frequencia
WHERE data_hora < '2025-12-01 07:00:00';


DELETE FROM Matricula
WHERE id_cliente = 2;


DELETE FROM Aula_Coletiva
WHERE id_aula = 1;

SET SQL_SAFE_UPDATES = 1;