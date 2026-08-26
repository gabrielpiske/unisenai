CREATE DATABASE if not exists livraria;
USE livraria;

CREATE TABLE if not exists Livros (
  ID INTEGER PRIMARY KEY AUTO_INCREMENT,
  Titulo TEXT NOT NULL,
  Autor TEXT NOT NULL,
  AnoPublicacao INTEGER,
  Preco DECIMAL(10, 2)
);

INSERT INTO Livros (Titulo, Autor, AnoPublicacao, Preco) VALUES
('O Hobbit', 'J.R.R. Tolkien', 1937, 39.90),
('Dom Casmurro', 'Machado de Assis', 1899, 24.90),
('1984', 'George Orwell', 1949, 34.90),
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 42.50),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 29.90),
('A Revolução dos Bichos', 'George Orwell', 1945, 27.90),
('It: A Coisa', 'Stephen King', 1986, 59.90),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 79.90),
('Capitães da Areia', 'Jorge Amado', 1937, 32.90),
('A Metamorfose', 'Franz Kafka', 1915, 19.90),
('O Código Da Vinci', 'Dan Brown', 2003, 45.90),
('Percy Jackson e o Ladrão de Raios', 'Rick Riordan', 2005, 37.90),
('Orgulho e Preconceito', 'Jane Austen', 1813, 26.90),
('Jogos Vorazes', 'Suzanne Collins', 2008, 41.90),
('Cem Anos de Solidão', 'Gabriel García Márquez', 1967, 49.90),
('A Culpa é das Estrelas', 'John Green', 2012, 35.90),
('O Alquimista', 'Paulo Coelho', 1988, 31.90),
('Crime e Castigo', 'Fiódor Dostoiévski', 1866, 44.90),
('Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 28.90),
('As Crônicas de Nárnia', 'C.S. Lewis', 1950, 54.90),
('Duna', 'Frank Herbert', 1965, 47.90),
('Drácula', 'Bram Stoker', 1897, 33.90),
('O Diário de Anne Frank', 'Anne Frank', 1947, 30.90),
('Neuromancer', 'William Gibson', 1984, 38.90),
('A Menina que Roubava Livros', 'Markus Zusak', 2005, 43.90);

# Todos livros
SELECT * FROM livros;

#Livros por autor
SELECT * FROM livros WHERE Autor = 'Machado de Assis';

#Consultar livros por ano de publicação
SELECT * FRom livros WHERE AnoPublicacao = 1945;

#Listar livros acima de um certo preço
SELECT * FROM livros WHERE Preco > 15.0;

#Contar livros por autor
SELECT Livros.Autor,COUNT(*) AS Quantidade FROM Livros GROUP BY Autor;

#Listar 5 livros mais recentes
SELECT * FROM Livros ORDER BY AnoPublicacao DESC LIMIT 5;

#Atualizar preço de um livro especifico
UPDATE Livros SET Preco = 25.99 WHERE ID = 4;
#Atualizar ano de atualização
UPDATE Livros SET AnoPublicacao = 2022 WHERE ID = 16;

DELETE FROM Livros WHERE ID = 1;

#Listar livros com preço acima da média
SELECT * FROM  Livros WHERE Preco > (SELECT AVG(Preco) FROM Livros);

#Atualizar preços em Massa
UPDATE Livros SET Preco = Preco * 1.10; # desta forma da erro por verificação de segurança

#Dessa forma funciona
SET SQL_SAFE_UPDATES = 0;
UPDATE Livros SET Preco = Preco * 1.10;
SET SQL_SAFE_UPDATES = 1;
