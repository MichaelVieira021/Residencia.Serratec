--Michael de Paula Vieira

--CONSULTAS:

--1- Mostrar um documento com seus produtos (através de join)
SELECT 
	doc.num_doc,
	pr.nmprod AS nome_produto,
	prdoc.vl_unid,
	prdoc.qtd,
	prdoc.vl_bruto,
	CONCAT(prdoc.vl_acres*100, '%') AS acrescimo,
	CONCAT(prdoc.vl_desc*100, '%') AS desconto,
	prdoc.vl_liquid_docprod
FROM michaelvieira_exercicio_bd.documento doc
LEFT JOIN michaelvieira_exercicio_bd.produto_doc prdoc ON prdoc.iddocumento = doc.iddocumento
LEFT JOIN michaelvieira_exercicio_bd.produto pr ON pr.idproduto = prdoc.idproduto
WHERE num_doc = '0001';


--2- Mostrar lista de produtos com valor maior que 100,00
SELECT cod_prod, nmprod, vl_venda FROM michaelvieira_exercicio_bd.produto WHERE vl_venda > 100;

--3- Mostrar um documento com o nome de cliente e o nome dos produtos

SELECT 
	doc.num_doc,
	cl.nmcliente AS cliente,
	pr.nmprod AS produto
FROM michaelvieira_exercicio_bd.documento doc
LEFT JOIN michaelvieira_exercicio_bd.cliente cl ON cl.idcliente = doc.idcliente
LEFT JOIN michaelvieira_exercicio_bd.produto_doc prdoc ON prdoc.iddocumento = doc.iddocumento
LEFT JOIN michaelvieira_exercicio_bd.produto pr ON pr.idproduto = prdoc.idproduto
WHERE num_doc = '0003';

------------------------------------------------------------------
--ATUALIZAÇÕES:

--1- Alterar o nome do produto
UPDATE michaelvieira_exercicio_bd.produto SET nmprod = 'Bandana' WHERE idproduto = 7;

--2- Alterar o valor do produto
UPDATE michaelvieira_exercicio_bd.produto SET vl_venda = 50 WHERE idproduto = 7;
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_unid = (SELECT vl_venda FROM michaelvieira_exercicio_bd.produto WHERE idproduto = 7) WHERE idproduto = 7;
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 7; 
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 7;
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_bruto =	
	(vl_unid * qtd) WHERE iddoc_prod = 8; 
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc)) WHERE iddoc_prod = 8;
	
--3- Reajustar em 10% o valor de venda dos produtos
UPDATE michaelvieira_exercicio_bd.produto SET vl_venda = (vl_venda+(vl_venda*0.10));
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_unid = (vl_unid+(vl_unid*0.10));
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_bruto =	
	(vl_unid * qtd); 
UPDATE michaelvieira_exercicio_bd.produto_doc SET vl_liquid_docprod = 
	((vl_bruto + (vl_bruto * vl_acres)) - (vl_bruto * vl_desc));