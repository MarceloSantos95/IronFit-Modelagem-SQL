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
