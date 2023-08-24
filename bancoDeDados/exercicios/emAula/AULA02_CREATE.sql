--PRIMEIROS CODIGOS REALIZADOS EM AULA

--CREATE SCHEMA aula02;

CREATE TABLE aula02.bairro(
	idbairro serial PRIMARY KEY,
	nmbairro varchar(100) NOT NULL
);

CREATE TABLE aula02.cidade(
	idcidade serial PRIMARY KEY,
	nmcidade varchar(100) NOT NULL,
	uf varchar(2) NOT NULL
);

CREATE TABLE aula02.endereco(
	idendereco serial PRIMARY KEY,
	cep varchar(8) NOT NULL,
	idbairro int REFERENCES aula02.bairro(idbairro),
	idcidade int REFERENCES aula02.cidade(idcidade)
);

CREATE TABLE aula02.vendedor(
	idvendedor serial PRIMARY KEY,
	codigo varchar(10) UNIQUE NOT NULL,
	nome varchar(100) NOT NULL,
	num_endereco varchar(10),
	idendereco int REFERENCES aula02.endereco(idendereco)
);


CREATE TABLE aula02.cliente(
	idcliente serial PRIMARY KEY,
	codigo varchar(10) UNIQUE NOT NULL,
	nome varchar(100) NOT NULL,
	num_endereco varchar(10),
	idendereco int REFERENCES aula02.endereco(idendereco)
);

CREATE TABLE aula02.telefone(
	idtelefone serial PRIMARY KEY,
	telefone_num varchar(11) UNIQUE NOT NULL,
	idcliente int REFERENCES aula02.cliente(idcliente)
);

CREATE TABLE aula02.email(
	idemail serial PRIMARY KEY,
	email varchar(120) UNIQUE NOT NULL,
	idcliente int REFERENCES aula02.cliente(idcliente)
);

CREATE TABLE aula02.produto(
	idproduto serial PRIMARY KEY,
	codigo varchar(10) UNIQUE NOT NULL,
	descricao varchar(150) NOT NULL,
	custo double precision,
	preco double precision
);

CREATE TABLE aula02.venda(
	idvenda serial PRIMARY KEY,
	idvendedor int REFERENCES aula02.vendedor(idvendedor),
	idcliente int REFERENCES aula02.cliente(idcliente),
	data_emissao date NOT NULL,
	numero_venda varchar(10) NOT NULL
);
--SELECT * FROM aula02.venda
--ALTER TABLE aula02.venda
--RENAME COLUMN numero TO numero_venda

CREATE TABLE aula02.item(
	iditem serial PRIMARY KEY,
	idvenda int REFERENCES aula02.venda(idvenda),
	idproduto int REFERENCES aula02.produto(idproduto),
	vl_unidade double precision,
	quantidade double precision,
	vl_desc double precision,
	vl_acresc double precision
)