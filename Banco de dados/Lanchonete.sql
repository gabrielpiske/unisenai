CREATE DATABASE IF NOT EXISTS lanchonete;
USE lanchonete;


CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    cidade VARCHAR(60) NOT NULL
);


CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);


CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    quantidade INT NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    id_cliente INT,
    id_produto INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO cliente (id_cliente, nome, telefone, cidade) VALUES
(1, 'Ana Silva', '4799300001', 'Gaspar'),
(2, 'Bruno Costa', '4799300002', 'Blumenau'),
(3, 'Camila Souza', '4799300003', 'Gaspar'),
(4, 'Daniel Martins', '4799300004', 'Indaial'),
(5, 'Eduarda Lima', '4799300005', 'Gaspar'),
(6, 'Felipe Rocha', '4799300006', 'Blumenau'),
(7, 'Gabriela Alves', '4799300007', 'Blumenau'),
(8, 'Henrique Santos', '4799300008', 'Indaial'),
(9, 'Isabela Gomes', '4799300009', 'Indaial'),
(10, 'Joao Ribeiro', '4799300010', 'Blumenau'),
(11, 'Karina Freitas', '4799300011', 'Gaspar'),
(12, 'Lucas Cardoso', '4799300012', 'Blumenau'),
(13, 'Mariana Fernandes', '4799300013', 'Pomerode'),
(14, 'Nicolas Pereira', '4799300014', 'Blumenau'),
(15, 'Olivia Barbosa', '4799300015', 'Pomerode'),
(16, 'Paulo Teixeira', '4799300016', 'Pomerode'),
(17, 'Renata Melo', '4799300017', 'Blumenau'),
(18, 'Samuel Nunes', '4799300018', 'Indaial'),
(19, 'Tatiana Carvalho', '4799300019', 'Pomerode'),
(20, 'Vinicius Araujo', '4799300020', 'Indaial'),
(21, 'Amanda Moraes', '4799300021', 'Gaspar'),
(22, 'Caio Duarte', '4799300022', 'Blumenau'),
(23, 'Debora Pires', '4799300023', 'Indaial'),
(24, 'Eduardo Lopes', '4799300024', 'Blumenau'),
(25, 'Fernanda Vieira', '4799300025', 'Gaspar'),
(26, 'Gustavo Monteiro', '4799300026', 'Timbo'),
(27, 'Helena Ramos', '4799300027', 'Blumenau'),
(28, 'Igor Batista', '4799300028', 'Pomerode'),
(29, 'Juliana Silveira', '4799300029', 'Indaial'),
(30, 'Mateus Nunes', '4799300030', 'Pomerode');

INSERT INTO produto (id_produto, nome, categoria, preco) VALUES
(1, 'X-Salada', 'Lanche', 22.50),
(2, 'X-Bacon', 'Lanche', 27.90),
(3, 'X-Frango', 'Lanche', 24.50),
(4, 'Hamburguer', 'Lanche', 18.00),
(5, 'Cheeseburger', 'Lanche', 20.00),
(6, 'Batata Frita', 'Porcao', 16.00),
(7, 'Anel de Cebola', 'Porcao', 18.50),
(8, 'Coxinha', 'Salgado', 8.00),
(9, 'Pastel de Carne', 'Salgado', 10.00),
(10, 'Pastel de Queijo', 'Salgado', 10.00),
(11, 'Pizza Calabresa', 'Pizza', 39.90),
(12, 'Pizza Frango', 'Pizza', 42.00),
(13, 'Refrigerante Cola', 'Bebida', 7.00),
(14, 'Refrigerante Guarana', 'Bebida', 7.00),
(15, 'Suco Laranja', 'Bebida', 9.00),
(16, 'Suco Uva', 'Bebida', 9.00),
(17, 'Agua Mineral', 'Bebida', 5.00),
(18, 'Milk-shake Chocolate', 'Sobremesa', 15.00),
(19, 'Milk-shake Morango', 'Sobremesa', 15.00),
(20, 'Cafe', 'Bebida', 6.00);

INSERT INTO pedido (id_pedido, data_pedido, quantidade, forma_pagamento, id_cliente, id_produto) VALUES
(1, '2026-06-07', 1, 'Dinheiro', 1, 7),
(2, '2026-04-18', 2, 'Pix', 2, 14),
(3, '2026-05-18', 4, 'Cartao', 3, 1),
(4, '2026-08-20', 3, 'Cartao', 4, 8),
(5, '2026-05-13', 4, 'Pix', 5, 15),
(6, '2026-01-05', 1, 'Pix', 6, 2),
(7, '2026-06-14', 3, 'Cartao', 7, 9),
(8, '2026-06-06', 2, 'Cartao', 8, 16),
(9, '2026-03-15', 2, 'Cartao', 9, 3),
(10, '2026-09-10', 2, 'Cartao', 10, 10),
(11, '2026-01-13', 2, 'Cartao', 11, 17),
(12, '2026-01-10', 3, 'Pix', 12, 4),
(13, '2026-03-17', 1, 'Pix', 13, 11),
(14, '2026-02-22', 4, 'Dinheiro', 14, 18),
(15, '2026-05-08', 2, 'Dinheiro', 15, 5),
(16, '2026-07-23', 1, 'Cartao', 16, 12),
(17, '2026-05-10', 2, 'Cartao', 17, 19),
(18, '2026-01-04', 4, 'Dinheiro', 18, 6),
(19, '2026-07-07', 2, 'Pix', 19, 13),
(20, '2026-03-11', 4, 'Pix', 20, 20),
(21, '2026-03-05', 2, 'Cartao', 21, 7),
(22, '2026-06-21', 1, 'Dinheiro', 22, 14),
(23, '2026-05-28', 4, 'Cartao', 23, 1),
(24, '2026-01-12', 1, 'Cartao', 24, 8),
(25, '2026-04-07', 4, 'Pix', 25, 15),
(26, '2026-09-21', 3, 'Pix', 26, 2),
(27, '2026-01-18', 3, 'Cartao', 27, 9),
(28, '2026-05-14', 1, 'Pix', 28, 16),
(29, '2026-03-02', 2, 'Pix', 29, 3),
(30, '2026-09-08', 3, 'Cartao', 30, 10),
(31, '2026-07-12', 1, 'Pix', 1, 17),
(32, '2026-03-12', 1, 'Cartao', 2, 4),
(33, '2026-02-26', 4, 'Cartao', 3, 11),
(34, '2026-08-20', 4, 'Dinheiro', 4, 18),
(35, '2026-08-11', 1, 'Cartao', 5, 5),
(36, '2026-05-03', 2, 'Pix', 6, 12),
(37, '2026-07-21', 1, 'Pix', 7, 19),
(38, '2026-04-11', 4, 'Dinheiro', 8, 6),
(39, '2026-08-09', 2, 'Cartao', 9, 13),
(40, '2026-07-03', 1, 'Dinheiro', 10, 20),
(41, '2026-03-18', 2, 'Pix', 11, 7),
(42, '2026-02-12', 1, 'Dinheiro', 12, 14),
(43, '2026-09-11', 4, 'Dinheiro', 13, 1),
(44, '2026-03-05', 3, 'Dinheiro', 14, 8),
(45, '2026-07-20', 3, 'Cartao', 15, 15),
(46, '2026-09-03', 4, 'Pix', 16, 2),
(47, '2026-08-18', 1, 'Cartao', 17, 9),
(48, '2026-08-10', 3, 'Cartao', 18, 16),
(49, '2026-01-09', 2, 'Cartao', 19, 3),
(50, '2026-08-15', 4, 'Cartao', 20, 10),
(51, '2026-02-23', 3, 'Cartao', 21, 17),
(52, '2026-02-25', 2, 'Cartao', 22, 4),
(53, '2026-05-10', 2, 'Pix', 23, 11),
(54, '2026-04-28', 3, 'Cartao', 24, 18),
(55, '2026-03-28', 1, 'Dinheiro', 25, 5),
(56, '2026-05-19', 4, 'Cartao', 26, 12),
(57, '2026-02-28', 4, 'Dinheiro', 27, 19),
(58, '2026-07-28', 3, 'Cartao', 28, 6),
(59, '2026-01-04', 3, 'Cartao', 29, 13),
(60, '2026-09-03', 1, 'Pix', 30, 20);

-- 1. Mostre todos os registros da tabela cliente.
SELECT * FROM cliente;

-- 2. Mostre somente o nome e a cidade de todos os clientes.
SELECT nome, cidade FROM cliente;

-- 3. Mostre todos os produtos cuja categoria seja Lanche.
SELECT * FROM produto
WHERE categoria = 'Lanche';

-- 4. Mostre os produtos com preco maior que R$ 20,00.
SELECT * FROM produto
WHERE preco > 20.00;

-- 5. Mostre os clientes que moram em Blumenau.
SELECT * FROM cliente
WHERE cidade = 'Blumenau';

-- 6. Mostre os pedidos cuja forma de pagamento seja Pix.
SELECT * FROM pedido
WHERE forma_pagamento = 'Pix';

-- 7. Mostre os produtos cujo nome comece com a letra P.
SELECT * FROM produto
WHERE nome LIKE 'P%';

-- 8. Mostre os pedidos realizados entre 01/03/2026 e 30/06/2026.
SELECT * FROM pedido
WHERE data_pedido BETWEEN '2026-03-01' AND '2026-06-30';

-- 9. Mostre todos os clientes ordenados pelo nome em ordem alfabetica.
SELECT * FROM cliente
ORDER BY nome ASC;

-- 10. Descubra quantos pedidos estao cadastrados.
SELECT COUNT(*) AS quantidade_pedidos
FROM pedido;

-- 11. Mostre somente o nome, a categoria e o preco dos produtos.
SELECT nome, categoria, preco
FROM produto;

-- 12. Mostre os pedidos cuja quantidade seja maior que 2.
SELECT * FROM pedido
WHERE quantidade > 2;

-- 13. Mostre os produtos ordenados pelo preco do maior para o menor.
SELECT * FROM produto
ORDER BY preco DESC;

-- 14. Mostre os clientes cujo nome comece com a letra A.
SELECT * FROM cliente
WHERE nome LIKE 'A%';

-- 15. Descubra quantos clientes estao cadastrados.
SELECT COUNT(*) AS quantidade_clientes
FROM cliente;

-- 16. Descubra quantos produtos estao cadastrados.
SELECT COUNT(*) AS quantidade_produtos
FROM produto;

-- 17. Mostre os 10 primeiros registros da tabela pedido.
SELECT * FROM pedido
LIMIT 10;

-- 18. Mostre os 5 produtos mais caros cadastrados.
SELECT * FROM produto
ORDER BY preco DESC
LIMIT 5;

-- 19. Mostre os 5 produtos mais baratos cadastrados.
SELECT * FROM produto
ORDER BY preco ASC
LIMIT 5;

-- 20. Mostre os pedidos cuja forma de pagamento seja Cartao.
SELECT * FROM pedido
WHERE forma_pagamento = 'Cartao';