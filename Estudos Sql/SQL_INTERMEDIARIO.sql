NÍVEL BÁSICO
1) Ver todos os dados
SELECT * FROM Funcionarios;
2) Mostrar apenas algumas colunas
SELECT Nome, Salario
FROM Funcionarios;

Resultado:

Nome	Salario
João	3500
Maria	6500
3) Filtrar registros (WHERE)

Funcionários que ganham mais de R$ 3.000:

SELECT *
FROM Funcionarios
WHERE Salario > 3000;
4) Procurar por nome
SELECT *
FROM Funcionarios
WHERE Nome = 'João';
5) Ordenar do maior salário para o menor
SELECT *
FROM Funcionarios
ORDER BY Salario DESC;
Menor para o maior:
SELECT *
FROM Funcionarios
ORDER BY Salario ASC;
6) Atualizar um dado

Mudar o salário do Lucas:

UPDATE Funcionarios
SET Salario = 2000
WHERE Nome = 'Lucas';
7) Excluir um registro

Excluir o Lucas:

DELETE FROM Funcionarios
WHERE Nome = 'Lucas';
🟡 NÍVEL INTERMEDIÁRIO
1) Contar quantos funcionários existem
SELECT COUNT(*) AS TotalFuncionarios
FROM Funcionarios;
2) Somar todos os salários
SELECT SUM(Salario) AS TotalSalarios
FROM Funcionarios;
3) Calcular a média salarial
SELECT AVG(Salario) AS MediaSalarial
FROM Funcionarios;
4) Mostrar o maior salário
SELECT MAX(Salario) AS MaiorSalario
FROM Funcionarios;
5) Mostrar o menor salário
SELECT MIN(Salario) AS MenorSalario
FROM Funcionarios;
6) Agrupar por cargo

Quantas pessoas existem em cada cargo?

SELECT Cargo,
       COUNT(*) AS Quantidade
FROM Funcionarios
GROUP BY Cargo;

Exemplo:

Cargo	Quantidade
Analista	1
Gerente	1
Estagiário	2
7) Filtrar grupos (HAVING)

Mostrar apenas cargos com mais de 1 funcionário:

SELECT Cargo,
       COUNT(*) AS Quantidade
FROM Funcionarios
GROUP BY Cargo
HAVING COUNT(*) > 1;
8) CASE WHEN

Classificar salários:

SELECT Nome,
       Salario,
       CASE
           WHEN Salario < 2000 THEN 'Baixo'
           WHEN Salario BETWEEN 2000 AND 5000 THEN 'Médio'
           ELSE 'Alto'
       END AS FaixaSalarial
FROM Funcionarios;
🔵 BÔNUS: JOIN (Muito cobrado em entrevistas)

Crie uma tabela de departamentos:

CREATE TABLE Departamentos (
    IdDepartamento INT PRIMARY KEY,
    Departamento VARCHAR(50)
);

Insira dados:

INSERT INTO Departamentos
VALUES
(1, 'TI'),
(2, 'RH'),
(3, 'Financeiro');

Adicione a coluna na tabela Funcionarios:

ALTER TABLE Funcionarios
ADD IdDepartamento INT;

Atualize os funcionários:

UPDATE Funcionarios
SET IdDepartamento = 1
WHERE Nome = 'João';

UPDATE Funcionarios
SET IdDepartamento = 2
WHERE Nome = 'Maria';

UPDATE Funcionarios
SET IdDepartamento = 1
WHERE Nome = 'Pedro';

UPDATE Funcionarios
SET IdDepartamento = 3
WHERE Nome = 'Carlos';
Fazer o JOIN
SELECT
    f.Nome,
    f.Cargo,
    d.Departamento
FROM Funcionarios f
INNER JOIN Departamentos d
    ON f.IdDepartamento = d.IdDepartamento;