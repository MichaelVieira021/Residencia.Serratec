INSERT INTO projeto_grupo3.categoria
	(nome_cat, descr_cat)
VALUES 
	('Verão', 'Roupas leves para dias quentes'),--idcategoria=1
	('Outono', 'Estilo aconchegante meia-estação'),
	('Inverno', 'Elegância aquecedora'),
	('Primavera', 'Cores e renovação'),
	('Infantil', 'Estilo para pequenos'),
	('Banho', 'Moda à Beira d`água');

INSERT INTO projeto_grupo3.funcionario
	(nome_func, cpf)
VALUES
	('Gustavo', '45295805638'),
	('Gabriel', '86886183800'),
	('Bernardo','83645655409'),
	('Alex', '55067776471'),
	('Bryan', '76983238460'),
	('Michael', '62394890932'),
	('Filipi', '78826043990');
	
INSERT INTO projeto_grupo3.endereco
	(cep, tipo_logra, logradouro, numero, complemento, bairro, cidade, uf)
VALUES
	('12345678', 'Avenida', 'das Flores', '123', 'Bloco B', 'Jardim Primavera', 'Cidade Nova', 'SP'),--idendereco=1
	('23456789', 'Rua', 'dos Pinheiros', '456', 'Apto 789', 'Centro', 'Metropolis', 'SP'),
	('34567890', 'Alameda', 'dos Girassóis', '789', 'Casa', 'Vila Bela', 'Cidade do Sol', 'MG'),
	('45678901', 'Avenida', 'das Palmeiras', '234', 'Apto 567', 'Lagoa Azul', 'Litoralville', 'RJ'),
	('56789012', 'Rua', 'das Acácias', '678', 'Casa', 'Vila Verde', 'Montanhas', 'MG');
	
INSERT INTO projeto_grupo3.cliente
	(nome_cli, usuario, cpf, email, data_nasc)
VALUES	
	('Alice Souza', 'alice123', '67639564794', 'alice.dev21@gmail.com', '1990-03-15'),
	('Bruno Oliveira', 'bruno456', '16394438602', 'baixinho@gmail.com', '1988-07-20'),
	('Carla Santos', 'carla789', '55311272279', 'carla454rj@gmail.com', '1985-11-25'),
	('Daniel Pereira', 'daniel234', '13585578020', 'rori34@gmail.com', '1986-09-10'),
	('Elena Silva', 'elena567', '27561811705', 'elenafenomeno@gmail.com', '1987-05-05');
	
INSERT INTO projeto_grupo3.endereco_entr
	(idendereco, idcliente)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);
	
INSERT INTO projeto_grupo3.pedido
	(data_pedido, idcliente)
VALUES 
	('2023-08-22 00:12:00', 1 ),--idpedido=1
	('2023-07-20 08:10:00', 2 ),
	('2023-06-11 00:20:02', 3 ),
	('2023-07-15 11:11:01', 4 ),
	('2023-08-11 10:01:00', 5 );
	
INSERT INTO projeto_grupo3.produto
	(nome_prod, descr_prod, vl_un, qtd_estoque, data_fab, idcategoria, idfuncionario)
VALUES
	('Camisa', 'Camisa Algodão', 40.00, 30, '2023-05-10', 2,2),
	('Camiseta Regata', 'Camisa sem manga', 35.00, 40, '2023-04-10', 1, 3),
	('Casaco', 'Casaco de Couro', 600.00, 10, '2023-02-10', 3, 4),
	('Vestido', null, 120.00, 20, '2023-06-10', 4, 1),
	('Short', 'Short tactel', 25.00, 50, '2023-02-10', 5, 5);
	
INSERT INTO projeto_grupo3.pedido_item
	(qtd_prod, idproduto, idpedido)
VALUES
	(3, 1, 1),
	(4, 2, 1),
	(6, 3, 2),
	(8, 4, 4),
	(3, 5, 3),
	(4, 2, 5);