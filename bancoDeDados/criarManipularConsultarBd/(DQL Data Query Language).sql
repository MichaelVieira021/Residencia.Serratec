SELECT

--Classifique as linhas usando [ORDER BY]
--Filtre as linhas usando [WHERE]

----------------------------------------------------------
--OS COMANDOS SELECTS SERAM BASEADOS NA TABELA SEGUINTE

CREATE TABLE funcionario(
	id_func serial PRIMARY KEY,
	nome_func varchar(50) NOT NULL,
	cpf varchar(11)
);

INSERT INTO funcionario
(id_func, nome_func, cpf)
VALUES
(1, 'Roberto Ferreira', '29932187607'),
(2, 'Jonas Barros', '15557665285'),
(3, 'Ingrid Soares', '42735784258'),
(4, 'Julieta Diaz', '18823671116'),
(5, 'Antônio Lima', '13127823746'),
(6, 'Josias Lourenço', '65852569811'),
(7, 'Ana Júlia', '45898875233'),
(8, 'Jorge Ramos', '66585298524'),
(9, 'Elaine Pereira', '89954856645'),
(10, 'Cláudia Mendes', '25968753699');

------------------------------------------------

SELECT * FROM funcionario

SELECT * FROM funcionario 
ORDER BY nome_func

--ADICIONANDO DESC A TABELA SERA EXIBIDA NA ORDEM DECRESCENTE
--COMANDO ASC EXIBE NA ORDEM CRESCENTE
SELECT * FROM funcionario 
ORDER BY nome_func DESC


--COMANDO LIKE FILTRA NESTE CASO NOMES DE FUNCIONARIOS QUE COMEÇAM COM 'Jo', COMANDO TAMBEM PODE SER USADO ANTES, EXEMPLO '%si' TAMBEM AOS 2 LADOS JUNTOS '%si%'
SELECT nome_func, cpf FROM funcionario
WHERE nome_func LIKE 'Jo%'
















