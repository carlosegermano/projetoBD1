CREATE DATABASE PROJETOBD1;
GO

CREATE TABLE categoria(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
);

INSERT INTO categoria
VALUES('Informática'),
	('Escritório'),
	('Cama, mesa e banho'),
	('Eletrônico'),
	('Jardinagem'),
	('Decoração'),
	('Perfumaria'
);
GO

SELECT * FROM categoria;
GO

CREATE TABLE estado(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	nome VARCHAR(255)
);
GO

INSERT INTO estado
VALUES('Paraíba'),
	('Rio Grande do Norte');
GO

SELECT * FROM estado;
GO

CREATE TABLE cidade(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	nome VARCHAR(255),
	estado_id INT
);
GO

INSERT INTO cidade
VALUES('Rio Tinto', 1),
	('Mamanguape', 1),
	('Natal', 2);
GO

SELECT * FROM cidade;
GO

SELECT c.nome, e.nome FROM cidade c
INNER JOIN estado e
ON c.estado_id = e.id
AND c.estado_id = 1;
GO

CREATE TABLE cliente(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	cpf_ou_cnpj VARCHAR(255),
	email VARCHAR(255),
	nome VARCHAR(255),
	senha VARCHAR(255),
	tipo_cliente INT
);
GO

INSERT INTO cliente
VALUES(
	'22546897542',
	'robert.smith@gmail.com',
	'Robert Smith',
	'12345',
	1),
	('55468452144',
	'renato.russo@gmail.com',
	'Renato Manfrandini',
	'54321',
	2);
GO

SELECT * FROM cliente;

CREATE TABLE endereco(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	bairro VARCHAR(255),
	cep VARCHAR(255),
	complemento VARCHAR(255),
	logradouro VARCHAR(255),
	numero VARCHAR(255),
	cidade_id INT,
	cliente_id INT
);
GO

INSERT INTO endereco
VALUES(
	'Centro',
	'58297000',
	'Casa',
	'Rua Flores',
	'300',
	1,
	1),
	('Centro',
	'58297000',
	'Apto B',
	'Av. Dantas',
	'105',
	1,
	2),
	('Jardim',
	'58290080',
	'Casa',
	'Rua Floreano',
	'2106',
	2,
	1),
	('Planalto',
	'54785444',
	'Casa',
	'Rua Única',
	'223',
	3,
	2
);
GO

SELECT * FROM endereco;
GO

SELECT
	c.nome, 
	e.logradouro, 
	e.numero, 
	e.bairro 
FROM cliente c
INNER JOIN endereco e
ON c.id = e.cliente_id;
GO

CREATE TABLE item_pedido(
	desconto FLOAT,
	preco FLOAT,
	quantidade INT,
	pedido_id INT NOT NULL,
	produto_id INT NOT NULL
);

INSERT INTO item_pedido
VALUES
	(0, 2000, 1,	1, 1),
	(0,	80, 2, 1, 3),
	(100, 800, 1, 2, 2);
GO

SELECT * FROM item_pedido;

CREATE TABLE pagamento (
	pedido_id INT NOT NULL PRIMARY KEY,
	estado INT
);
GO

CREATE TABLE pedido(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	instante DATETIME,
	cliente_id INT,
	endereco_de_entrega_id INT
);
GO

CREATE TABLE produto(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	preco FLOAT NOT NULL
);
GO

INSERT INTO produto
VALUES
	('Computador', 2000),
	('Impressora', 800),
	('Mouse', 80),
	('Mesa de escritório', 300),
	('Toalha', 50),
	('Colcha', 200),
	('TV true color', 1200),
	('Roçadeira', 800),
	('Abajur', 100),
	('Shampoo', 90);
GO

SELECT * FROM produto;

INSERT INTO pagamento
VALUES
	(1, 2),
	(2, 1);
GO

SELECT * FROM pagamento;

CREATE TABLE pagamento_com_boleto(
	data_pagamento DATETIME NOT NULL,
	data_vencimento DATETIME NOT NULL,
	pedido_id INT NOT NULL
);

SELECT * FROM pagamento_com_boleto;

CREATE TABLE telefone(
	cliente_id INT NOT NULL,
	telefones VARCHAR(255)
);

INSERT INTO telefone
VALUES(1, '998954451'),
	(2, '988745852'),
	(2, '987845124');
GO

SELECT cli.nome, tel.telefones FROM cliente cli
INNER JOIN telefone tel
ON cli.id = tel.cliente_id;