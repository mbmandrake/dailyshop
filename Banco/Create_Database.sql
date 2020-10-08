USE master
GO

IF DB_ID('DAILYSHOP') IS NOT NULL
BEGIN
	DROP DATABASE DAILYSHOP;

	PRINT 'BANCO REMOVIDO COM SUCESSO!'
END 

CREATE DATABASE DAILYSHOP;

PRINT 'BANCO CRIADO COM SUCESSO!'
GO

USE DAILYSHOP
GO

CREATE TABLE ENDERECO (
	ID_ENDERECO INT NOT NULL PRIMARY KEY IDENTITY,
	TX_RUA VARCHAR(100) NOT NULL,
	TX_BAIRRO VARCHAR(100) NOT NULL,
	TX_CEP VARCHAR(100) NOT NULL,
	NR_CASA INT NOT NULL,
	UF VARCHAR(2) NOT NULL
);
GO

CREATE TABLE GRUPO (
	ID_GRUPO INT NOT NULL PRIMARY KEY IDENTITY,
	TX_NOME VARCHAR(100) NOT NULL,
	TX_DESCRICAO VARCHAR(100) NOT NULL,
	BL_ATIVO BIT NOT NULL,
	DT_REGISTRO DATETIME NOT NULL
);
GO

CREATE TABLE USUARIOS (
	ID_USUARIOS INT NOT NULL PRIMARY KEY IDENTITY ,
	TX_NOME VARCHAR(100) NOT NULL,
	TX_EMAIL VARCHAR(100) NOT NULL,
	TX_SENHA VARCHAR(100) NOT NULL,
	TX_TELEFONE VARCHAR(100) NOT NULL,
	TX_CPF VARCHAR(100) unique NOT NULL,
	ID_ENDERECO INT NOT NULL,
	ID_GRUPO INT NOT NULL,
	BL_ATIVO BIT NOT NULL,
	DT_REGISTRO DATETIME NOT NULL,
	CONSTRAINT FK_ENDERECO_REF_USUARIOS FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECO (ID_ENDERECO),
	CONSTRAINT FK_GRUPO_REF_USUARIOS FOREIGN KEY (ID_GRUPO) REFERENCES GRUPO (ID_GRUPO)
);
GO

CREATE TABLE LISTA_PRODUTO (
	ID_LISTA INT NOT NULL PRIMARY KEY IDENTITY,
	ID_USUARIOS INT NOT NULL,
	VALOR_TOTAL NUMERIC(10,2) NOT NULL,
	FORMA_PAGAMENTO VARCHAR(100) NOT NULL,
	STATUS_PEDIDO VARCHAR(100) NOT NULL,
	BL_ATIVO BIT NOT NULL,
	DT_REGISTRO DATETIME NOT NULL,
	CONSTRAINT FK_USUARIOS_REF_LPROD FOREIGN KEY (ID_USUARIOS) REFERENCES USUARIOS (ID_USUARIOS)
);
GO

CREATE TABLE CATEGORIA (
	ID_CATEGORIA INT NOT NULL PRIMARY KEY IDENTITY,
	TX_NOME VARCHAR(100) NOT NULL,
	BL_ATIVO BIT NOT NULL,
	DT_REGISTRO DATETIME NOT NULL
);
GO

CREATE TABLE PRODUTO (
	ID_PRODUTO INT NOT NULL PRIMARY KEY IDENTITY,
	TX_NOME VARCHAR(100) NOT NULL,
	VALOR_PRODUTO NUMERIC(10,2) NOT NULL,
	TX_VARIACAO VARCHAR(100) NOT NULL,
	PESO NUMERIC(10,2) NOT NULL,
	DIMENSAO NUMERIC(10,2) NOT NULL,
	ID_CATEGORIA INT NOT NULL,
	BL_ATIVO BIT NOT NULL,
	DT_REGISTRO DATETIME NOT NULL,
	CONSTRAINT FK_CATEGORIA_REF_PRODUTO FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA)
);
GO

CREATE TABLE ITEM_COMPRA (
	ID_COMPRA INT NOT NULL PRIMARY KEY IDENTITY,
	ID_LISTA INT NOT NULL,
	ID_PRODUTO INT NOT NULL,
	VALOR_PRODUTO NUMERIC(10,2) NOT NULL,
	VALOR_TOTAL NUMERIC(10,2) NOT NULL,
	CONSTRAINT FK_LISTA_REF_ITEMCOMPRA FOREIGN KEY (ID_LISTA) REFERENCES LISTA_PRODUTO (ID_LISTA),
	CONSTRAINT FK_PRODUTO_REF_ITEMCOMPRA FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);
GO

CREATE TABLE TOKEN (
	ID_TOKEN INT NOT NULL PRIMARY KEY IDENTITY,
	TX_TOKEN VARCHAR(250) NOT NULL,
	DT_EXPIRACAO DATETIME NOT NULL
);
GO