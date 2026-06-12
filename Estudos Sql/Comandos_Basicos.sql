1.\\Criar um banco de dados\\
CREATE DATABASE TESTE;

\\Entrar no banco de dados\\
USE TESTE;
GO


\\Criar a tabela Funcionarios\\
CREATE TABLE Funcionarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2)
);

\\Inserir dados\\
INSERT INTO Funcionarios (Nome, Cargo, Salario)
VALUES
('João', 'Analista', 3500.00),
('Maria', 'Gerente', 6500.00),
('Pedro', 'Estagiário', 1800.00);

\\Inserir mais um funcionário\\
INSERT INTO Funcionarios (Nome, Cargo, Salario)
VALUES ('Carlos', 'Supervisor', 5200.00);

\\Consultar todos os dados\\
SELECT * FROM Funcionarios;

\\Adicionar mais funcionários\\


INSERT INTO Funcionarios (Nome, Cargo, Salario)
VALUES
('Ana', 'Assistente', 2500.00),
('Lucas', 'Coordenador', 4800.00),
('Fernanda', 'Diretora', 9500.00);

\\Adicionar uma nova coluna\\

ALTER TABLE Funcionarios
ADD Idade INT;


\\Atualizar dados\\

UPDATE Funcionarios
SET Idade = 30
WHERE Id = 1;


\\Apagar todos os registros\\
DELETE FROM Funcionarios;


\\Apagar tudo e reiniciar o ID\\

TRUNCATE TABLE Funcionarios;


\\Remover registros duplicados\\
WITH Duplicados AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Nome, Cargo, Salario
               ORDER BY Id
           ) AS RN
    FROM Funcionarios
)
DELETE FROM Duplicados
WHERE RN > 1;


\\Impedir duplicados no futuro\\

ALTER TABLE Funcionarios
ADD CONSTRAINT UQ_Funcionarios
UNIQUE (Nome, Cargo, Salario);




\\Verificar como ficou a tabela\\


SELECT * FROM Funcionarios;


\\Fluxo básico para decorar\\
CREATE DATABASE  → cria o banco
USE              → entra no banco
CREATE TABLE     → cria a tabela
INSERT INTO      → adiciona dados
SELECT           → consulta os dados
UPDATE           → altera dados
ALTER TABLE      → modifica a estrutura
DELETE           → apaga registros
TRUNCATE TABLE   → limpa a tabela e reinicia o ID





