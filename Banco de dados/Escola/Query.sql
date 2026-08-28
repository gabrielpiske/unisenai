CREATE DATABASE IF NOT EXISTS escola;

USE escola;

CREATE TABLE IF NOT EXISTS alunos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100),
 idade INT,
 email VARCHAR(100)
);

INSERT INTO alunos (nome, idade, email) VALUES
('João', 25, 'joao@example.com'),
('Maria', 20, 'maria@example.com'),
('Pedro', 22, 'pedro@example.com'),
('Ana', 19, 'ana@example.com'),
('Luiz', 23, 'luiz@example.com');

# Selecione todos os registros da tabela `alunos`.
SELECT * FROM alunos;

#Selecione o nome e o e-mail dos alunos que tenham mais de 18 anos.
SELECT nome, email FROM alunos WHERE idade > 18;

#Insira um novo aluno na tabela `alunos`. Os dados do novo aluno são: nome = "Maria", idade = 20, e-mail = "maria@example.com".
INSERT INTO alunos (nome, idade, email) VALUES ('Maria', 20, 'maria@example.com');

#Atualize a idade do aluno com o nome "João" para 25 anos.
UPDATE alunos SET idade = 25 WHERE nome = 'João';

#Remova o aluno com o e-mail "pedro@example.com" da tabela `alunos`.
DELETE FROM alunos WHERE email = 'pedro@example.com';

#Selecione todos os alunos ordenados por idade de forma descendente (do mais velho para o mais novo).
SELECT * FROM alunos ORDER BY idade DESC;

#Selecione o nome e a idade dos alunos que tenham entre 20 e 30 anos.
SELECT nome, idade FROM alunos WHERE idade BETWEEN 20 AND 30;

#Conte quantos alunos estão na tabela.
SELECT COUNT(*) AS total_alunos FROM alunos;

#Selecione o aluno mais velho.
SELECT * FROM alunos ORDER BY idade DESC LIMIT 1

#Selecione o nome e a idade de todos os alunos que possuem um e-mail que termina com "@example.com".
SELECT nome, idade FROM alunos WHERE email LIKE '%@example.com';