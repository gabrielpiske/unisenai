CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE if not exists funcionarios(
    ID      INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nome    TEXT NOT NULL,
    Cargo   TEXT NOT NULL,
    Salario DECIMAL(10, 2),
    Cidade  TEXT NOT NULL
);

INSERT INTO funcionarios (Nome, Cargo, Salario, Cidade) VALUES
('Carlos Silva', 'Técnico', 3500, 'Blumenau'),
('Ana Souza', 'Analista', 2200, 'Gaspar');

SELECT * FROM funcionarios;

INSERT INTO funcionarios (Nome, Cargo, Salario, Cidade) VALUES
('Roberto', 'Programalista', 10000, 'Timbó');

SELECT * FROM funcionarios WHERE Salario > 4000;

INSERT INTO funcionarios (Nome, Cargo, Salario, Cidade) VALUES
('Paulo', 'Chefe', 12000, 'Blumenau');

SELECT * FROM funcionarios WHERE Cidade = 'Blumenau';

SELECT * FROM funcionarios ORDER BY Salario DESC;

INSERT INTO funcionarios (Nome, Cargo, Salario, Cidade) VALUES
('Jorge', 'Programador', 5000, 'Timbó');
SELECT * FROM funcionarios WHERE Cargo = 'Programador';

INSERT INTO funcionarios (Nome, Cargo, Salario, Cidade) VALUES
('Marcio', 'Analista', 2300, 'Timbó');

SELECT * FROM funcionarios WHERE Nome LIKE 'M%';

SELECT * FROM funcionarios WHERE Salario > 3000 && Salario < 5000;

UPDATE funcionarios SET Salario = 1 WHERE ID = 3; // era 10mil antes
SELECT * FROM funcionarios;

DELETE FROM funcionarios WHERE ID = 2;
SELECT * FROM funcionarios;