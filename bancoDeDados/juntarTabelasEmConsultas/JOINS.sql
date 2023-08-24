--Agrupar linhas em grupos usando [GROUP BY]
--Fazer consultas com outras tabelas usando junções como [INNER JOIN, LEFT JOIN, RIGHT JOIN]

CREATE TABLE empresa(
	id_empresa int PRIMARY KEY,
	razaosocial varchar(50),
	endereco varchar(100),
	cnpj varchar(14)
);

create table funcionario(
	id_func serial primary key,
	nome_func varchar (50) not null,
	cpf varchar(11),
	id_empresa int NULL REFERENCES empresa
);

INSERT INTO empresa
(id_empresa, razaosocial, endereco, cnpj)
VALUES
(1, 'Henis Ltda', 'Rua Itaparica, 456 - Vista Dourada','42550686000134'),
(2, 'Matriz Potes', 'Rua Maria de Jesus França, 440 - Vale do Sol','80617728000104'),
(3, 'Amoreira Roupas Atacadista', 'Praça Fausto Cardoso, 420 - Centro','84141145000100'),
(4, 'Skynet Software', 'Rua Antônio Ribeiro Sobrinho, 420 - Alto Monte Cristo','47958897000124');

INSERT INTO funcionario
(id_func, nome_func, cpf, id_empresa)
VALUES
(1, 'Roberto Ferreira', '29932187607', 1),
(2, 'Jonas Barros', '15557665285', 1),
(3, 'Ingrid Soares', '42735784258', 2),
(4, 'Julieta Diaz', '18823671116', null),
(5, 'Antônio Lima', '13127823746', 2),
(6, 'Josias Lourenço', '65852569811', null),
(7, 'Ana Júlia', '45898875233', 2),
(8, 'Jorge Ramos', '66585298524', null),
(9, 'Elaine Pereira', '89954856645', 1),
(10, 'Cláudia Mendes', '25968753699', null);

SELECT * FROM funcionario;
SELECT * FROM empresa;



SELECT
fc.nome_func,
fc.cpf,
e.razaosocial,
e.cnpj
FROM
funcionario fc
INNER JOIN empresa e ON fc.id_empresa =
e.id_empresa;

SELECT
fc.nome_func,
fc.cpf,
e.razaosocial,
e.cnpj
FROM
funcionario fc
LEFT JOIN empresa e ON fc.id_empresa =
e.id_empresa;

SELECT
fc.nome_func,
fc.cpf,
e.razaosocial,
e.cnpj
FROM
funcionario fc
RIGHT JOIN empresa e ON fc.id_empresa =
e.id_empresa;

--CONTA QUANTOS FUNCIONAIS TRABALHAM EM CADA EMPRESA, NÃO EXIBINDO OS FUNCIONARIOS QUE NÃO ESTÃO EM EMPRESAS
SELECT COUNT(*) FROM funcionario
WHERE id_empresa IS NOT NULL
GROUP BY id_empresa
