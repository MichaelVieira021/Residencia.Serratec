CREATE SCHEMA projeto_grupo3;

DROP TABLE IF EXISTS projeto_grupo3.funcionario CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.entrada CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.produto CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.categoria CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.pedido_item CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.pedido CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.cliente CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.endereco_entr CASCADE;
DROP TABLE IF EXISTS projeto_grupo3.endereco CASCADE;

CREATE TABLE projeto_grupo3.funcionario (
    idfuncionario serial PRIMARY KEY,
	nome_func varchar(150) NOT null, 
    cpf varchar(11) UNIQUE NOT null
);

CREATE TABLE projeto_grupo3.categoria (
	idcategoria serial PRIMARY KEY,
	nome_cat varchar(100) NOT null,
	descr_cat text
);

CREATE TABLE projeto_grupo3.produto (
	idproduto serial PRIMARY KEY,
	nome_prod varchar(100)  NOT null,
	descr_prod text,
	vl_un double precision NOT null,
	qtd_estoque int NOT null CHECK(qtd_estoque>=0),
	data_fab date NOT null,
	idcategoria int REFERENCES projeto_grupo3.categoria(idcategoria),
	idfuncionario int REFERENCES projeto_grupo3.funcionario(idfuncionario)
);

CREATE TABLE projeto_grupo3.cliente (
	idcliente serial PRIMARY KEY,
	nome_cli varchar(150) NOT null,
	usuario varchar(100) UNIQUE NOT null,
	cpf varchar(11) UNIQUE NOT null,
	email varchar(150) UNIQUE NOT null,
	data_nasc date NOT null	
);

CREATE TABLE projeto_grupo3.endereco (
	idendereco serial PRIMARY KEY,
	cep varchar(8) NOT null,
	tipo_logra varchar(30) NOT null,
	logradouro varchar(200) NOT null,
	numero varchar(10) NOT null,
	complemento varchar(200),
	bairro varchar(50) NOT null,
	cidade varchar(50) NOT null,
	uf varchar(2) NOT null
);

CREATE TABLE projeto_grupo3.endereco_entr (
	idendereco_entr serial PRIMARY KEY,
	idcliente int REFERENCES projeto_grupo3.cliente(idcliente),
	idendereco int REFERENCES projeto_grupo3.endereco(idendereco)
);

CREATE TABLE projeto_grupo3.pedido (
	idpedido serial PRIMARY KEY,
	data_pedido timestamp NOT null,
	idcliente int REFERENCES projeto_grupo3.cliente(idcliente)
);

CREATE TABLE projeto_grupo3.pedido_item (
	idpedido_item serial PRIMARY KEY,
	qtd_prod double precision,
	idproduto int REFERENCES projeto_grupo3.produto(idproduto),
	idpedido int REFERENCES projeto_grupo3.pedido(idpedido)
);