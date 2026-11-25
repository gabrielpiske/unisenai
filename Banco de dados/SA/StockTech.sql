-- STOCKTECH - SCRIPT 01: CRIAÇÃO DO BANCO DE DADOS E TABELAS (3FN)

DROP DATABASE IF EXISTS stocktech;
CREATE DATABASE stocktech
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE stocktech;

-- -----------------------------------------------------------------------------
-- 1. Tabela clientes
-- -----------------------------------------------------------------------------
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    contato VARCHAR(100) NOT NULL,
    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------
-- 2. Tabela categorias
-- -----------------------------------------------------------------------------
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),
    CONSTRAINT uq_categorias_nome UNIQUE (nome)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------
-- 3. Tabela produtos
-- -----------------------------------------------------------------------------
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    CONSTRAINT pk_produtos PRIMARY KEY (id_produto),
    CONSTRAINT fk_produtos_categoria FOREIGN KEY (id_categoria)
        REFERENCES categorias (id_categoria)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_produtos_preco CHECK (preco_venda > 0),
    CONSTRAINT chk_produtos_estoque CHECK (estoque >= 0)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------
-- 4. Tabela vendas
-- -----------------------------------------------------------------------------
CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    situacao VARCHAR(15) NOT NULL DEFAULT 'ABERTA',
    CONSTRAINT pk_vendas PRIMARY KEY (id_venda),
    CONSTRAINT fk_vendas_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_vendas_situacao CHECK (situacao IN ('ABERTA', 'CONFIRMADA'))
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------
-- 5. Tabela itens_venda
-- -----------------------------------------------------------------------------
CREATE TABLE itens_venda (
    id_item_venda INT AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_praticado DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_itens_venda PRIMARY KEY (id_item_venda),
    CONSTRAINT uq_itens_venda_produto UNIQUE (id_venda, id_produto),
    CONSTRAINT fk_itens_venda_venda FOREIGN KEY (id_venda)
        REFERENCES vendas (id_venda)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_itens_venda_produto FOREIGN KEY (id_produto)
        REFERENCES produtos (id_produto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_itens_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_itens_preco CHECK (preco_praticado > 0)
) ENGINE=InnoDB;

-- -----------------------------------------------------------------------------
-- 6. Tabela pagamentos
-- -----------------------------------------------------------------------------
CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT,
    id_venda INT NOT NULL,
    forma_pagamento VARCHAR(15) NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_pagamentos PRIMARY KEY (id_pagamento),
    CONSTRAINT fk_pagamentos_venda FOREIGN KEY (id_venda)
        REFERENCES vendas (id_venda)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT chk_pagamentos_forma CHECK (forma_pagamento IN ('PIX', 'CARTAO', 'DINHEIRO')),
    CONSTRAINT chk_pagamentos_valor CHECK (valor_pago > 0)
) ENGINE=InnoDB;


-- =============================================================================
-- STOCKTECH - SCRIPT 02: CARGA DE DADOS INICIAIS E AUDITORIA DE CONSISTÊNCIA
-- =============================================================================

USE stocktech;

-- -----------------------------------------------------------------------------
-- 1. Clientes (15 registros | Cliente 15 não possui vendas)
-- -----------------------------------------------------------------------------
INSERT INTO clientes (id_cliente, nome, contato) VALUES
(1,  'Ana Paula Oliveira',       'ana.oliveira@email.com | (47) 99101-1001'),
(2,  'Bruno Henrique Costa',     'bruno.costa@email.com | (47) 99102-1002'),
(3,  'Camila Souza Martins',     'camila.martins@email.com | (47) 99103-1003'),
(4,  'Diego Almeida Santos',     'diego.santos@email.com | (47) 99104-1004'),
(5,  'Eduarda Lima Pereira',     'eduarda.pereira@email.com | (47) 99105-1005'),
(6,  'Felipe Augusto Rocha',     'felipe.rocha@email.com | (47) 99106-1006'),
(7,  'Gabriela Nunes Ferreira',  'gabriela.ferreira@email.com | (47) 99107-1007'),
(8,  'Henrique Castro Ribeiro',  'henrique.ribeiro@email.com | (47) 99108-1008'),
(9,  'Isabela Mendes Cardoso',   'isabela.cardoso@email.com | (47) 99109-1009'),
(10, 'João Pedro Teixeira',      'joao.teixeira@email.com | (47) 99110-1010'),
(11, 'Karina Duarte Barbosa',    'karina.barbosa@email.com | (47) 99111-1011'),
(12, 'Lucas Vinicius Moreira',   'lucas.moreira@email.com | (47) 99112-1012'),
(13, 'Mariana Azevedo Gomes',    'mariana.gomes@email.com | (47) 99113-1013'),
(14, 'Nathan Carvalho Dias',     'nathan.dias@email.com | (47) 99114-1014'),
(15, 'Juliana Ferreira Mendes',  'juliana.mendes@email.com | (47) 99115-1015');

-- -----------------------------------------------------------------------------
-- 2. Categorias (5 registros)
-- -----------------------------------------------------------------------------
INSERT INTO categorias (id_categoria, nome) VALUES
(1, 'Processadores e Placas'),
(2, 'Memória e Armazenamento'),
(3, 'Periféricos'),
(4, 'Monitores e Vídeo'),
(5, 'Redes e Energia');

-- -----------------------------------------------------------------------------
-- 3. Produtos (20 registros | Produtos 3, 4, 8, 12 e 19 com estoque < 5)
-- -----------------------------------------------------------------------------
INSERT INTO produtos (id_produto, id_categoria, descricao, preco_venda, estoque) VALUES
(1,  1, 'Processador AMD Ryzen 5 5600',               850.00, 15),
(2,  1, 'Processador Intel Core i5-12400F',           780.00, 12),
(3,  1, 'Placa-Mãe B550M Pro AM4',                    620.00,  3),
(4,  1, 'Placa de Vídeo RTX 4060 8GB',               1950.00,  2),
(5,  2, 'Memória RAM 16GB DDR4 3200MHz',              240.00, 30),
(6,  2, 'Memória RAM 32GB DDR5 5200MHz',              580.00, 10),
(7,  2, 'SSD NVMe 1TB M.2 PCIe 4.0',                  390.00, 25),
(8,  2, 'SSD SATA 480GB 2.5"',                        210.00,  4),
(9,  3, 'Teclado Mecânico RGB Switch Brown',          320.00, 18),
(10, 3, 'Mouse Gamer Óptico 12000 DPI',               160.00, 22),
(11, 3, 'Headset USB 7.1 Surround',                   250.00, 14),
(12, 3, 'Webcam Full HD 1080p',                       190.00,  3),
(13, 4, 'Monitor IPS 24" Full HD 144Hz',              920.00, 10),
(14, 4, 'Monitor Ultrawide 29" 75Hz',                1280.00,  6),
(15, 4, 'Suporte Articulado a Gás para Monitor',      180.00, 20),
(16, 4, 'Cabo DisplayPort 1.4 2m',                     75.00, 40),
(17, 5, 'Roteador Wi-Fi 6 Dual Band AX3000',          410.00, 16),
(18, 5, 'Switch Gigabit 8 Portas',                    140.00, 25),
(19, 5, 'Nobreak 1200VA Senoidal',                    690.00,  2),
(20, 5, 'Fonte ATX 650W 80 Plus Bronze',              350.00, 15);

-- -----------------------------------------------------------------------------
-- 4. Vendas Confirmadas (25 registros em 3 meses: Ago, Set e Out/2026)
-- -----------------------------------------------------------------------------
INSERT INTO vendas (id_venda, id_cliente, data_venda, situacao) VALUES
-- Agosto/2026 (8 vendas)
(1,  1,  '2026-08-03 10:15:00', 'CONFIRMADA'),
(2,  2,  '2026-08-05 14:30:00', 'CONFIRMADA'),
(3,  3,  '2026-08-08 09:45:00', 'CONFIRMADA'),
(4,  4,  '2026-08-11 16:20:00', 'CONFIRMADA'),
(5,  5,  '2026-08-14 11:05:00', 'CONFIRMADA'),
(6,  6,  '2026-08-18 15:40:00', 'CONFIRMADA'),
(7,  7,  '2026-08-22 10:00:00', 'CONFIRMADA'),
(8,  1,  '2026-08-27 17:10:00', 'CONFIRMADA'),
-- Setembro/2026 (9 vendas)
(9,  8,  '2026-09-02 09:30:00', 'CONFIRMADA'),
(10, 9,  '2026-09-05 13:50:00', 'CONFIRMADA'),
(11, 2,  '2026-09-08 11:25:00', 'CONFIRMADA'),
(12, 10, '2026-09-12 16:00:00', 'CONFIRMADA'),
(13, 3,  '2026-09-15 10:40:00', 'CONFIRMADA'),
(14, 11, '2026-09-19 14:15:00', 'CONFIRMADA'),
(15, 1,  '2026-09-22 15:30:00', 'CONFIRMADA'),
(16, 4,  '2026-09-25 09:20:00', 'CONFIRMADA'),
(17, 12, '2026-09-29 17:05:00', 'CONFIRMADA'),
-- Outubro/2026 (8 vendas)
(18, 5,  '2026-10-02 10:50:00', 'CONFIRMADA'),
(19, 13, '2026-10-06 13:10:00', 'CONFIRMADA'),
(20, 2,  '2026-10-10 15:45:00', 'CONFIRMADA'),
(21, 6,  '2026-10-14 09:35:00', 'CONFIRMADA'),
(22, 14, '2026-10-17 16:40:00', 'CONFIRMADA'),
(23, 3,  '2026-10-21 11:20:00', 'CONFIRMADA'),
(24, 7,  '2026-10-25 14:05:00', 'CONFIRMADA'),
(25, 1,  '2026-10-29 17:30:00', 'CONFIRMADA');

-- -----------------------------------------------------------------------------
-- 5. Itens de Venda (50 registros | 2 itens por venda)
-- -----------------------------------------------------------------------------
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado) VALUES
(1,  1,  1,  850.00), (1,  5,  2,  240.00),  -- Total Venda 1:  1330.00
(2,  2,  1,  780.00), (2,  7,  1,  390.00),  -- Total Venda 2:  1170.00
(3,  9,  2,  320.00), (3,  10, 2,  160.00),  -- Total Venda 3:   960.00
(4,  13, 1,  900.00), (4,  16, 2,   75.00),  -- Total Venda 4:  1050.00
(5,  4,  1, 1950.00), (5,  20, 1,  350.00),  -- Total Venda 5:  2300.00
(6,  17, 2,  410.00), (6,  18, 3,  140.00),  -- Total Venda 6:  1240.00
(7,  3,  1,  620.00), (7,  5,  2,  240.00),  -- Total Venda 7:  1100.00
(8,  11, 2,  250.00), (8,  12, 1,  190.00),  -- Total Venda 8:   690.00
(9,  6,  1,  580.00), (9,  7,  2,  390.00),  -- Total Venda 9:  1360.00
(10, 14, 1, 1280.00), (10, 15, 1,  180.00),  -- Total Venda 10: 1460.00
(11, 8,  3,  210.00), (11, 16, 4,   75.00),  -- Total Venda 11:  930.00
(12, 19, 1,  690.00), (12, 18, 2,  140.00),  -- Total Venda 12:  970.00
(13, 1,  2,  850.00), (13, 3,  2,  620.00),  -- Total Venda 13: 2940.00
(14, 10, 3,  160.00), (14, 11, 1,  250.00),  -- Total Venda 14:  730.00
(15, 7,  2,  390.00), (15, 20, 2,  350.00),  -- Total Venda 15: 1480.00
(16, 13, 2,  920.00), (16, 15, 2,  180.00),  -- Total Venda 16: 2200.00
(17, 9,  1,  320.00), (17, 12, 2,  190.00),  -- Total Venda 17:  700.00
(18, 2,  2,  780.00), (18, 5,  4,  240.00),  -- Total Venda 18: 2520.00
(19, 17, 1,  410.00), (19, 16, 3,   75.00),  -- Total Venda 19:  635.00
(20, 4,  1, 1950.00), (20, 6,  2,  580.00),  -- Total Venda 20: 3110.00
(21, 8,  2,  210.00), (21, 10, 4,  160.00),  -- Total Venda 21: 1060.00
(22, 14, 1, 1280.00), (22, 16, 2,   75.00),  -- Total Venda 22: 1430.00
(23, 19, 1,  690.00), (23, 20, 1,  350.00),  -- Total Venda 23: 1040.00
(24, 9,  2,  320.00), (24, 11, 2,  250.00),  -- Total Venda 24: 1140.00
(25, 1,  1,  850.00), (25, 7,  2,  390.00);  -- Total Venda 25: 1630.00

-- -----------------------------------------------------------------------------
-- 6. Pagamentos (28 registros | Vendas 5, 13 e 20 com pagamento dividido - RN07/RN08)
-- -----------------------------------------------------------------------------
INSERT INTO pagamentos (id_venda, forma_pagamento, valor_pago, data_pagamento) VALUES
(1,  'PIX',      1330.00, '2026-08-03 10:16:00'),
(2,  'CARTAO',   1170.00, '2026-08-05 14:32:00'),
(3,  'DINHEIRO',  960.00, '2026-08-08 09:46:00'),
(4,  'PIX',      1050.00, '2026-08-11 16:22:00'),
(5,  'PIX',      1000.00, '2026-08-14 11:06:00'), -- Pagamento dividido (Venda 5)
(5,  'CARTAO',   1300.00, '2026-08-14 11:07:00'),
(6,  'CARTAO',   1240.00, '2026-08-18 15:42:00'),
(7,  'PIX',      1100.00, '2026-08-22 10:02:00'),
(8,  'DINHEIRO',  690.00, '2026-08-27 17:12:00'),
(9,  'CARTAO',   1360.00, '2026-09-02 09:32:00'),
(10, 'PIX',      1460.00, '2026-09-05 13:52:00'),
(11, 'DINHEIRO',  930.00, '2026-09-08 11:26:00'),
(12, 'CARTAO',    970.00, '2026-09-12 16:02:00'),
(13, 'PIX',      1500.00, '2026-09-15 10:41:00'), -- Pagamento dividido (Venda 13)
(13, 'CARTAO',   1440.00, '2026-09-15 10:42:00'),
(14, 'PIX',       730.00, '2026-09-19 14:16:00'),
(15, 'CARTAO',   1480.00, '2026-09-22 15:32:00'),
(16, 'PIX',      2200.00, '2026-09-25 09:22:00'),
(17, 'DINHEIRO',  700.00, '2026-09-29 17:07:00'),
(18, 'CARTAO',   2520.00, '2026-10-02 10:52:00'),
(19, 'PIX',       635.00, '2026-10-06 13:12:00'),
(20, 'DINHEIRO', 1110.00, '2026-10-10 15:46:00'), -- Pagamento dividido (Venda 20)
(20, 'PIX',      2000.00, '2026-10-10 15:47:00'),
(21, 'PIX',      1060.00, '2026-10-14 09:37:00'),
(22, 'CARTAO',   1430.00, '2026-10-17 16:42:00'),
(23, 'PIX',      1040.00, '2026-10-21 11:22:00'),
(24, 'DINHEIRO', 1140.00, '2026-10-25 14:07:00'),
(25, 'CARTAO',   1630.00, '2026-10-29 17:32:00');

-- =============================================================================
-- STOCKTECH - SCRIPT 03: RELATÓRIOS GERENCIAIS (ETAPA 3)
-- =============================================================================

USE stocktech;

-- -----------------------------------------------------------------------------
-- Relatório 01: Produtos e respectivas categorias
-- -----------------------------------------------------------------------------
SELECT
    p.id_produto,
    p.descricao AS produto,
    c.nome AS categoria,
    p.preco_venda,
    p.estoque
FROM produtos p
INNER JOIN categorias c ON c.id_categoria = p.id_categoria
ORDER BY c.nome, p.descricao;

-- -----------------------------------------------------------------------------
-- Relatório 02: Produtos com estoque inferior a cinco unidades
-- -----------------------------------------------------------------------------
SELECT
    p.id_produto,
    p.descricao AS produto,
    c.nome AS categoria,
    p.estoque
FROM produtos p
INNER JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.estoque < 5
ORDER BY p.estoque ASC, p.descricao ASC;

-- -----------------------------------------------------------------------------
-- Relatório 03: Histórico de compras confirmadas por cliente, com data e número da venda
-- -----------------------------------------------------------------------------
SELECT
    c.id_cliente,
    c.nome AS cliente,
    v.id_venda AS numero_venda,
    v.data_venda,
    v.situacao
FROM clientes c
INNER JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE v.situacao = 'CONFIRMADA'
ORDER BY c.nome ASC, v.data_venda ASC;

-- -----------------------------------------------------------------------------
-- Relatório 04: Detalhamento dos itens das vendas, com quantidade, preço praticado e subtotal
-- -----------------------------------------------------------------------------
SELECT
    v.id_venda,
    v.data_venda,
    v.situacao,
    p.descricao AS produto,
    iv.quantidade,
    iv.preco_praticado,
    (iv.quantidade * iv.preco_praticado) AS subtotal
FROM itens_venda iv
INNER JOIN vendas v ON v.id_venda = iv.id_venda
INNER JOIN produtos p ON p.id_produto = iv.id_produto
ORDER BY v.id_venda ASC, iv.id_item_venda ASC;

-- -----------------------------------------------------------------------------
-- Relatório 05: Valor total de cada venda confirmada
-- -----------------------------------------------------------------------------
SELECT
    v.id_venda,
    v.data_venda,
    c.nome AS cliente,
    SUM(iv.quantidade * iv.preco_praticado) AS valor_total
FROM vendas v
INNER JOIN clientes c ON c.id_cliente = v.id_cliente
INNER JOIN itens_venda iv ON iv.id_venda = v.id_venda
WHERE v.situacao = 'CONFIRMADA'
GROUP BY v.id_venda, v.data_venda, c.nome
ORDER BY v.id_venda ASC;

-- -----------------------------------------------------------------------------
-- Relatório 06: Produtos mais vendidos por quantidade, em ordem decrescente
-- -----------------------------------------------------------------------------
SELECT
    p.id_produto,
    p.descricao AS produto,
    SUM(iv.quantidade) AS quantidade_vendida
FROM itens_venda iv
INNER JOIN vendas v ON v.id_venda = iv.id_venda
INNER JOIN produtos p ON p.id_produto = iv.id_produto
WHERE v.situacao = 'CONFIRMADA'
GROUP BY p.id_produto, p.descricao
ORDER BY quantidade_vendida DESC, p.descricao ASC;

-- -----------------------------------------------------------------------------
-- Relatório 07: Clientes com maior número de vendas confirmadas
-- -----------------------------------------------------------------------------
SELECT
    c.id_cliente,
    c.nome AS cliente,
    COUNT(v.id_venda) AS total_vendas_confirmadas
FROM clientes c
INNER JOIN vendas v ON v.id_cliente = c.id_cliente
WHERE v.situacao = 'CONFIRMADA'
GROUP BY c.id_cliente, c.nome
ORDER BY total_vendas_confirmadas DESC, c.nome ASC;

-- -----------------------------------------------------------------------------
-- Relatório 08: Total recebido por forma de pagamento nas vendas confirmadas
-- -----------------------------------------------------------------------------
SELECT
    pg.forma_pagamento,
    COUNT(pg.id_pagamento) AS quantidade_pagamentos,
    SUM(pg.valor_pago) AS total_recebido
FROM pagamentos pg
INNER JOIN vendas v ON v.id_venda = pg.id_venda
WHERE v.situacao = 'CONFIRMADA'
GROUP BY pg.forma_pagamento
ORDER BY total_recebido DESC;

-- -----------------------------------------------------------------------------
-- Relatório 09: Faturamento mensal das vendas confirmadas, por ano e mês
-- -----------------------------------------------------------------------------
SELECT
    YEAR(v.data_venda) AS ano,
    MONTH(v.data_venda) AS mes,
    COUNT(DISTINCT v.id_venda) AS qtd_vendas,
    SUM(iv.quantidade * iv.preco_praticado) AS faturamento_mensal
FROM vendas v
INNER JOIN itens_venda iv ON iv.id_venda = v.id_venda
WHERE v.situacao = 'CONFIRMADA'
GROUP BY YEAR(v.data_venda), MONTH(v.data_venda)
ORDER BY ano ASC, mes ASC;

-- -----------------------------------------------------------------------------
-- Relatório 10: Valor financeiro do estoque atual (preço de venda x quantidade disponível)
-- -----------------------------------------------------------------------------
-- 10A) Visão detalhada por produto + linha de TOTAL GERAL (WITH ROLLUP)
SELECT
    COALESCE(p.descricao, 'TOTAL GERAL DO ESTOQUE') AS produto,
    SUM(p.estoque) AS quantidade_total,
    SUM(p.preco_venda * p.estoque) AS valor_financeiro_estoque
FROM produtos p
GROUP BY p.descricao WITH ROLLUP;

-- 10B) Visão consolidada direta (valor total único)
SELECT
    SUM(preco_venda * estoque) AS valor_financeiro_total_estoque
FROM produtos;







-- =============================================================================
-- STOCKTECH - SCRIPT 04: DESAFIOS DE TRANSAÇÕES (EXECUÇÃO SEPARADA POR DESAFIO)
-- ATENÇÃO: Restaure a base (Scripts 01 e 02) entre cada desafio, FORA de transações.
-- =============================================================================

USE stocktech;

-- =============================================================================
-- DESAFIO 01: Venda de dois produtos, baixa de estoque, pagamento integral e COMMIT
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, preco_venda, estoque FROM produtos WHERE id_produto IN (5, 10);
SELECT MAX(id_venda) AS ultima_venda FROM vendas;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

INSERT INTO vendas (id_cliente, data_venda, situacao)
VALUES (1, NOW(), 'ABERTA');
SET @id_venda_d1 = LAST_INSERT_ID();

-- Item 1: 2x Produto 5 (240.00 cada = 480.00) + baixa de estoque
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d1, id_produto, 2, preco_venda FROM produtos WHERE id_produto = 5;
UPDATE produtos SET estoque = estoque - 2 WHERE id_produto = 5;

-- Item 2: 1x Produto 10 (160.00 cada = 160.00) + baixa de estoque
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d1, id_produto, 1, preco_venda FROM produtos WHERE id_produto = 10;
UPDATE produtos SET estoque = estoque - 1 WHERE id_produto = 10;

-- Pagamento integral (480.00 + 160.00 = 640.00)
INSERT INTO pagamentos (id_venda, forma_pagamento, valor_pago, data_pagamento)
VALUES (@id_venda_d1, 'PIX', 640.00, NOW());

-- [DURANTE] (venda ainda ABERTA antes da confirmação, itens/estoque/pagamento registrados)
SELECT * FROM vendas WHERE id_venda = @id_venda_d1;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d1;
SELECT * FROM pagamentos WHERE id_venda = @id_venda_d1;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto IN (5, 10);

-- Confirmação da venda (RN11) e COMMIT
UPDATE vendas SET situacao = 'CONFIRMADA' WHERE id_venda = @id_venda_d1;
COMMIT;

-- [DEPOIS]
SELECT * FROM vendas WHERE id_venda = @id_venda_d1;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d1;
SELECT * FROM pagamentos WHERE id_venda = @id_venda_d1;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto IN (5, 10);


-- =============================================================================
-- DESAFIO 02: Venda iniciada com item e baixa de estoque -> cliente desiste (ROLLBACK)
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 7;
SELECT COUNT(*) AS total_vendas FROM vendas;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

INSERT INTO vendas (id_cliente, data_venda, situacao)
VALUES (2, NOW(), 'ABERTA');
SET @id_venda_d2 = LAST_INSERT_ID();

INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d2, id_produto, 3, preco_venda FROM produtos WHERE id_produto = 7;

UPDATE produtos SET estoque = estoque - 3 WHERE id_produto = 7;

-- [DURANTE] (alterações pendentes na transação)
SELECT * FROM vendas WHERE id_venda = @id_venda_d2;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d2;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 7;

-- Desistência do cliente -> desfazer tudo
ROLLBACK;

-- [DEPOIS]
SELECT * FROM vendas WHERE id_venda = @id_venda_d2;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d2;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 7;
SELECT COUNT(*) AS total_vendas FROM vendas;


-- =============================================================================
-- DESAFIO 03: Quantidade solicitada superior ao estoque -> bloqueio e ROLLBACK
-- Produto 4 (RTX 4060) possui estoque = 2; cliente solicita 5 unidades.
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 4;
SELECT COUNT(*) AS total_vendas FROM vendas;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

INSERT INTO vendas (id_cliente, data_venda, situacao)
VALUES (3, NOW(), 'ABERTA');
SET @id_venda_d3 = LAST_INSERT_ID();

-- [DURANTE] Verificação lógica de insuficiência de estoque
SELECT
    id_produto,
    descricao,
    estoque AS estoque_atual,
    5 AS qtd_solicitada,
    (estoque - 5) AS saldo_projetado,
    CASE
        WHEN estoque < 5 THEN 'ESTOQUE INSUFICIENTE - CANCELAR VENDA'
        ELSE 'ESTOQUE DISPONIVEL'
    END AS status_verificacao
FROM produtos
WHERE id_produto = 4;

-- Demonstração opcional da barreira física (CHECK chk_produtos_estoque >= 0):
-- Este comando retornará erro 3819 (Check constraint 'chk_produtos_estoque' is violated)
UPDATE produtos SET estoque = estoque - 5 WHERE id_produto = 4;

-- Desfaz a venda aberta após detectar a insuficiência
ROLLBACK;

-- [DEPOIS]
SELECT * FROM vendas WHERE id_venda = @id_venda_d3;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 4;
SELECT COUNT(*) AS total_vendas FROM vendas;


-- =============================================================================
-- DESAFIO 04: Reajuste incorreto de 15% em todos os produtos -> ROLLBACK
-- Nota: WHERE id_produto > 0 evita bloqueio do Safe Updates no MySQL Workbench.
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, preco_venda FROM produtos ORDER BY id_produto;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

UPDATE produtos
SET preco_venda = ROUND(preco_venda * 1.15, 2)
WHERE id_produto > 0;

-- [DURANTE] (preços reajustados em 15%, ainda não confirmados)
SELECT id_produto, descricao, preco_venda FROM produtos ORDER BY id_produto;

-- Gerente informa percentual incorreto -> restaurar preços
ROLLBACK;

-- [DEPOIS]
SELECT id_produto, descricao, preco_venda FROM produtos ORDER BY id_produto;


-- =============================================================================
-- DESAFIO 05: Reajuste autorizado de 8% nos produtos de uma categoria -> COMMIT
-- Categoria escolhida: 3 (Periféricos)
-- =============================================================================
-- [ANTES]
SELECT p.id_produto, c.nome AS categoria, p.descricao, p.preco_venda
FROM produtos p
JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.id_categoria = 3;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

UPDATE produtos
SET preco_venda = ROUND(preco_venda * 1.08, 2)
WHERE id_categoria = 3
  AND id_produto > 0;

-- [DURANTE] (reajuste aplicado, pendente de confirmação)
SELECT p.id_produto, c.nome AS categoria, p.descricao, p.preco_venda
FROM produtos p
JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.id_categoria = 3;

-- Confirmação permanente
COMMIT;

-- [DEPOIS]
SELECT p.id_produto, c.nome AS categoria, p.descricao, p.preco_venda
FROM produtos p
JOIN categorias c ON c.id_categoria = p.id_categoria
WHERE p.id_categoria = 3;


-- =============================================================================
-- DESAFIO 06: Exclusão indevida de cliente sem vendas -> recuperação via ROLLBACK
-- Cliente escolhido: 15 (Juliana Ferreira Mendes - sem vendas)
-- =============================================================================
-- [ANTES]
SELECT * FROM clientes WHERE id_cliente = 15;
SELECT COUNT(*) AS vendas_do_cliente FROM vendas WHERE id_cliente = 15;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

DELETE FROM clientes WHERE id_cliente = 15;

-- [DURANTE] (cliente não aparece na sessão atual)
SELECT * FROM clientes WHERE id_cliente = 15;
SELECT COUNT(*) AS total_clientes FROM clientes;

-- Descoberta de exclusão indevida -> desfazer
ROLLBACK;

-- [DEPOIS]
SELECT * FROM clientes WHERE id_cliente = 15;
SELECT COUNT(*) AS total_clientes FROM clientes;


-- =============================================================================
-- DESAFIO 07: Venda registrada com baixa de estoque -> pagamento recusado (ROLLBACK)
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 13;
SELECT COUNT(*) AS total_vendas FROM vendas;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

INSERT INTO vendas (id_cliente, data_venda, situacao)
VALUES (4, NOW(), 'ABERTA');
SET @id_venda_d7 = LAST_INSERT_ID();

INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d7, id_produto, 1, preco_venda FROM produtos WHERE id_produto = 13;

UPDATE produtos SET estoque = estoque - 1 WHERE id_produto = 13;

-- [DURANTE] (venda ABERTA, item lançado, estoque reduzido e pagamento recusado/ausente)
SELECT * FROM vendas WHERE id_venda = @id_venda_d7;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d7;
SELECT * FROM pagamentos WHERE id_venda = @id_venda_d7;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 13;

-- Pagamento recusado pela operadora -> cancelar toda a operação (RN11)
ROLLBACK;

-- [DEPOIS]
SELECT * FROM vendas WHERE id_venda = @id_venda_d7;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d7;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 13;
SELECT COUNT(*) AS total_vendas FROM vendas;


-- =============================================================================
-- DESAFIO 08: Venda com 2 itens + SAVEPOINT + 3º item -> reversão parcial e COMMIT
-- Itens mantidos: Prod 9 (1x 320.00) + Prod 10 (1x 160.00) = 480.00
-- Item desistido: Prod 11 (1x 250.00)
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, preco_venda, estoque FROM produtos WHERE id_produto IN (9, 10, 11);

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

INSERT INTO vendas (id_cliente, data_venda, situacao)
VALUES (5, NOW(), 'ABERTA');
SET @id_venda_d8 = LAST_INSERT_ID();

-- Item 1 (Produto 9)
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d8, id_produto, 1, preco_venda FROM produtos WHERE id_produto = 9;
UPDATE produtos SET estoque = estoque - 1 WHERE id_produto = 9;

-- Item 2 (Produto 10)
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d8, id_produto, 1, preco_venda FROM produtos WHERE id_produto = 10;
UPDATE produtos SET estoque = estoque - 1 WHERE id_produto = 10;

-- Ponto de restauração antes do 3º item
SAVEPOINT antes_terceiro_item;

-- Item 3 (Produto 11)
INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_praticado)
SELECT @id_venda_d8, id_produto, 1, preco_venda FROM produtos WHERE id_produto = 11;
UPDATE produtos SET estoque = estoque - 1 WHERE id_produto = 11;

-- [DURANTE - PARTE 1] Os 3 itens e as 3 baixas de estoque aplicados
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d8;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto IN (9, 10, 11);

-- Cliente desiste apenas do 3º item -> reversão parcial até o SAVEPOINT
ROLLBACK TO SAVEPOINT antes_terceiro_item;

-- [DURANTE - PARTE 2] Apenas os 2 primeiros itens preservados e estoque do Prod 11 restaurado
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d8;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto IN (9, 10, 11);

-- Pagamento correto dos 2 itens mantidos (320.00 + 160.00 = 480.00) e confirmação
INSERT INTO pagamentos (id_venda, forma_pagamento, valor_pago, data_pagamento)
VALUES (@id_venda_d8, 'CARTAO', 480.00, NOW());

UPDATE vendas SET situacao = 'CONFIRMADA' WHERE id_venda = @id_venda_d8;
COMMIT;

-- [DEPOIS]
SELECT * FROM vendas WHERE id_venda = @id_venda_d8;
SELECT * FROM itens_venda WHERE id_venda = @id_venda_d8;
SELECT * FROM pagamentos WHERE id_venda = @id_venda_d8;
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto IN (9, 10, 11);


-- =============================================================================
-- DESAFIO 09: Aumento de estoque em +2 unidades, COMMIT e tentativa de ROLLBACK
-- =============================================================================
-- [ANTES]
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 1;

-- [INÍCIO DA TRANSAÇÃO]
START TRANSACTION;

UPDATE produtos
SET estoque = estoque + 2
WHERE id_produto = 1;

-- [DURANTE] (estoque aumentado de 15 para 17, antes do COMMIT)
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 1;

-- Confirma definitivamente a operação
COMMIT;

-- Tentativa de desfazer após o COMMIT (não produz efeito sobre a transação já encerrada)
ROLLBACK;

-- [DEPOIS] (estoque permanece 17 devido à Durabilidade - propriedade D do ACID)
SELECT id_produto, descricao, estoque FROM produtos WHERE id_produto = 1;


-- =============================================================================
-- DESAFIO 10: Isolamento entre duas conexões independentes (Conexão A e Conexão B)
-- INSTRUÇÃO: Abra DUAS conexões/abas independentes no MySQL Workbench e execute
-- os passos exatamente na ordem numerada (Passo 1 -> Passo 6).
-- =============================================================================

-- -------------------- CONEXÃO A (Aba 1) --------------------
-- PASSO 1 [ANTES - Conexão A]:
USE stocktech;
SELECT @@transaction_isolation AS nivel_isolamento_A;
SELECT id_produto, descricao, preco_venda FROM produtos WHERE id_produto = 1;

-- PASSO 2 [DURANTE - Conexão A]: Altera o preço SEM confirmar (sem COMMIT)
START TRANSACTION;
UPDATE produtos SET preco_venda = 999.00 WHERE id_produto = 1;
SELECT id_produto, descricao, preco_venda AS preco_na_conexao_A FROM produtos WHERE id_produto = 1;
-- (NÃO execute COMMIT ainda! Vá para a Conexão B e execute o PASSO 3)


-- -------------------- CONEXÃO B (Aba 2) --------------------
-- PASSO 3 [DURANTE - Conexão B]: Leitura ANTES do COMMIT de A
-- Deve exibir 850.00 (valor original), evitando Dirty Read (Leitura Suja)
USE stocktech;
SELECT @@transaction_isolation AS nivel_isolamento_B;
START TRANSACTION;
SELECT id_produto, descricao, preco_venda AS leitura_1_conexao_B FROM produtos WHERE id_produto = 1;
COMMIT; -- Encerra a primeira transação de B


-- -------------------- CONEXÃO A (Aba 1) --------------------
-- PASSO 4 [CONFIRMAÇÃO - Conexão A]: Confirma a alteração
COMMIT;


-- -------------------- CONEXÃO B (Aba 2) --------------------
-- PASSO 5 [DEPOIS - Conexão B]: Nova transação em B APÓS o COMMIT de A
-- Agora deve exibir 999.00, refletindo o novo snapshot com os dados confirmados
START TRANSACTION;
SELECT id_produto, descricao, preco_venda AS leitura_2_conexao_B FROM produtos WHERE id_produto = 1;
COMMIT;