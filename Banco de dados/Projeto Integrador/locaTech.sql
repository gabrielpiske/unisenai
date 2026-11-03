-- ============================================================================
-- PROJETO LOCATECH - SCRIPT DE CRIAÇÃO DO BANCO DE DADOS (DDL SIMPLIFICADO)
-- ============================================================================

DROP DATABASE IF EXISTS locatech_db;
CREATE DATABASE locatech_db;
USE locatech_db;

-- 1. Tabela de Clientes
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    endereco VARCHAR(200) NOT NULL
);

-- 2. Tabela de Categorias
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(80) NOT NULL UNIQUE,
    descricao VARCHAR(200)
);

-- 3. Tabela de Equipamentos
CREATE TABLE equipamento (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome_equipamento VARCHAR(100) NOT NULL,
    valor_diaria_tabela DECIMAL(10, 2) NOT NULL,
    estoque_total INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
    CHECK (valor_diaria_tabela > 0),
    CHECK (estoque_total >= 0)
);

-- 4. Tabela de Locações
CREATE TABLE locacao (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_efetiva_devolucao DATE NULL,
    situacao ENUM('Aberta', 'Finalizada', 'Cancelada') NOT NULL DEFAULT 'Aberta',
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    -- Regra 7: A data prevista não pode ser anterior à retirada
    CHECK (data_prevista_devolucao >= data_retirada),
    -- Regra 7: Locação finalizada deve ter data efetiva de devolução
    CHECK (
        (situacao = 'Finalizada' AND data_efetiva_devolucao IS NOT NULL) OR
        (situacao IN ('Aberta', 'Cancelada') AND data_efetiva_devolucao IS NULL)
    )
);

-- 5. Tabela de Itens da Locação (Resolução N:N)
CREATE TABLE item_locacao (
    id_item_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_locacao INT NOT NULL,
    id_equipamento INT NOT NULL,
    quantidade INT NOT NULL,
    valor_diaria_negociado DECIMAL(10, 2) NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_locacao) REFERENCES locacao (id_locacao),
    FOREIGN KEY (id_equipamento) REFERENCES equipamento (id_equipamento),
    UNIQUE (id_locacao, id_equipamento),
    CHECK (quantidade > 0),
    CHECK (valor_diaria_negociado > 0),
    CHECK (subtotal >= 0)
);

-- ============================================================================
-- PROJETO LOCATECH - INSERÇÃO DE DADOS (DML)
-- ============================================================================
USE locatech_db;

-- 1. Clientes (10 registros)
INSERT INTO cliente (id_cliente, nome, cpf_cnpj, telefone, email, endereco) VALUES
(1,  'Construtora Horizonte Ltda',               '12.345.678/0001-90', '(47) 3322-1001', 'contato@horizonteobras.com.br',    'Rua XV de Novembro, 1200, Centro'),
(2,  'Carlos Eduardo Mendes',                    '045.882.199-12',     '(47) 99112-3402', 'carlos.mendes@emailficticio.com',  'Rua Bahia, 450, Salto'),
(3,  'Alfa Engenharia e Obras S.A.',             '23.456.789/0001-81', '(47) 3340-2200', 'suprimentos@alfaeng.com.br',       'Av. Brasil, 890, Ponta Aguda'),
(4,  'Mariana Costa Ferreira',                   '078.334.519-44',     '(47) 99223-4510', 'mariana.ferreira@emailficticio.com','Rua Sete de Setembro, 310, Centro'),
(5,  'TecnoPiso Revestimentos Ltda',             '34.567.890/0001-72', '(47) 3328-5566', 'compras@tecnopiso.com.br',         'Rua Itajaí, 2100, Vorstadt'),
(6,  'Roberto Almeida Santos',                   '091.445.629-88',     '(47) 98801-7721', 'roberto.santos@emailficticio.com', 'Rua Amazonas, 1120, Garcia'),
(7,  'Condomínio Residencial Parque das Flores', '45.678.901/0001-63', '(47) 3335-9090', 'sindico@parquedasflores.com.br',   'Rua Antônio da Veiga, 600, Victor Konder'),
(8,  'Fernanda Oliveira Lima',                   '102.556.739-05',     '(47) 99654-8832', 'fernanda.lima@emailficticio.com',  'Rua Joinville, 225, Vila Nova'),
(9,  'Mendes & Silva Reformas Express Ltda',     '56.789.012/0001-54', '(47) 3329-4141', 'operacional@mendesesilva.com.br',  'Rua São Paulo, 1540, Itoupava Seca'),
(10, 'Lucas Gabriel Rocha',                      '114.667.849-30',     '(47) 99188-9900', 'lucas.rocha@emailficticio.com',    'Rua das Missões, 780, Ponta Aguda');

-- 2. Categorias (4 registros)
INSERT INTO categoria (id_categoria, nome_categoria, descricao) VALUES
(1, 'Perfuração e Demolição',            'Furadeiras, marteletes e demolidores.'),
(2, 'Geração de Energia e Compressores', 'Geradores e compressores de ar.'),
(3, 'Limpeza e Jardinagem Industrial',   'Lavadoras de alta pressão, aspiradores e roçadeiras.'),
(4, 'Concretagem e Elevação',            'Betoneiras, compactadores de solo e andaimes.');

-- 3. Equipamentos (12 registros)
INSERT INTO equipamento (id_equipamento, id_categoria, nome_equipamento, valor_diaria_tabela, estoque_total) VALUES
(1,  1, 'Furadeira de Impacto Profissional 800W',         45.00,  8),
(2,  1, 'Martelete Perfurador Rompedor 5kg',              95.00,  5),
(3,  1, 'Martelo Demolidor Hexagonal 30kg',              180.00,  3),
(4,  2, 'Gerador de Energia a Gasolina 5kVA',            220.00,  4),
(5,  2, 'Gerador de Energia a Diesel Silenciado 15kVA',  450.00,  2),
(6,  2, 'Compressor de Ar Profissional 100L',            110.00,  4),
(7,  3, 'Lavadora de Alta Pressão Profissional 2200 PSI', 85.00,  6),
(8,  3, 'Aspirador Industrial Sólidos e Líquidos 70L',    70.00,  5),
(9,  3, 'Roçadeira Lateral a Combustão 43cc',             65.00,  3),
(10, 4, 'Betoneira Profissional 400 Litros',             140.00,  6),
(11, 4, 'Compactador de Solo Tipo Sapo 4 Tempos',        190.00,  3),
(12, 4, 'Andaime Tubular Metálico (Kit Torre 2m)',        55.00, 12);

-- 4. Locações (20 registros entre Julho e Novembro/2026)
INSERT INTO locacao (id_locacao, id_cliente, data_retirada, data_prevista_devolucao, data_efetiva_devolucao, situacao) VALUES
(1,  1,  '2026-07-05', '2026-07-10', '2026-07-10', 'Finalizada'),
(2,  2,  '2026-07-15', '2026-07-18', '2026-07-18', 'Finalizada'),
(3,  3,  '2026-08-03', '2026-08-10', '2026-08-11', 'Finalizada'),
(4,  4,  '2026-08-12', '2026-08-12', '2026-08-12', 'Finalizada'),
(5,  5,  '2026-08-20', '2026-08-25', NULL,         'Cancelada'),
(6,  1,  '2026-09-02', '2026-09-12', '2026-09-12', 'Finalizada'),
(7,  6,  '2026-09-10', '2026-09-14', '2026-09-14', 'Finalizada'),
(8,  7,  '2026-09-18', '2026-09-20', '2026-09-21', 'Finalizada'),
(9,  8,  '2026-09-25', '2026-09-28', NULL,         'Cancelada'),
(10, 3,  '2026-10-01', '2026-10-08', '2026-10-08', 'Finalizada'),
(11, 9,  '2026-10-10', '2026-10-15', '2026-10-15', 'Finalizada'),
(12, 5,  '2026-10-18', '2026-10-22', '2026-10-22', 'Finalizada'),
(13, 10, '2026-10-25', '2026-10-27', '2026-10-28', 'Finalizada'),
(14, 1,  '2026-11-03', '2026-11-08', '2026-11-08', 'Finalizada'),
(15, 4,  '2026-11-10', '2026-11-12', NULL,         'Cancelada'),
-- 3 Locações Abertas em atraso (previstas para antes de 30/11/2026)
(16, 2,  '2026-11-12', '2026-11-18', NULL,         'Aberta'),
(17, 9,  '2026-11-15', '2026-11-22', NULL,         'Aberta'),
(18, 5,  '2026-11-20', '2026-11-25', NULL,         'Aberta'),
-- 2 Locações Abertas dentro do prazo
(19, 3,  '2026-11-26', '2026-12-04', NULL,         'Aberta'),
(20, 7,  '2026-11-28', '2026-12-02', NULL,         'Aberta');

-- 5. Itens de Locação (32 registros)
INSERT INTO item_locacao (id_item_locacao, id_locacao, id_equipamento, quantidade, valor_diaria_negociado, subtotal) VALUES
(1,  1,  10, 2, 135.00, 1350.00),
(2,  1,  1,  3,  40.00,  600.00),
(3,  2,  7,  1,  85.00,  255.00),
(4,  3,  3,  2, 175.00, 2800.00),
(5,  3,  11, 1, 190.00, 1520.00),
(6,  4,  8,  1,  70.00,   70.00),
(7,  5,  6,  2, 105.00,    0.00),
(8,  6,  5,  1, 420.00, 4200.00),
(9,  6,  12, 6,  50.00, 3000.00),
(10, 7,  9,  2,  60.00,  480.00),
(11, 8,  7,  2,  80.00,  480.00),
(12, 8,  8,  2,  65.00,  390.00),
(13, 9,  1,  1,  45.00,    0.00),
(14, 10, 10, 3, 130.00, 2730.00),
(15, 10, 2,  2,  90.00, 1260.00),
(16, 11, 12, 4,  52.00, 1040.00),
(17, 11, 6,  1, 110.00,  550.00),
(18, 12, 2,  2,  95.00,  760.00),
(19, 12, 8,  1,  70.00,  280.00),
(20, 13, 4,  1, 210.00,  630.00),
(21, 14, 11, 2, 185.00, 1850.00),
(22, 15, 7,  1,  85.00,    0.00),
(23, 16, 1,  2,  45.00,  540.00),
(24, 16, 2,  1,  95.00,  570.00),
(25, 17, 4,  2, 200.00, 2800.00),
(26, 17, 6,  1, 105.00,  735.00),
(27, 18, 3,  1, 180.00,  900.00),
(28, 19, 5,  1, 440.00, 3520.00),
(29, 19, 10, 2, 135.00, 2160.00),
(30, 19, 12, 5,  50.00, 2000.00),
(31, 20, 7,  2,  80.00,  640.00),
(32, 20, 9,  1,  65.00,  260.00);

USE locatech_db;

-- 1. Listar todos os clientes em ordem alfabética.
SELECT id_cliente, nome, cpf_cnpj, telefone, email, endereco
FROM cliente
ORDER BY nome ASC;

-- 2. Listar nome e telefone dos clientes.
SELECT nome, telefone
FROM cliente
ORDER BY nome ASC;

-- 3. Listar os equipamentos e suas diárias de tabela, do maior para o menor valor.
SELECT id_equipamento, nome_equipamento, valor_diaria_tabela
FROM equipamento
ORDER BY valor_diaria_tabela DESC;

-- 4. Localizar equipamentos cuja diária de tabela ultrapasse R$ 100,00.
SELECT id_equipamento, nome_equipamento, valor_diaria_tabela, estoque_total
FROM equipamento
WHERE valor_diaria_tabela > 100.00
ORDER BY valor_diaria_tabela DESC;

-- 5. Listar as locações com situação Aberta.
SELECT id_locacao, id_cliente, data_retirada, data_prevista_devolucao, situacao
FROM locacao
WHERE situacao = 'Aberta';

-- 6. Listar as locações Finalizadas.
SELECT id_locacao, id_cliente, data_retirada, data_prevista_devolucao, data_efetiva_devolucao, situacao
FROM locacao
WHERE situacao = 'Finalizada';

-- 7. Listar as locações Canceladas.
SELECT id_locacao, id_cliente, data_retirada, data_prevista_devolucao, situacao
FROM locacao
WHERE situacao = 'Cancelada';

-- 8. Listar locações com retirada em um mês definido pela equipe (Outubro de 2026).
SELECT id_locacao, id_cliente, data_retirada, data_prevista_devolucao, data_efetiva_devolucao, situacao
FROM locacao
WHERE data_retirada BETWEEN '2026-10-01' AND '2026-10-31';

-- 9. Listar locações com previsão de devolução anterior à data de referência (30/11/2026) e situação Aberta.
SELECT id_locacao, id_cliente, data_retirada, data_prevista_devolucao, situacao
FROM locacao
WHERE situacao = 'Aberta'
  AND data_prevista_devolucao < '2026-11-30';

-- 10. Contar o total de clientes cadastrados.
SELECT COUNT(*) AS total_clientes
FROM cliente;

-- 11. Contar locações por situação.
SELECT situacao, COUNT(*) AS quantidade_locacoes
FROM locacao
GROUP BY situacao;

-- 12. Calcular a média das diárias de tabela dos equipamentos.
SELECT ROUND(AVG(valor_diaria_tabela), 2) AS media_diaria_tabela
FROM equipamento;

-- 13. Listar equipamentos com estoque total maior que três unidades.
SELECT id_equipamento, nome_equipamento, estoque_total, valor_diaria_tabela
FROM equipamento
WHERE estoque_total > 3
ORDER BY estoque_total DESC;

-- 14. Exibir as cinco diárias de tabela mais elevadas.
SELECT id_equipamento, nome_equipamento, valor_diaria_tabela
FROM equipamento
ORDER BY valor_diaria_tabela DESC
LIMIT 5;

-- 15. Exibir a quantidade de locações realizadas em cada mês, ordenadas cronologicamente.
SELECT DATE_FORMAT(data_retirada, '%Y-%m') AS mes_ano,
       COUNT(*) AS total_locacoes
FROM locacao
GROUP BY DATE_FORMAT(data_retirada, '%Y-%m')
ORDER BY mes_ano ASC;

-- Relatório 1
SELECT e.id_equipamento,
       e.nome_equipamento,
       c.nome_categoria AS categoria,
       e.valor_diaria_tabela,
       e.estoque_total
FROM equipamento e
INNER JOIN categoria c ON c.id_categoria = e.id_categoria
ORDER BY c.nome_categoria ASC, e.nome_equipamento ASC;

-- Relatório 2
SELECT l.id_locacao,
       c.nome AS cliente,
       c.telefone,
       l.data_retirada,
       l.data_prevista_devolucao,
       l.situacao
FROM locacao l
INNER JOIN cliente c ON c.id_cliente = l.id_cliente
WHERE l.situacao = 'Aberta'
ORDER BY l.data_prevista_devolucao ASC;

-- Relatório 3
SELECT l.id_locacao,
       c.nome AS cliente,
       c.telefone,
       l.data_retirada,
       l.data_prevista_devolucao,
       DATEDIFF('2026-11-30', l.data_prevista_devolucao) AS dias_em_atraso
FROM locacao l
INNER JOIN cliente c ON c.id_cliente = l.id_cliente
WHERE l.situacao = 'Aberta'
  AND l.data_prevista_devolucao < '2026-11-30'
ORDER BY dias_em_atraso DESC;

-- Relatório 4
SELECT c.nome AS cliente,
       l.id_locacao,
       e.nome_equipamento AS equipamento,
       il.quantidade,
       l.data_retirada,
       l.situacao
FROM cliente c
INNER JOIN locacao l ON l.id_cliente = c.id_cliente
INNER JOIN item_locacao il ON il.id_locacao = l.id_locacao
INNER JOIN equipamento e ON e.id_equipamento = il.id_equipamento
WHERE c.id_cliente = 3
ORDER BY l.data_retirada DESC, e.nome_equipamento ASC;

-- Relatório 5
SELECT e.id_equipamento,
       e.nome_equipamento AS equipamento,
       il.quantidade AS qtd_comprometida,
       e.estoque_total,
       c.nome AS cliente,
       l.id_locacao,
       l.data_prevista_devolucao
FROM item_locacao il
INNER JOIN locacao l ON l.id_locacao = il.id_locacao
INNER JOIN equipamento e ON e.id_equipamento = il.id_equipamento
INNER JOIN cliente c ON c.id_cliente = l.id_cliente
WHERE l.situacao = 'Aberta'
ORDER BY e.nome_equipamento ASC, l.data_prevista_devolucao ASC;

-- Relatório 6
SELECT l.id_locacao,
       c.nome AS cliente,
       l.situacao,
       e.nome_equipamento AS equipamento,
       il.quantidade,
       il.valor_diaria_negociado,
       GREATEST(1, DATEDIFF(COALESCE(l.data_efetiva_devolucao, l.data_prevista_devolucao), l.data_retirada)) AS dias_faturaveis,
       ROUND(
           il.quantidade * il.valor_diaria_negociado *
           GREATEST(1, DATEDIFF(COALESCE(l.data_efetiva_devolucao, l.data_prevista_devolucao), l.data_retirada)),
           2
       ) AS subtotal_calculado
FROM locacao l
INNER JOIN cliente c ON c.id_cliente = l.id_cliente
INNER JOIN item_locacao il ON il.id_locacao = l.id_locacao
INNER JOIN equipamento e ON e.id_equipamento = il.id_equipamento
WHERE l.situacao <> 'Cancelada'
ORDER BY l.id_locacao ASC, e.nome_equipamento ASC;

-- Relatório 7
SELECT c.id_cliente,
       c.nome AS cliente,
       COUNT(l.id_locacao) AS total_locacoes_ativas
FROM cliente c
LEFT JOIN locacao l
       ON l.id_cliente = c.id_cliente
      AND l.situacao <> 'Cancelada'
GROUP BY c.id_cliente, c.nome
ORDER BY total_locacoes_ativas DESC, c.nome ASC;

-- Relatório 8
SELECT c.id_cliente,
       c.nome AS cliente,
       COUNT(DISTINCT l.id_locacao) AS qtd_contratos,
       COALESCE(
           ROUND(
               SUM(
                   il.quantidade * il.valor_diaria_negociado *
                   GREATEST(1, DATEDIFF(COALESCE(l.data_efetiva_devolucao, l.data_prevista_devolucao), l.data_retirada))
               ),
               2
           ),
           0.00
       ) AS faturamento_total_calculado
FROM cliente c
LEFT JOIN locacao l
       ON l.id_cliente = c.id_cliente
      AND l.situacao <> 'Cancelada'
LEFT JOIN item_locacao il
       ON il.id_locacao = l.id_locacao
GROUP BY c.id_cliente, c.nome
ORDER BY faturamento_total_calculado DESC, c.nome ASC;

-- Relatório 9
SELECT e.id_equipamento,
       e.nome_equipamento AS equipamento,
       cat.nome_categoria AS categoria,
       e.estoque_total,
       COALESCE(SUM(il.quantidade), 0) AS total_unidades_alugadas
FROM equipamento e
INNER JOIN categoria cat ON cat.id_categoria = e.id_categoria
LEFT JOIN item_locacao il ON il.id_equipamento = e.id_equipamento
LEFT JOIN locacao l
       ON l.id_locacao = il.id_locacao
      AND l.situacao <> 'Cancelada'
GROUP BY e.id_equipamento, e.nome_equipamento, cat.nome_categoria, e.estoque_total
ORDER BY total_unidades_alugadas DESC, e.nome_equipamento ASC;

-- Relatório 10
SELECT DATE_FORMAT(l.data_retirada, '%Y-%m') AS mes_referencia,
       COUNT(DISTINCT l.id_locacao) AS locacoes_validas,
       ROUND(
           SUM(
               il.quantidade * il.valor_diaria_negociado *
               GREATEST(1, DATEDIFF(COALESCE(l.data_efetiva_devolucao, l.data_prevista_devolucao), l.data_retirada))
           ),
           2
       ) AS faturamento_contratual_mensal
FROM locacao l
INNER JOIN item_locacao il ON il.id_locacao = l.id_locacao
WHERE l.situacao <> 'Cancelada'
GROUP BY DATE_FORMAT(l.data_retirada, '%Y-%m')
ORDER BY mes_referencia ASC;