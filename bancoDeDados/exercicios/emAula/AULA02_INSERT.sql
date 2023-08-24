INSERT INTO aula02.bairro
	(nmbairro)
VALUES
	('Centro'),
	('Alto'),
	('Barra'),
	('Guarani');
	
INSERT INTO aula02.cidade
	(nmcidade, uf)
VALUES
	('Teresópolis', 'RJ'),
	('Nova Friburgo', 'RJ');
	

INSERT INTO aula02.endereco
(cep, idcidade, idbairro)
VALUES
    ('12345000', 1, 2),
    ('23456000', 2, 3),
    ('34567000', 1, 4),
    ('45678000', 2, 1),
    ('56789000', 1, 3);


INSERT INTO aula02.cliente
	(codigo, nome, num_endereco, idendereco)
VALUES
	('00001', 'Vilmadir', '123', 1),
	('00002', 'Rusnélio', '567', 2),
	('00003', 'Erionaldo', '64', 3),
	('00004', 'Gisvandro', '87', 4),
	('00005', 'Lucicreide', '546', 5);


	
INSERT INTO aula02.email
	(email, idcliente)
VALUES
	('Vilmadir@gmail.com', (select idcliente from aula02.cliente where codigo = '00001')),
	('Rusnelio@gmail.com', (select idcliente from aula02.cliente where codigo = '00002')),
	('Erionaldo@gmail.com', (select idcliente from aula02.cliente where codigo = '00003')),
	('Gisvandro@gmail.com', (select idcliente from aula02.cliente where codigo = '00004')),
	('Lucicreide@gmail.com', (select idcliente from aula02.cliente where codigo = '00005')),
	('Lucicreide2@gmail.com', (select idcliente from aula02.cliente where codigo = '00005')),
	('Lucicreide3@gmail.com', (select idcliente from aula02.cliente where codigo = '00005'));
	

INSERT INTO aula02.telefone
	(telefone_num, idcliente)
VALUES
	('21986588843', (select idcliente from aula02.cliente where codigo = '00001')),
	('21985655586', (select idcliente from aula02.cliente where codigo = '00001')),
	('22954665788', (select idcliente from aula02.cliente where codigo = '00002')),
	('21988865879', (select idcliente from aula02.cliente where codigo = '00003')),
	('22988328887', (select idcliente from aula02.cliente where codigo = '00004')),
	('22988866887', (select idcliente from aula02.cliente where codigo = '00004')),
	('21984354864', (select idcliente from aula02.cliente where codigo = '00005'));


INSERT INTO aula02.vendedor
	(codigo, nome, num_endereco, idendereco)
VALUES
	('00001', 'Ajusquelio', '435', 1),
	('00002', 'Robineia', '47', 2),
	('00003', 'Osvaldo', '6454', 3),
	('00004', 'Beroaldo', '8737', 4),
	('00005', 'Evangelson', '457', 5);

INSERT INTO aula02.produto
	(codigo, descricao, custo, preco)
VALUES
	('00001', 'Calça', (100 * 0.5), 100),
	('00002', 'Camisa', (50 * 0.5), 50),
	('00003', 'Meia', (10 * 0.5), 10);
	
--SELECT * FROM aula02.produto

/*
INSERT INTO aula02.produto
	(codigo, descricao, custo, preco)
VALUES
	('00001', 'Calça', 0, 100),
	('00002', 'Camisa', 0, 50),
	('00003', 'Meia', 0, 10);
	
UPDATE aula02.produto
SET custo = preco * 0.5
WHERE codigo = '00001';

UPDATE aula02.produto
SET custo = preco * 0.5
WHERE codigo = '00002';

UPDATE aula02.produto
SET custo = preco * 0.5
WHERE codigo = '00003';
*/
	
INSERT INTO aula02.venda
	(idvendedor, idcliente, data_emissao, numero_venda)
VALUES 
	(5, 1, '2023-08-18', '450'),
	(4, 2, '2023-08-18', '451'),
	(3, 3, '2023-08-18', '452'),
	(2, 4, '2023-08-18', '453'),
	(1, 5, '2023-08-18', '454');
	
	
--DELETE FROM aula02.item CASCADE
INSERT INTO aula02.item 
	(idvenda, idproduto, vl_unidade, quantidade, vl_desc, vl_acresc)
VALUES
(
	(SELECT idvenda FROM aula02.venda WHERE numero_venda = '450'),
	(SELECT idproduto FROM aula02.produto WHERE codigo = '00001'),
	(SELECT preco FROM aula02.produto WHERE codigo = '00001'), 2,
	((SELECT preco FROM aula02.produto WHERE codigo = '00001')* 0.1),
	((SELECT preco FROM aula02.produto WHERE codigo = '00001')* 0.05)
),
(
	(SELECT idvenda FROM aula02.venda WHERE numero_venda = '451'),
	(SELECT idproduto FROM aula02.produto WHERE codigo = '00002'),
	(SELECT preco FROM aula02.produto WHERE codigo = '00002'), 13,
	((SELECT preco FROM aula02.produto WHERE codigo = '00002')* 0.1),
	((SELECT preco FROM aula02.produto WHERE codigo = '00002')* 0.05)
),
(
	(SELECT idvenda FROM aula02.venda WHERE numero_venda = '452'),
	(SELECT idproduto FROM aula02.produto WHERE codigo = '00003'),
	(SELECT preco FROM aula02.produto WHERE codigo = '00003'), 3,
	((SELECT preco FROM aula02.produto WHERE codigo = '00003')* 0.1),
	((SELECT preco FROM aula02.produto WHERE codigo = '00003')* 0.05)
),
(
	(SELECT idvenda FROM aula02.venda WHERE numero_venda = '453'),
	(SELECT idproduto FROM aula02.produto WHERE codigo = '00002'),
	(SELECT preco FROM aula02.produto WHERE codigo = '00002'), 5,
	((SELECT preco FROM aula02.produto WHERE codigo = '00002')* 0.1),
	((SELECT preco FROM aula02.produto WHERE codigo = '00002')* 0.05)
),
(
	(SELECT idvenda FROM aula02.venda WHERE numero_venda = '454'),
	(SELECT idproduto FROM aula02.produto WHERE codigo = '00001'),
	(SELECT preco FROM aula02.produto WHERE codigo = '00001'), 7,
	((SELECT preco FROM aula02.produto WHERE codigo = '00001')* 0.1),
	((SELECT preco FROM aula02.produto WHERE codigo = '00001')* 0.05)
);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	