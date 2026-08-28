CREATE DATABASE IF NOT EXISTS empresa;

USE empresa;

CREATE TABLE Produtos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    Quantidade INT NOT NULL
);

INSERT INTO Produtos (Nome, Categoria, Preco, Quantidade) VALUES
('Notebook Lenovo IdeaPad', 'Eletrônicos', 3299.90, 15),
('Mouse Logitech M170', 'Eletrônicos', 89.90, 40),
('Teclado Mecânico Redragon', 'Eletrônicos', 249.90, 25),
('Monitor LG 24 Polegadas', 'Eletrônicos', 899.90, 12),
('Headset HyperX Cloud', 'Eletrônicos', 399.90, 18),

('Cadeira Gamer', 'Móveis', 1199.90, 8),
('Mesa para Escritório', 'Móveis', 649.90, 10),
('Estante de Madeira', 'Móveis', 499.90, 6),
('Armário de Escritório', 'Móveis', 799.90, 5),
('Cadeira de Escritório', 'Móveis', 459.90, 14),

('Caderno Universitário', 'Papelaria', 24.90, 60),
('Caneta Esferográfica Azul', 'Papelaria', 3.50, 150),
('Lápis Preto', 'Papelaria', 2.00, 200),
('Borracha Branca', 'Papelaria', 1.50, 120),
('Mochila Escolar', 'Papelaria', 149.90, 30),

('Café em Pó 500g', 'Alimentos', 18.90, 50),
('Açúcar 1kg', 'Alimentos', 5.99, 80),
('Arroz 5kg', 'Alimentos', 28.90, 45),
('Feijão 1kg', 'Alimentos', 8.99, 70),
('Biscoito Chocolate', 'Alimentos', 6.50, 90);


# Escreva o comando SQL para mostrar todos os produtos cadastrados na tabela Produtos.
SELECT * FROM Produtos;

# Escreva o comando SQL para mostrar apenas os produtos cujo preço seja maior que R$ 50,00.
SELECT * FROM Produtos WHERE Preco > 50.0;

# Cadastre um novo produto com os seguintes dados: Nome: Teclado; Categoria: Informática; Preço: 89,90; Quantidade: 15.
INSERT INTO Produtos (Nome, Categoria, Preco, Quantidade) VALUES ('Teclado', 'Informática', 89.90, 15)

# Altere o preço do produto de ID 4 para R$ 120,00.
UPDATE Produtos
SET Preco = 120.00
WHERE ID = 4;


# Exclua do banco de dados o produto que possui ID 7.
DELETE FROM Produtos
WHERE ID = 7;


# Mostre todos os produtos organizados pelo preço do maior para o menor.
SELECT *
FROM Produtos
ORDER BY Preco DESC;


# Mostre apenas os produtos cujo preço esteja entre R$ 50,00 e R$ 150,00.
SELECT *
FROM Produtos
WHERE Preco BETWEEN 50.00 AND 150.00;


# Descubra quantos produtos estão cadastrados na tabela.
SELECT COUNT(*) AS TotalProdutos
FROM Produtos;


# Mostre os produtos cujo nome começa com a letra C.
SELECT *
FROM Produtos
WHERE Nome LIKE 'C%';


# Mostre apenas o produto mais caro cadastrado na tabela.
SELECT *
FROM Produtos
ORDER BY Preco DESC
LIMIT 1;