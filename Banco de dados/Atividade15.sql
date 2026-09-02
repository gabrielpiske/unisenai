-- Dump de dados - Atividade SQL Básico
-- Banco esperado: estoque
-- Tabela esperada: produtos
--
-- ATENÇÃO:
-- Este arquivo contém somente os 150 registros.
-- Ele NÃO cria o banco de dados e NÃO cria a tabela.
-- Crie primeiro a estrutura conforme o PDF da atividade.

CREATE DATABASE IF NOT EXISTS estoque;
USE estoque;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    fornecedor VARCHAR(100) NOT NULL,
    cidade_fornecedor VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_cadastro DATE NOT NULL
);

INSERT INTO produtos
(nome, categoria, fornecedor, cidade_fornecedor, quantidade_estoque, preco, data_cadastro)
VALUES
('Mouse Óptico','Informática','TechSul','Blumenau',35,79.90,'2026-02-10'),
('Monitor LED','Informática','Comercial Vale','Gaspar',8,899.90,'2026-03-15'),
('Mochila Executiva','Acessórios','Distribuidora SC','Blumenau',22,219.90,'2026-04-20'),
('Projetor','Eletrônicos','Brasil Office','Itajaí',4,1799.90,'2026-05-05'),
('Martelo','Ferramentas','Mega Suprimentos','Blumenau',60,59.90,'2026-06-12'),
('Mousepad','Acessórios','Mega Suprimentos','Gaspar',64,34.90,'2026-04-04'),
('Calculadora','Escritório','Distribuidora SC','Itajaí',26,69.90,'2025-04-23'),
('Mesa Escritório','Escritório','TechSul','Itajaí',58,699.90,'2025-03-28'),
('Memória RAM','Informática','Comercial Vale','Pomerode',95,349.90,'2026-02-08'),
('Calculadora','Escritório','Norte Tech','Indaial',112,69.90,'2025-08-21'),
('Cabo HDMI','Acessórios','Distribuidora SC','Jaraguá do Sul',36,44.90,'2025-12-17'),
('Parafusadeira','Ferramentas','Mega Suprimentos','Gaspar',24,579.90,'2025-10-20'),
('Furadeira','Ferramentas','Mega Suprimentos','Brusque',49,519.90,'2025-10-23'),
('Cabo HDMI','Acessórios','Mega Suprimentos','Indaial',39,44.90,'2025-09-24'),
('Projetor','Eletrônicos','Brasil Office','Pomerode',96,1799.90,'2026-01-30'),
('Cabo HDMI','Acessórios','TechSul','Timbó',74,14.90,'2025-12-12'),
('Furadeira','Ferramentas','Brasil Office','Pomerode',13,499.90,'2025-04-09'),
('Maleta de Ferramentas','Ferramentas','Brasil Office','Itajaí',87,299.90,'2026-01-28'),
('Smart TV','Eletrônicos','Brasil Office','Jaraguá do Sul',69,2299.90,'2026-04-17'),
('Memória RAM','Informática','Comercial Vale','Blumenau',115,349.90,'2026-01-06'),
('Monitor LED','Informática','TechSul','Timbó',32,899.90,'2026-05-25'),
('Calculadora','Escritório','Comercial Vale','Pomerode',51,59.90,'2025-11-26'),
('Cadeira Giratória','Escritório','Comercial Vale','Timbó',91,789.90,'2025-08-04'),
('Hub USB','Acessórios','Comercial Vale','Itajaí',80,139.90,'2025-11-14'),
('Luminária','Escritório','Distribuidora SC','Blumenau',57,99.90,'2025-01-18'),
('Grampeador','Escritório','Distribuidora SC','Pomerode',31,39.90,'2026-08-20'),
('Caixa de Som','Eletrônicos','TechSul','Pomerode',113,299.90,'2025-03-11'),
('SSD 500GB','Informática','Mega Suprimentos','Brusque',83,399.90,'2026-05-15'),
('Caixa de Som','Eletrônicos','Brasil Office','Blumenau',118,269.90,'2025-06-03'),
('Projetor','Eletrônicos','Comercial Vale','Timbó',20,1819.90,'2025-09-30'),
('Grampeador','Escritório','Comercial Vale','Pomerode',47,39.90,'2025-06-12'),
('Mochila Executiva','Acessórios','TechSul','Pomerode',52,219.90,'2026-01-16'),
('Grampeador','Escritório','Distribuidora SC','Itajaí',100,39.90,'2025-08-26'),
('Mouse Óptico','Informática','Norte Tech','Timbó',58,129.90,'2025-08-27'),
('Caixa de Som','Eletrônicos','Brasil Office','Blumenau',64,239.90,'2025-08-28'),
('Luminária','Escritório','Comercial Vale','Itajaí',35,99.90,'2026-05-14'),
('Luminária','Escritório','TechSul','Indaial',116,119.90,'2025-08-29'),
('Furadeira','Ferramentas','TechSul','Jaraguá do Sul',102,499.90,'2026-04-17'),
('Calculadora','Escritório','Norte Tech','Brusque',53,69.90,'2025-12-20'),
('Caixa de Som','Eletrônicos','Comercial Vale','Blumenau',51,239.90,'2025-03-10'),
('Calculadora','Escritório','Comercial Vale','Gaspar',22,89.90,'2025-04-17'),
('Furadeira','Ferramentas','Distribuidora SC','Blumenau',117,499.90,'2026-02-03'),
('Mousepad','Acessórios','TechSul','Timbó',43,84.90,'2026-05-07'),
('Smart TV','Eletrônicos','Mega Suprimentos','Jaraguá do Sul',13,2299.90,'2026-06-01'),
('SSD 500GB','Informática','TechSul','Itajaí',74,399.90,'2025-03-09'),
('Martelo','Ferramentas','TechSul','Blumenau',90,59.90,'2026-04-03'),
('Monitor LED','Informática','Mega Suprimentos','Itajaí',77,869.90,'2025-03-15'),
('Alicate Universal','Ferramentas','TechSul','Blumenau',56,49.90,'2026-01-12'),
('Hub USB','Acessórios','Mega Suprimentos','Jaraguá do Sul',62,159.90,'2025-11-18'),
('Mesa Escritório','Escritório','Distribuidora SC','Timbó',79,699.90,'2026-07-21'),
('Hub USB','Acessórios','Comercial Vale','Jaraguá do Sul',86,139.90,'2025-07-14'),
('Carregador Portátil','Eletrônicos','Norte Tech','Timbó',112,179.90,'2025-07-16'),
('Projetor','Eletrônicos','Brasil Office','Blumenau',43,1799.90,'2026-02-03'),
('Memória RAM','Informática','Mega Suprimentos','Jaraguá do Sul',32,369.90,'2025-10-22'),
('Projetor','Eletrônicos','Comercial Vale','Timbó',90,1799.90,'2026-02-01'),
('Monitor LED','Informática','TechSul','Pomerode',109,899.90,'2025-05-16'),
('Mousepad','Acessórios','Comercial Vale','Pomerode',53,10.00,'2026-08-26'),
('Caixa de Som','Eletrônicos','Brasil Office','Itajaí',106,249.90,'2025-10-13'),
('Calculadora','Escritório','Distribuidora SC','Gaspar',39,69.90,'2025-11-11'),
('Monitor LED','Informática','Norte Tech','Pomerode',110,949.90,'2026-01-16'),
('Carregador Portátil','Eletrônicos','Norte Tech','Blumenau',84,179.90,'2026-04-14'),
('Parafusadeira','Ferramentas','Norte Tech','Blumenau',99,599.90,'2026-06-11'),
('Monitor LED','Informática','Mega Suprimentos','Jaraguá do Sul',42,889.90,'2025-03-02'),
('Memória RAM','Informática','Norte Tech','Brusque',51,369.90,'2025-12-29'),
('Grampeador','Escritório','Brasil Office','Brusque',46,39.90,'2025-05-24'),
('Mouse Óptico','Informática','Norte Tech','Timbó',29,99.90,'2025-05-06'),
('Cadeira Giratória','Escritório','TechSul','Timbó',5,799.90,'2025-01-16'),
('Grampeador','Escritório','TechSul','Gaspar',66,39.90,'2025-09-08'),
('Projetor','Eletrônicos','Mega Suprimentos','Brusque',22,1799.90,'2026-04-01'),
('Suporte para Notebook','Acessórios','Brasil Office','Blumenau',7,129.90,'2025-04-10'),
('Mesa Escritório','Escritório','Mega Suprimentos','Indaial',87,699.90,'2025-09-05'),
('Memória RAM','Informática','Comercial Vale','Itajaí',62,319.90,'2026-06-16'),
('Caixa de Som','Eletrônicos','Distribuidora SC','Itajaí',35,249.90,'2026-04-06'),
('Martelo','Ferramentas','Brasil Office','Gaspar',95,109.90,'2025-07-24'),
('Monitor LED','Informática','Distribuidora SC','Indaial',96,919.90,'2025-02-23'),
('Calculadora','Escritório','Mega Suprimentos','Indaial',106,69.90,'2025-02-02'),
('Mesa Escritório','Escritório','Distribuidora SC','Indaial',102,649.90,'2026-03-04'),
('SSD 500GB','Informática','Norte Tech','Gaspar',4,399.90,'2025-09-15'),
('Grampeador','Escritório','Mega Suprimentos','Blumenau',52,89.90,'2025-01-21'),
('Mousepad','Acessórios','Norte Tech','Blumenau',78,10.00,'2025-07-28'),
('Hub USB','Acessórios','TechSul','Gaspar',9,159.90,'2026-04-19'),
('Alicate Universal','Ferramentas','Norte Tech','Blumenau',25,19.90,'2025-06-26'),
('Martelo','Ferramentas','Mega Suprimentos','Gaspar',34,29.90,'2025-05-12'),
('Hub USB','Acessórios','TechSul','Timbó',21,159.90,'2025-11-23'),
('Mochila Executiva','Acessórios','Norte Tech','Pomerode',50,269.90,'2025-06-01'),
('Smart TV','Eletrônicos','Norte Tech','Brusque',20,2299.90,'2026-01-05'),
('Mesa Escritório','Escritório','Mega Suprimentos','Timbó',117,649.90,'2025-06-08'),
('Luminária','Escritório','TechSul','Brusque',29,119.90,'2026-01-15'),
('Hub USB','Acessórios','Distribuidora SC','Gaspar',8,159.90,'2025-09-27'),
('Alicate Universal','Ferramentas','Distribuidora SC','Gaspar',72,49.90,'2026-05-03'),
('Calculadora','Escritório','Brasil Office','Jaraguá do Sul',92,59.90,'2025-09-10'),
('Mousepad','Acessórios','Norte Tech','Gaspar',26,34.90,'2026-02-21'),
('Fone Bluetooth','Eletrônicos','TechSul','Blumenau',22,239.90,'2026-04-16'),
('Carregador Portátil','Eletrônicos','Brasil Office','Jaraguá do Sul',104,159.90,'2025-08-22'),
('Calculadora','Escritório','Brasil Office','Itajaí',41,69.90,'2025-01-29'),
('Caixa de Som','Eletrônicos','Norte Tech','Pomerode',31,269.90,'2025-07-10'),
('Calculadora','Escritório','Brasil Office','Timbó',51,39.90,'2026-07-29'),
('Carregador Portátil','Eletrônicos','Mega Suprimentos','Timbó',20,159.90,'2025-11-15'),
('Cadeira Giratória','Escritório','Comercial Vale','Gaspar',106,799.90,'2025-12-20'),
('Cadeira Giratória','Escritório','Mega Suprimentos','Gaspar',26,799.90,'2025-06-28'),
('SSD 500GB','Informática','Norte Tech','Gaspar',67,449.90,'2026-01-24'),
('Carregador Portátil','Eletrônicos','Norte Tech','Jaraguá do Sul',90,159.90,'2026-07-09'),
('Smart TV','Eletrônicos','Mega Suprimentos','Gaspar',23,2289.90,'2026-03-23'),
('Maleta de Ferramentas','Ferramentas','Brasil Office','Indaial',7,349.90,'2025-08-26'),
('Maleta de Ferramentas','Ferramentas','Mega Suprimentos','Brusque',10,269.90,'2025-05-13'),
('Mochila Executiva','Acessórios','Comercial Vale','Pomerode',87,239.90,'2025-10-05'),
('Hub USB','Acessórios','Distribuidora SC','Timbó',92,159.90,'2025-11-09'),
('Parafusadeira','Ferramentas','TechSul','Brusque',14,629.90,'2026-05-19'),
('Teclado USB','Informática','Comercial Vale','Gaspar',110,109.90,'2026-07-16'),
('Projetor','Eletrônicos','Brasil Office','Pomerode',110,1799.90,'2026-08-07'),
('Fone Bluetooth','Eletrônicos','TechSul','Blumenau',75,189.90,'2025-11-04'),
('SSD 500GB','Informática','Norte Tech','Brusque',3,369.90,'2025-06-27'),
('Cadeira Giratória','Escritório','Mega Suprimentos','Pomerode',3,769.90,'2025-05-29'),
('Mouse Óptico','Informática','Comercial Vale','Gaspar',92,79.90,'2026-08-21'),
('Hub USB','Acessórios','Mega Suprimentos','Brusque',58,139.90,'2025-07-01'),
('Grampeador','Escritório','Distribuidora SC','Jaraguá do Sul',85,39.90,'2025-02-03'),
('Caixa de Som','Eletrônicos','TechSul','Timbó',33,239.90,'2025-05-08'),
('Projetor','Eletrônicos','Comercial Vale','Jaraguá do Sul',76,1799.90,'2025-05-05'),
('Cadeira Giratória','Escritório','Comercial Vale','Jaraguá do Sul',88,769.90,'2025-04-24'),
('Luminária','Escritório','Mega Suprimentos','Blumenau',95,149.90,'2025-06-13'),
('Hub USB','Acessórios','TechSul','Itajaí',65,109.90,'2026-05-31'),
('Carregador Portátil','Eletrônicos','TechSul','Brusque',46,149.90,'2025-12-29'),
('Projetor','Eletrônicos','Brasil Office','Gaspar',92,1769.90,'2025-06-10'),
('Grampeador','Escritório','TechSul','Itajaí',53,10.00,'2026-05-10'),
('Mesa Escritório','Escritório','Mega Suprimentos','Gaspar',80,649.90,'2026-01-12'),
('Fone Bluetooth','Eletrônicos','Comercial Vale','Gaspar',60,179.90,'2025-04-28'),
('Caixa de Som','Eletrônicos','Distribuidora SC','Jaraguá do Sul',81,249.90,'2026-07-26'),
('Alicate Universal','Ferramentas','Brasil Office','Gaspar',35,69.90,'2025-04-27'),
('Cabo HDMI','Acessórios','Distribuidora SC','Jaraguá do Sul',3,44.90,'2025-07-05'),
('Monitor LED','Informática','Comercial Vale','Timbó',40,889.90,'2026-05-07'),
('Fone Bluetooth','Eletrônicos','Norte Tech','Gaspar',42,189.90,'2025-11-17'),
('Luminária','Escritório','Norte Tech','Jaraguá do Sul',116,179.90,'2026-06-10'),
('Mesa Escritório','Escritório','Norte Tech','Timbó',86,699.90,'2025-08-16'),
('Projetor','Eletrônicos','Comercial Vale','Indaial',18,1789.90,'2025-10-07'),
('Monitor LED','Informática','TechSul','Gaspar',16,949.90,'2025-07-02'),
('Calculadora','Escritório','Norte Tech','Blumenau',15,119.90,'2026-08-11'),
('Suporte para Notebook','Acessórios','Distribuidora SC','Itajaí',95,109.90,'2025-11-27'),
('Parafusadeira','Ferramentas','Brasil Office','Pomerode',61,579.90,'2025-02-18'),
('Caixa de Som','Eletrônicos','Brasil Office','Pomerode',61,299.90,'2025-11-24'),
('Alicate Universal','Ferramentas','Distribuidora SC','Brusque',51,49.90,'2026-03-23'),
('Martelo','Ferramentas','Brasil Office','Pomerode',8,79.90,'2025-03-09'),
('Maleta de Ferramentas','Ferramentas','Norte Tech','Timbó',18,299.90,'2025-01-08'),
('Projetor','Eletrônicos','Brasil Office','Gaspar',99,1849.90,'2025-06-08'),
('Cabo HDMI','Acessórios','Norte Tech','Jaraguá do Sul',36,94.90,'2025-04-21'),
('Mesa Escritório','Escritório','Distribuidora SC','Itajaí',94,639.90,'2025-09-08'),
('Alicate Universal','Ferramentas','Distribuidora SC','Brusque',78,69.90,'2025-07-15'),
('Mouse Óptico','Informática','Mega Suprimentos','Brusque',53,49.90,'2025-12-06'),
('Carregador Portátil','Eletrônicos','TechSul','Pomerode',6,129.90,'2026-08-02'),
('Caixa de Som','Eletrônicos','Mega Suprimentos','Brusque',109,219.90,'2026-03-30'),
('Caixa de Som','Eletrônicos','Comercial Vale','Blumenau',74,249.90,'2025-04-02');

SELECT * FROM produtos;

SELECT nome, categoria, preco FROM produtos;

SELECT * FROM produtos WHERE categoria = 'Informática';

SELECT * FROm produtos WHERE preco > 500;

SELECT * FROm produtos WHERE cidade_fornecedor = 'Blumenau';

SELECT * FROM produtos WHERE quantidade_estoque > 10 && quantidade_estoque < 50;

SELECT * FROM produtos WHERE nome LIKE 'M%';

SELECT nome, preco FROM produtos
ORDER BY preco DESC
LIMIT 5;
