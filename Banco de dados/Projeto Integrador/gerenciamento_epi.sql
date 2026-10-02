CREATE DATABASE IF NOT EXISTS gerenciamento_epi;

USE gerenciamento_epi;

CREATE TABLE setor (
    id_setor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL
);

CREATE TABLE categoria_epi (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(60) NOT NULL UNIQUE,
    perfil VARCHAR(40) NOT NULL
);

CREATE TABLE colaborador (
    id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(80) NOT NULL,
    id_setor INT NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    CONSTRAINT fk_colaborador_setor FOREIGN KEY (id_setor) REFERENCES setor(id_setor)
);

CREATE TABLE epi (
    id_epi INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    ca VARCHAR(30) NOT NULL,
    id_categoria INT NOT NULL,
    validade_ca DATE NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    CONSTRAINT fk_epi_categoria FOREIGN KEY (id_categoria) REFERENCES categoria_epi(id_categoria)
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_colaborador INT NOT NULL,
    id_epi INT NOT NULL,
    id_usuario INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    quantidade INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    observacao VARCHAR(200),
    CONSTRAINT fk_emprestimo_colaborador FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador),
    CONSTRAINT fk_emprestimo_epi FOREIGN KEY (id_epi) REFERENCES epi(id_epi),
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE devolucao (
    id_devolucao INT AUTO_INCREMENT PRIMARY KEY,
    id_emprestimo INT NOT NULL UNIQUE,
    data_devolucao DATE NOT NULL,
    condicao_epi VARCHAR(30) NOT NULL,
    id_usuario INT NOT NULL,
    observacao VARCHAR(200),
    CONSTRAINT fk_devolucao_emprestimo FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo),
    CONSTRAINT fk_devolucao_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Observacao didatica: a tabela epi representa o cadastro do tipo/modelo de EPI em estoque;\n-- a quantidade movimentada e registrada em emprestimo. Os numeros de CA sao ficticios e usados apenas para fins educacionais.\n
INSERT INTO setor (id_setor,nome) VALUES
(1,'Administrativo'),
(2,'Almoxarifado'),
(3,'Carpintaria'),
(4,'Eletrica'),
(5,'Hidraulica'),
(6,'Obras'),
(7,'Pintura'),
(8,'Seguranca do Trabalho'),
(9,'Manutencao'),
(10,'Logistica');

INSERT INTO categoria_epi (id_categoria,nome) VALUES
(1,'Protecao da Cabeca'),
(2,'Protecao dos Olhos e Face'),
(3,'Protecao Auditiva'),
(4,'Protecao Respiratoria'),
(5,'Protecao das Maos'),
(6,'Protecao dos Pes'),
(7,'Protecao contra Quedas'),
(8,'Protecao do Corpo');

INSERT INTO usuario (id_usuario,nome,login,perfil) VALUES
(1,'Marcos Almeida','marcos.almeida','Administrador'),
(2,'Patricia Gomes','patricia.gomes','Seguranca'),
(3,'Rafael Souza','rafael.souza','Almoxarifado'),
(4,'Luciana Martins','luciana.martins','Seguranca'),
(5,'Carlos Vieira','carlos.vieira','Almoxarifado');

INSERT INTO colaborador (id_colaborador,matricula,nome,cargo,id_setor,situacao) VALUES
(1,'MAT0001','Ana Silva','Pedreiro',1,'Ativo'),
(2,'MAT0002','Bruno Costa','Encanador',2,'Ativo'),
(3,'MAT0003','Camila Souza','Assistente',3,'Ativo'),
(4,'MAT0004','Daniel Martins','Eletricista',4,'Ativo'),
(5,'MAT0005','Eduarda Lima','Pintor',5,'Ativo'),
(6,'MAT0006','Felipe Rocha','Supervisor',6,'Ativo'),
(7,'MAT0007','Gabriela Alves','Tecnico',7,'Ativo'),
(8,'MAT0008','Henrique Santos','Carpinteiro',8,'Ativo'),
(9,'MAT0009','Isabela Gomes','Almoxarife',9,'Ativo'),
(10,'MAT0010','Joao Ribeiro','Auxiliar',10,'Ativo'),
(11,'MAT0011','Karina Freitas','Pedreiro',1,'Ativo'),
(12,'MAT0012','Lucas Cardoso','Encanador',2,'Ativo'),
(13,'MAT0013','Mariana Fernandes','Assistente',3,'Ativo'),
(14,'MAT0014','Nicolas Pereira','Eletricista',4,'Ativo'),
(15,'MAT0015','Olivia Barbosa','Pintor',5,'Ativo'),
(16,'MAT0016','Paulo Teixeira','Supervisor',6,'Ativo'),
(17,'MAT0017','Renata Melo','Tecnico',7,'Ativo'),
(18,'MAT0018','Samuel Nunes','Carpinteiro',8,'Ativo'),
(19,'MAT0019','Tatiana Carvalho','Almoxarife',9,'Ativo'),
(20,'MAT0020','Vinicius Araujo','Auxiliar',10,'Ativo'),
(21,'MAT0021','Amanda Moraes','Pedreiro',1,'Ativo'),
(22,'MAT0022','Caio Duarte','Encanador',2,'Ativo'),
(23,'MAT0023','Debora Pires','Assistente',3,'Ativo'),
(24,'MAT0024','Eduardo Lopes','Eletricista',4,'Ativo'),
(25,'MAT0025','Fernanda Vieira','Pintor',5,'Ativo'),
(26,'MAT0026','Gustavo Monteiro','Supervisor',6,'Ativo'),
(27,'MAT0027','Helena Ramos','Tecnico',7,'Ativo'),
(28,'MAT0028','Igor Batista','Carpinteiro',8,'Ativo'),
(29,'MAT0029','Juliana Silveira','Almoxarife',9,'Ativo'),
(30,'MAT0030','Mateus Nunes','Auxiliar',10,'Ativo');

INSERT INTO epi (id_epi,nome,ca,id_categoria,validade_ca,valor_unitario,quantidade_estoque,situacao) VALUES
(1,'Capacete de Seguranca','CA-10001',1,'2028-01-15',35.9,40,'Ativo'),
(2,'Capacete com Jugular','CA-10002',1,'2029-02-15',49.9,25,'Ativo'),
(3,'Oculos de Protecao Incolor','CA-11001',2,'2027-03-15',18.5,60,'Ativo'),
(4,'Oculos de Protecao Fume','CA-11002',2,'2028-04-15',22.9,35,'Ativo'),
(5,'Protetor Facial','CA-11003',2,'2029-05-15',45.0,20,'Ativo'),
(6,'Protetor Auricular Plug','CA-12001',3,'2027-06-15',6.9,100,'Ativo'),
(7,'Abafador de Ruido','CA-12002',3,'2028-07-15',58.0,30,'Ativo'),
(8,'Mascara PFF2','CA-13001',4,'2029-08-15',5.5,120,'Ativo'),
(9,'Respirador Semifacial','CA-13002',4,'2027-09-15',89.9,18,'Ativo'),
(10,'Filtro para Respirador','CA-13003',4,'2028-10-15',32.0,40,'Ativo'),
(11,'Luva de Vaqueta','CA-14001',5,'2029-11-15',19.9,70,'Ativo'),
(12,'Luva Nitrilica','CA-14002',5,'2027-12-15',14.5,80,'Ativo'),
(13,'Luva Anticorte','CA-14003',5,'2028-01-15',39.9,35,'Ativo'),
(14,'Luva Isolante Classe 00','CA-14004',5,'2029-02-15',185.0,12,'Ativo'),
(15,'Botina de Seguranca','CA-15001',6,'2027-03-15',119.9,45,'Ativo'),
(16,'Bota PVC Cano Longo','CA-15002',6,'2028-04-15',74.9,30,'Ativo'),
(17,'Sapato de Seguranca','CA-15003',6,'2029-05-15',109.9,25,'Ativo'),
(18,'Cinto Paraquedista','CA-16001',7,'2027-06-15',249.9,18,'Ativo'),
(19,'Talabarte Duplo','CA-16002',7,'2028-07-15',189.9,20,'Ativo'),
(20,'Trava Quedas','CA-16003',7,'2029-08-15',159.9,15,'Ativo'),
(21,'Colete Refletivo','CA-17001',8,'2027-09-15',29.9,50,'Ativo'),
(22,'Avental de Raspa','CA-17002',8,'2028-10-15',44.9,22,'Ativo'),
(23,'Macacao de Protecao','CA-17003',8,'2029-11-15',79.9,25,'Ativo'),
(24,'Capa de Chuva','CA-17004',8,'2027-12-15',39.9,30,'Ativo'),
(25,'Perneira de Seguranca','CA-17005',8,'2028-01-15',42.9,25,'Ativo'),
(26,'Mangote de Raspa','CA-17006',8,'2029-02-15',34.9,24,'Ativo'),
(27,'Touca Arabe','CA-17007',8,'2027-03-15',21.9,30,'Ativo'),
(28,'Protetor Solar Profissional','CA-17008',8,'2028-04-15',28.9,40,'Ativo'),
(29,'Joelheira de Protecao','CA-17009',8,'2029-05-15',36.9,20,'Ativo'),
(30,'Cinto Ergonomico','CA-17010',8,'2027-06-15',54.9,20,'Ativo');

INSERT INTO emprestimo (id_emprestimo,id_colaborador,id_epi,id_usuario,data_emprestimo,quantidade,status,observacao) VALUES
(1,7,11,3,'2026-01-10',1,'DEVOLVIDO','Uso em atividade operacional'),
(2,14,22,1,'2026-01-14',1,'DEVOLVIDO','Uso em atividade operacional'),
(3,21,3,4,'2026-01-18',1,'DEVOLVIDO','Uso em atividade operacional'),
(4,28,14,2,'2026-01-22',1,'DEVOLVIDO','Uso em atividade operacional'),
(5,5,25,5,'2026-01-26',2,'DEVOLVIDO','Uso em atividade operacional'),
(6,12,6,3,'2026-01-30',1,'DEVOLVIDO','Uso em atividade operacional'),
(7,19,17,1,'2026-02-03',1,'DEVOLVIDO','Uso em atividade operacional'),
(8,26,28,4,'2026-02-07',1,'DEVOLVIDO','Uso em atividade operacional'),
(9,3,9,2,'2026-02-11',1,'DEVOLVIDO','Uso em atividade operacional'),
(10,10,20,5,'2026-02-15',2,'DEVOLVIDO','Uso em atividade operacional'),
(11,17,1,3,'2026-02-19',1,'DEVOLVIDO','Uso em atividade operacional'),
(12,24,12,1,'2026-02-23',1,'DEVOLVIDO','Uso em atividade operacional'),
(13,1,23,4,'2026-02-27',1,'DEVOLVIDO','Uso em atividade operacional'),
(14,8,4,2,'2026-03-03',1,'DEVOLVIDO','Uso em atividade operacional'),
(15,15,15,5,'2026-03-07',2,'DEVOLVIDO','Uso em atividade operacional'),
(16,22,26,3,'2026-03-11',1,'DEVOLVIDO','Uso em atividade operacional'),
(17,29,7,1,'2026-03-15',1,'DEVOLVIDO','Uso em atividade operacional'),
(18,6,18,4,'2026-03-19',1,'DEVOLVIDO','Uso em atividade operacional'),
(19,13,29,2,'2026-03-23',1,'DEVOLVIDO','Uso em atividade operacional'),
(20,20,10,5,'2026-03-27',2,'DEVOLVIDO','Uso em atividade operacional'),
(21,27,21,3,'2026-03-31',1,'DEVOLVIDO','Uso em atividade operacional'),
(22,4,2,1,'2026-04-04',1,'DEVOLVIDO','Uso em atividade operacional'),
(23,11,13,4,'2026-04-08',1,'DEVOLVIDO','Uso em atividade operacional'),
(24,18,24,2,'2026-04-12',1,'DEVOLVIDO','Uso em atividade operacional'),
(25,25,5,5,'2026-04-16',2,'DEVOLVIDO','Uso em atividade operacional'),
(26,2,16,3,'2026-04-20',1,'DEVOLVIDO','Uso em atividade operacional'),
(27,9,27,1,'2026-04-24',1,'DEVOLVIDO','Uso em atividade operacional'),
(28,16,8,4,'2026-04-28',1,'DEVOLVIDO','Uso em atividade operacional'),
(29,23,19,2,'2026-05-02',1,'DEVOLVIDO','Uso em atividade operacional'),
(30,30,30,5,'2026-05-06',2,'DEVOLVIDO','Uso em atividade operacional'),
(31,7,11,3,'2026-05-10',1,'DEVOLVIDO','Uso em atividade operacional'),
(32,14,22,1,'2026-05-14',1,'DEVOLVIDO','Uso em atividade operacional'),
(33,21,3,4,'2026-05-18',1,'DEVOLVIDO','Uso em atividade operacional'),
(34,28,14,2,'2026-05-22',1,'DEVOLVIDO','Uso em atividade operacional'),
(35,5,25,5,'2026-05-26',2,'DEVOLVIDO','Uso em atividade operacional'),
(36,12,6,3,'2026-05-30',1,'DEVOLVIDO','Uso em atividade operacional'),
(37,19,17,1,'2026-06-03',1,'DEVOLVIDO','Uso em atividade operacional'),
(38,26,28,4,'2026-06-07',1,'DEVOLVIDO','Uso em atividade operacional'),
(39,3,9,2,'2026-06-11',1,'DEVOLVIDO','Uso em atividade operacional'),
(40,10,20,5,'2026-06-15',2,'DEVOLVIDO','Uso em atividade operacional'),
(41,17,1,3,'2026-06-19',1,'EMPRESTADO','Uso em atividade operacional'),
(42,24,12,1,'2026-06-23',1,'EMPRESTADO','Uso em atividade operacional'),
(43,1,23,4,'2026-06-27',1,'EMPRESTADO','Uso em atividade operacional'),
(44,8,4,2,'2026-07-01',1,'EMPRESTADO','Uso em atividade operacional'),
(45,15,15,5,'2026-07-05',2,'EMPRESTADO','Uso em atividade operacional'),
(46,22,26,3,'2026-07-09',1,'EMPRESTADO','Uso em atividade operacional'),
(47,29,7,1,'2026-07-13',1,'EMPRESTADO','Uso em atividade operacional'),
(48,6,18,4,'2026-07-17',1,'EMPRESTADO','Uso em atividade operacional'),
(49,13,29,2,'2026-07-21',1,'EMPRESTADO','Uso em atividade operacional'),
(50,20,10,5,'2026-07-25',2,'EMPRESTADO','Uso em atividade operacional'),
(51,27,21,3,'2026-07-29',1,'EMPRESTADO','Uso em atividade operacional'),
(52,4,2,1,'2026-08-02',1,'EMPRESTADO','Uso em atividade operacional'),
(53,11,13,4,'2026-08-06',1,'EMPRESTADO','Uso em atividade operacional'),
(54,18,24,2,'2026-08-10',1,'EMPRESTADO','Uso em atividade operacional'),
(55,25,5,5,'2026-08-14',2,'EMPRESTADO','Uso em atividade operacional'),
(56,2,16,3,'2026-08-18',1,'EMPRESTADO','Uso em atividade operacional'),
(57,9,27,1,'2026-08-22',1,'EMPRESTADO','Uso em atividade operacional'),
(58,16,8,4,'2026-08-26',1,'EMPRESTADO','Uso em atividade operacional'),
(59,23,19,2,'2026-08-30',1,'EMPRESTADO','Uso em atividade operacional'),
(60,30,30,5,'2026-09-03',2,'EMPRESTADO','Uso em atividade operacional');

INSERT INTO devolucao (id_devolucao,id_emprestimo,data_devolucao,condicao_epi,id_usuario,observacao) VALUES
(1,1,'2026-01-13','Bom',3,'Devolucao registrada'),
(2,2,'2026-01-18','Regular',1,'Devolucao registrada'),
(3,3,'2026-01-23','Bom',4,'Devolucao registrada'),
(4,4,'2026-01-28','Danificado',2,'Devolucao registrada'),
(5,5,'2026-02-02','Bom',5,'Devolucao registrada'),
(6,6,'2026-02-07','Bom',3,'Devolucao registrada'),
(7,7,'2026-02-12','Regular',1,'Devolucao registrada'),
(8,8,'2026-02-17','Bom',4,'Devolucao registrada'),
(9,9,'2026-02-22','Danificado',2,'Devolucao registrada'),
(10,10,'2026-02-27','Bom',5,'Devolucao registrada'),
(11,11,'2026-03-04','Bom',3,'Devolucao registrada'),
(12,12,'2026-03-09','Regular',1,'Devolucao registrada'),
(13,13,'2026-03-14','Bom',4,'Devolucao registrada'),
(14,14,'2026-03-19','Danificado',2,'Devolucao registrada'),
(15,15,'2026-03-24','Bom',5,'Devolucao registrada'),
(16,16,'2026-03-29','Bom',3,'Devolucao registrada'),
(17,17,'2026-04-03','Regular',1,'Devolucao registrada'),
(18,18,'2026-03-21','Bom',4,'Devolucao registrada'),
(19,19,'2026-03-26','Danificado',2,'Devolucao registrada'),
(20,20,'2026-03-31','Bom',5,'Devolucao registrada'),
(21,21,'2026-04-05','Bom',3,'Devolucao registrada'),
(22,22,'2026-04-10','Regular',1,'Devolucao registrada'),
(23,23,'2026-04-15','Bom',4,'Devolucao registrada'),
(24,24,'2026-04-20','Danificado',2,'Devolucao registrada'),
(25,25,'2026-04-25','Bom',5,'Devolucao registrada'),
(26,26,'2026-04-30','Bom',3,'Devolucao registrada'),
(27,27,'2026-05-05','Regular',1,'Devolucao registrada'),
(28,28,'2026-05-10','Bom',4,'Devolucao registrada'),
(29,29,'2026-05-15','Danificado',2,'Devolucao registrada'),
(30,30,'2026-05-20','Bom',5,'Devolucao registrada'),
(31,31,'2026-05-25','Bom',3,'Devolucao registrada'),
(32,32,'2026-05-30','Regular',1,'Devolucao registrada'),
(33,33,'2026-06-04','Bom',4,'Devolucao registrada'),
(34,34,'2026-06-09','Danificado',2,'Devolucao registrada'),
(35,35,'2026-06-14','Bom',5,'Devolucao registrada'),
(36,36,'2026-06-01','Bom',3,'Devolucao registrada'),
(37,37,'2026-06-06','Regular',1,'Devolucao registrada'),
(38,38,'2026-06-11','Bom',4,'Devolucao registrada'),
(39,39,'2026-06-16','Danificado',2,'Devolucao registrada'),
(40,40,'2026-06-21','Bom',5,'Devolucao registrada');


-- Os comandos não são fornecidos nesta parte. Elabore, execute e apresente um print do comando e do resultado.
-- 1.	Mostre todos os registros da tabela setor.
SELECT * FROM setor;

-- 2.	Mostre matrícula, nome e cargo de todos os colaboradores.
SELECT matricula, nome, cargo
FROM colaborador;

-- 3.	Mostre os colaboradores cuja situação seja Ativo.
SELECT * FROM colaborador
WHERE situacao = 'Ativo';

-- 4.	Mostre os colaboradores cujo nome comece com a letra A.
SELECT * FROM colaborador
WHERE nome LIKE 'A%';

-- 5.	Mostre todos os EPIs cadastrados.
SELECT * FROM epi;

-- 6.	Mostre nome, CA e validade do CA de todos os EPIs.
SELECT ca, validade_ca
FROM epi;

-- 7.	Mostre os EPIs com valor unitário maior que R$ 100,00.
SELECT * FROM epi
WHERE valor_unitario > 100;

-- 8.	Mostre os EPIs cuja quantidade em estoque seja menor que 25.
SELECT * FROM epi
WHERE quantidade_estoque < 25;

-- 9.	Mostre os EPIs ordenados pelo valor unitário do maior para o menor.
SELECT * FROM epi
ORDER BY valor_unitario DESC;

-- 10.	Mostre os 5 EPIs de maior valor unitário.
SELECT * FROM epi
ORDER BY valor_unitario DESC LIMIT 5;

-- 11.	Descubra quantos colaboradores estão cadastrados.
SELECT COUNT(*) FROM colaborador;

-- 12.	Descubra quantos EPIs estão cadastrados.
SELECT COUNT(*) FROM epi;

-- 13.	Mostre todos os usuários do sistema ordenados pelo nome.
SELECT * FROM usuario
ORDER BY nome ASC;

-- 14.	Mostre os usuários cujo perfil seja Seguranca.
SELECT * FROM usuario
WHERE perfil = 'Seguranca';

-- 15.	Mostre todos os empréstimos cujo status seja EMPRESTADO.
SELECT * FROM emprestimo
WHERE status = 'Emprestado';

-- 16.	Mostre todos os empréstimos cujo status seja DEVOLVIDO.
SELECT * FROM emprestimo
WHERE status = 'Devolvido';

-- 17.	Mostre os empréstimos realizados entre 01/03/2026 e 30/06/2026.
SELECT * FROM emprestimo
WHERE data_emprestimo BETWEEN '2026-03-01' AND '2026-06-30';

-- 18.	Mostre os empréstimos com quantidade maior que 1.
SELECT * FROM emprestimo
WHERE quantidade > 1;

-- 19.	Mostre todas as devoluções em que a condição do EPI seja Danificado.
SELECT * FROM devolucao
WHERE condicao_epi = 'DANIFICADO';

-- 20.	Mostre as 10 devoluções mais recentes, ordenadas pela data de devolução.
SELECT * FROM devolucao
ORDER BY data_devolucao ASC
LIMIT 10;

SELECT colaborador.matricula, colaborador.nome,        setor.nome AS setor FROM colaborador
INNER JOIN setor ON colaborador.id_setor = setor.id_setor
ORDER BY colaborador.nome;

SELECT epi.nome AS epi, epi.ca,        categoria_epi.nome AS categoria FROM epi
INNER JOIN categoria_epi
ON epi.id_categoria = categoria_epi.id_categoria
ORDER BY epi.nome;

SELECT emprestimo.id_emprestimo, colaborador.nome AS colaborador,        emprestimo.data_emprestimo, emprestimo.status FROM emprestimo
INNER JOIN colaborador
ON emprestimo.id_colaborador = colaborador.id_colaborador;

SELECT emprestimo.id_emprestimo, epi.nome AS epi,        emprestimo.quantidade, emprestimo.data_emprestimo FROM emprestimo
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi;

SELECT emprestimo.id_emprestimo, usuario.nome AS usuario,        usuario.perfil, emprestimo.data_emprestimo FROM emprestimo
INNER JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario;

SELECT colaborador.nome AS colaborador, epi.nome AS epi,        emprestimo.data_emprestimo, emprestimo.quantidade,        emprestimo.status FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi;

SELECT colaborador.matricula, colaborador.nome AS colaborador,        epi.nome AS epi, emprestimo.data_emprestimo,        emprestimo.quantidade FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
WHERE emprestimo.status = 'EMPRESTADO'
ORDER BY colaborador.nome;

SELECT colaborador.nome AS colaborador, epi.nome AS epi,        categoria_epi.nome AS categoria, emprestimo.data_emprestimo FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi INNER JOIN categoria_epi ON epi.id_categoria = categoria_epi.id_categoria
WHERE emprestimo.status = 'EMPRESTADO';

SELECT colaborador.nome AS colaborador, setor.nome AS setor,        epi.nome AS epi, emprestimo.data_emprestimo, emprestimo.status FROM emprestimo INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN setor ON colaborador.id_setor = setor.id_setor
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi;

SELECT colaborador.nome AS colaborador, epi.nome AS epi,        usuario.nome AS responsavel, emprestimo.data_emprestimo,        emprestimo.status FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
INNER JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario;

SELECT colaborador.nome AS colaborador, setor.nome AS setor,        epi.nome AS epi, emprestimo.data_emprestimo FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN setor ON colaborador.id_setor = setor.id_setor
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
WHERE setor.nome = 'Obras' AND emprestimo.status = 'EMPRESTADO';

SELECT colaborador.nome AS colaborador, epi.nome AS epi,        categoria_epi.nome AS categoria, emprestimo.data_emprestimo,        emprestimo.status FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
INNER JOIN categoria_epi ON epi.id_categoria = categoria_epi.id_categoria
WHERE categoria_epi.nome = 'Protecao contra Quedas';

SELECT colaborador.nome AS colaborador, epi.nome AS epi,        emprestimo.data_emprestimo, devolucao.data_devolucao,        devolucao.condicao_epi FROM devolucao
INNER JOIN emprestimo ON devolucao.id_emprestimo = emprestimo.id_emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
ORDER BY devolucao.data_devolucao;

SELECT colaborador.nome AS colaborador, epi.nome AS epi,        devolucao.data_devolucao, devolucao.condicao_epi,        usuario.nome AS responsavel_devolucao FROM devolucao
INNER JOIN emprestimo ON devolucao.id_emprestimo = emprestimo.id_emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
INNER JOIN usuario ON devolucao.id_usuario = usuario.id_usuario;

SELECT colaborador.matricula, colaborador.nome AS colaborador,        setor.nome AS setor, epi.nome AS epi,        categoria_epi.nome AS categoria, emprestimo.data_emprestimo,        usuario.nome AS responsavel_entrega FROM emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN setor ON colaborador.id_setor = setor.id_setor
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi
INNER JOIN categoria_epi ON epi.id_categoria = categoria_epi.id_categoria
INNER JOIN usuario ON emprestimo.id_usuario = usuario.id_usuario
WHERE emprestimo.status = 'EMPRESTADO'
ORDER BY setor.nome, colaborador.nome;

SELECT colaborador.nome AS colaborador, setor.nome AS setor,        epi.nome AS epi, categoria_epi.nome AS categoria,        devolucao.data_devolucao, devolucao.condicao_epi,        usuario.nome AS responsavel_devolucao FROM devolucao
INNER JOIN emprestimo ON devolucao.id_emprestimo = emprestimo.id_emprestimo
INNER JOIN colaborador ON emprestimo.id_colaborador = colaborador.id_colaborador
INNER JOIN setor ON colaborador.id_setor = setor.id_setor
INNER JOIN epi ON emprestimo.id_epi = epi.id_epi INNER JOIN categoria_epi ON epi.id_categoria = categoria_epi.id_categoria INNER JOIN usuario ON devolucao.id_usuario = usuario.id_usuario
ORDER BY devolucao.data_devolucao DESC;

SELECT DISTINCT status FROM emprestimo;
SELECT
    c.matricula,
    c.nome AS colaborador,
    c.cargo,
    s.nome AS setor,
    ep.nome AS epi,
    cat.nome AS categoria,
    emp.data_emprestimo,
    u.nome AS usuario_responsavel_entrega
FROM emprestimo emp
JOIN colaborador c ON emp.id_colaborador = c.id_colaborador
JOIN setor s ON c.id_setor = s.id_setor
JOIN epi ep ON emp.id_epi = ep.id_epi
JOIN categoria_epi cat ON ep.id_categoria = cat.id_categoria
JOIN usuario u ON emp.id_usuario = u.id_usuario
WHERE emp.status = 'EMPRESTADO';

SELECT
    c.nome AS colaborador,
    s.nome AS setor,
    ep.nome AS epi,
    cat.nome AS categoria,
    emp.data_emprestimo,
    d.data_devolucao,
    d.condicao_epi,
    u.nome AS usuario_registro_devolucao
FROM devolucao d
JOIN emprestimo emp ON d.id_emprestimo = emp.id_emprestimo
JOIN colaborador c ON emp.id_colaborador = c.id_colaborador
JOIN setor s ON c.id_setor = s.id_setor
JOIN epi ep ON emp.id_epi = ep.id_epi
JOIN categoria_epi cat ON ep.id_categoria = cat.id_categoria
JOIN usuario u ON d.id_usuario = u.id_usuario;

SELECT
    c.nome AS colaborador,
    s.nome AS setor,
    ep.nome AS epi,
    emp.quantidade,
    emp.data_emprestimo
FROM emprestimo emp
JOIN colaborador c ON emp.id_colaborador = c.id_colaborador
JOIN setor s ON c.id_setor = s.id_setor
JOIN epi ep ON emp.id_epi = ep.id_epi
JOIN categoria_epi cat ON ep.id_categoria = cat.id_categoria
WHERE emp.status = 'EMPRESTADO'
  AND cat.nome = 'Protecao das Maos';

SELECT
    c.nome AS colaborador,
    s.nome AS setor,
    ep.nome AS epi,
    cat.nome AS categoria,
    emp.data_emprestimo,
    d.data_devolucao,
    d.condicao_epi,
    u.nome AS responsavel_devolucao
FROM devolucao d
JOIN emprestimo emp ON d.id_emprestimo = emp.id_emprestimo
JOIN colaborador c ON emp.id_colaborador = c.id_colaborador
JOIN setor s ON c.id_setor = s.id_setor
JOIN epi ep ON emp.id_epi = ep.id_epi
JOIN categoria_epi cat ON ep.id_categoria = cat.id_categoria
JOIN usuario u ON d.id_usuario = u.id_usuario
ORDER BY d.data_devolucao DESC;