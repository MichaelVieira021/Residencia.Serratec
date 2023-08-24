--Uma chave primária é uma coluna ou um grupo de colunas usado para identificar uma linha exclusivamente em uma tabela.
--CRIA UMA TABELA COM A COLUNA idcliente SENDO PRIMARY KEY
CREATE TABLE cliente(
	idcliente int PRIMARY KEY
);

--Agora, se quisermos adicionar uma chave primária auto-incrementado, usamos a seguinte instrução:
--CRIA UMA TABELA COM A COLUNA idcliente SENDO PRIMARY KEY E AUTO-INCRMENTADA
CREATE TABLE cliente(
	idcliente SERIAL PRIMARY KEY
);

--Para garantir que os valores armazenados em uma coluna ou grupo de colunas sejam exclusivos nas linhas de uma tabela use UNIQUE.
--CRIA UMA TABELA COM A COLUNA email SENDO UNICA, NÃO PODENDO REPETIR O EMAIL PARA OUTRO CLIENTE
CREATE TABLE cliente(
	idcliente SERIAL PRIMARY KEY,
    email_cliente varchar(50) UNIQUE
);


--TAMBEM PODEMOS CONSTRUIR DA SEGUINTE FORMA
CREATE TABLE cliente(
    idcliente SERIAL,
    email_cliente varchar(50),
    PRIMARY KEY (idclinte),
    UNIQUE (email_cliente)
);

--PODENDO TAMBEM ADICIONAR MAIS DE UMA COLUNA POR VEZ
CREATE TABLE cliente(
    idcliente SERIAL,
    email_cliente varchar(50),
    cpf varchar(11),
    PRIMARY KEY (idclinte),
    UNIQUE (email_cliente, cpf)
);
