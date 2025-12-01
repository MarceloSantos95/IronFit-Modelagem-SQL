SET SQL_SAFE_UPDATES = 0;


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