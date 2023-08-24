--Uma chave estrangeira é uma coluna ou um grupo de colunas em uma tabela que faz referência à chave primária de outra tabela.
--FORMA REDUZIDA
CREATE TABLE cliente(
	idcliente int PRIMARY KEY,
    nome_cliente varchar(100)
);

CREATE TABLE tabela_referencia(
    idtab_ref int,
    idcliente int REFERENCES clinte
)

--FORMA COMPLETA
CREATE TABLE cliente(
	idcliente int PRIMARY KEY,
    nome_cliente varchar(100)
);

CREATE TABLE tabela_referencia(
    idtab_ref int,
    idcliente int
    CONSTRAINT fk_idcliente FOREIGN KEY (idcliente) REFERENCES cliente (idcliente)
)
