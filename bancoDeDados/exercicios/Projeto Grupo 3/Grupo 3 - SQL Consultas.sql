--Um comando SQL de atualização em algum registro em uma tabela
UPDATE projeto_grupo3.produto SET nome_prod = 'Camiseta' WHERE idproduto = 2;

--Um comando SQL de exclusão de algum registro em uma tabela
DELETE FROM projeto_grupo3.categoria WHERE idcategoria = 6;

--Pelo menos 2 com algum tipo de junção
--Junta as tabelas produto e categoria
SELECT 
	pr.nome_prod AS produto,
	cat.nome_cat AS categoria,
	cat.descr_cat AS descricao,
	CONCAT('R$',pr.vl_un) AS valor_unitario,
	pr.data_fab AS data_fabricacao	
FROM projeto_grupo3.produto pr
LEFT JOIN projeto_grupo3.categoria cat ON cat.idcategoria = pr.idcategoria;

--Junta as tabelas de cliente, endereco_entr, e endereco
SELECT 
	cl.nome_cli,
	cl.cpf,
	CONCAT(e.tipo_logra,' ', e.logradouro,' Nº', e.numero,'-', e.bairro,' ', e.cidade,'-', e.uf) AS endereco,
	cl.email
FROM projeto_grupo3.cliente cl
LEFT JOIN projeto_grupo3.endereco_entr endetr ON endetr.idcliente = cl.idcliente
LEFT JOIN projeto_grupo3.endereco e ON e.idendereco = endetr.idendereco;

--Pelo menos 1 com usando count() e group by()
--Quantidade de produtos diferentes em cada pedido
SELECT
	pd.idpedido,COUNT(pd.idpedido) AS numero_de_produtos_diferentes_no_pedido	
FROM projeto_grupo3.pedido pd
LEFT JOIN projeto_grupo3.pedido_item pditem ON pditem.idpedido = pd.idpedido
GROUP BY 
	pd.idpedido
ORDER BY numero_de_produtos_diferentes_no_pedido DESC;

--Categoria mais vendida na loja
SELECT
	cat.nome_cat,COUNT(cat.nome_cat) AS contidade_produtos
FROM projeto_grupo3.pedido pd
LEFT JOIN projeto_grupo3.pedido_item pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto pr ON pr.idproduto = pditem.idproduto
LEFT JOIN projeto_grupo3.categoria cat ON cat.idcategoria = pr.idcategoria
GROUP BY 
	cat.nome_cat
ORDER BY contidade_produtos DESC;

-------------------------------------------------------
--1 SQL para construção de emissao nota fiscal

SELECT
	pd.idpedido,
	pd.data_pedido,
	cl.nome_cli,
	cl.cpf,
	cl.email,
	CONCAT(ed.tipo_logra,' ', ed.logradouro,' ', ed.numero,' ', ed.complemento,' ', ed.bairro,' ', ed.cidade,' ', ed.uf) AS endereco,
	pr.idproduto,
	pditem.qtd_prod,
	pr.nome_prod,
	pr.vl_un,
	SUM(pditem.qtd_prod * pr.vl_un) AS subtotal,
	(SELECT SUM(pr.vl_un * pditem.qtd_prod)
        FROM projeto_grupo3.pedido_item pditem
        JOIN projeto_grupo3.produto pr ON pr.idproduto = pditem.idproduto
        WHERE pditem.idpedido = pd.idpedido
    ) AS total_bruto_pedido
FROM projeto_grupo3.pedido AS pd
LEFT JOIN projeto_grupo3.pedido_item AS pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto AS pr ON pr.idproduto = pditem.idproduto
LEFT JOIN projeto_grupo3.cliente AS cl ON cl.idcliente = pd.idcliente
LEFT JOIN projeto_grupo3.endereco_entr AS edtr ON edtr.idcliente = cl.idcliente
LEFT JOIN projeto_grupo3.endereco AS ed ON ed.idendereco = edtr.idendereco
GROUP BY pd.idpedido,
	pd.data_pedido,
	cl.nome_cli,
	cl.cpf,
	cl.email,
	CONCAT(ed.tipo_logra,' ', ed.logradouro,' ', ed.numero,' ', ed.complemento,' ', ed.bairro,' ', ed.cidade,' ', ed.uf),
	pr.idproduto,
	pditem.qtd_prod,
	pr.nome_prod,
	pr.vl_un;
	
--Atualizar na base a qtd estoque	
UPDATE projeto_grupo3.produto
SET qtd_estoque = qtd_estoque-
(
SELECT
	SUM(pditem.qtd_prod) AS quantidade_total
FROM projeto_grupo3.pedido AS pd
LEFT JOIN projeto_grupo3.pedido_item AS pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto AS pr ON pr.idproduto = pditem.idproduto
WHERE pr.idproduto = 1
GROUP BY pr.idproduto
)
WHERE idproduto = 1;

UPDATE projeto_grupo3.produto
SET qtd_estoque = qtd_estoque-
(
SELECT
	SUM(pditem.qtd_prod) AS quantidade_total
FROM projeto_grupo3.pedido AS pd
LEFT JOIN projeto_grupo3.pedido_item AS pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto AS pr ON pr.idproduto = pditem.idproduto
WHERE pr.idproduto = 2
GROUP BY pr.idproduto
)
WHERE idproduto = 2;

UPDATE projeto_grupo3.produto
SET qtd_estoque = qtd_estoque-
(
SELECT
	SUM(pditem.qtd_prod) AS quantidade_total
FROM projeto_grupo3.pedido AS pd
LEFT JOIN projeto_grupo3.pedido_item AS pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto AS pr ON pr.idproduto = pditem.idproduto
WHERE pr.idproduto = 3
GROUP BY pr.idproduto
)
WHERE idproduto = 3;

UPDATE projeto_grupo3.produto
SET qtd_estoque = qtd_estoque-
(
SELECT
	SUM(pditem.qtd_prod) AS quantidade_total
FROM projeto_grupo3.pedido AS pd
LEFT JOIN projeto_grupo3.pedido_item AS pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto AS pr ON pr.idproduto = pditem.idproduto
WHERE pr.idproduto = 4
GROUP BY pr.idproduto
)
WHERE idproduto = 4;

UPDATE projeto_grupo3.produto
SET qtd_estoque = qtd_estoque-
(
SELECT
	SUM(pditem.qtd_prod) AS quantidade_total
FROM projeto_grupo3.pedido AS pd
LEFT JOIN projeto_grupo3.pedido_item AS pditem ON pditem.idpedido = pd.idpedido
LEFT JOIN projeto_grupo3.produto AS pr ON pr.idproduto = pditem.idproduto
WHERE pr.idproduto = 5
GROUP BY pr.idproduto
)
WHERE idproduto = 5;

-- Se o funcionario desejar adicionar apenas mais qtd de um produto já cadastrado na base
SELECT*FROM projeto_grupo3.produto;
UPDATE projeto_grupo3.produto
SET qtd_estoque = qtd_estoque+(5) -- adicionar a qtd
WHERE idproduto = 1; --adicionar qual produto pela chave primaria
SELECT*FROM projeto_grupo3.produto;