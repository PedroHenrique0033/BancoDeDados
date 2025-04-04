CREATE DATABASE LOJA;

DROP DATABASE LOJA;

USE LOJA;

CREATE TABLE CLIENTES (
COD_CLIENTE INT PRIMARY KEY auto_increment,
NOME VARCHAR (100) NOT NULL,
ENDEREÇO VARCHAR (100) NOT NULL,
CIDADE VARCHAR (100) NOT NULL,
CEP VARCHAR (30)
);

CREATE TABLE PEDIDOS (
NUM_PEDIDO INT PRIMARY KEY auto_increment,
DATA_PEDIDO DATETIME,
ITEM VARCHAR (100),
VALOR DECIMAL(10,2) NOT NULL,
COD_CLIENTE INT,
FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES(COD_CLIENTE)
);



INSERT INTO CLIENTES 
(NOME, ENDEREÇO, CIDADE, CEP)
VALUES ( "Richard", "Rua Augusta", "São Paulo", '02143099'),
( "Pedro Henrique", "Rua Santos", "São Paulo", '07676300');
SELECT * FROM CLIENTES;


INSERT INTO PEDIDOS
( COD_CLIENTE, DATA_PEDIDO, ITEM, VALOR)
VALUES (1, '2025-03-14', 'NOTEBOOK', 1500.00),
(2, '2025-03-10', 'MONITOR', 900.00);
SELECT * FROM PEDIDOS;

DROP DATABASE LOJA
