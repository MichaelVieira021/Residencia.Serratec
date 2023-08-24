--Michael de Paula Vieira

--CREATE SCHEMA michaelvieira_exercicio_bd;

DROP TABLE IF EXISTS michaelvieira_exercicio_bd.documento CASCADE;
DROP TABLE IF EXISTS michaelvieira_exercicio_bd.produto CASCADE;
DROP TABLE IF EXISTS michaelvieira_exercicio_bd.produto_doc CASCADE;
DROP TABLE IF EXISTS michaelvieira_exercicio_bd.cliente CASCADE;

CREATE TABLE michaelvieira_exercicio_bd.cliente(
	idcliente serial PRIMARY KEY,
	nmcliente varchar(45) NOT null
);

CREATE TABLE michaelvieira_exercicio_bd.documento(
	iddocumento serial PRIMARY KEY,
	idcliente int REFERENCES michaelvieira_exercicio_bd.cliente(idcliente),
	num_doc varchar(10) unique not null,
	data_doc date NOT null,
	vl_total double precision,
	vl_liquid double precision	
);

CREATE TABLE michaelvieira_exercicio_bd.produto(
	idproduto serial PRIMARY KEY,
	cod_prod varchar(15) UNIQUE NOT null,
	nmprod varchar(45) NOT null,
	vl_custo double precision,
	vl_venda double precision
);

CREATE TABLE michaelvieira_exercicio_bd.produto_doc(
	iddoc_prod serial PRIMARY KEY,
	iddocumento int REFERENCES michaelvieira_exercicio_bd.documento(iddocumento),
	idproduto int REFERENCES michaelvieira_exercicio_bd.produto(idproduto),
	qtd int NOT null CHECK (qtd > 0),
	vl_unid double precision,
	vl_desc double precision,
	vl_acres double precision,
	vl_bruto double precision,
	vl_liquid_docprod double precision
);