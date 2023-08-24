# Projeto Grupo 3
## Participantes
- Gabriel da Costa Garcia
- Filipi Cardoso da Rocha
- Brayan Gazalé Simões Costa Lima
- Michael de Paula Vieira
- Bernardo Camara Siqueira de Moraes
- Gustavo Monerat Rosa
- Alexander Francisco do Canto Oliveira


### Opção 1: E-commerce tradicional
Uma empresa do comércio varejista deseja realizar a venda de seus produtos pela
internet e para isso precisa de um sistema capaz de realizar o controle de estoque e
cadastro de clientes. A empresa é responsável pela produção de seus próprios
produtos e por isso não precisa registrar dados de fornecedores externos. O sistema
não tem como objetivo registrar detalhes da produção. Sendo assim, a seguir são
descritos os requisitos e os dados que a empresa julga serem necessários para o
funcionamento do sistema:
1. O sistema deve ser capaz de armazenar informações sobre os produtos da
empresa, sendo eles: código, nome, descrição, quantidade em estoque, data
de fabricação e valor unitário.
2. Ao cadastrar um produto no sistema, os funcionários da empresa devem ser
capazes de associá-lo à uma categoria. Cada produto só poderá pertencer à
uma categoria.
3. Se o produto já estiver cadastrado no sistema, o colaborador deverá apenas
atualizar a quantidade de itens no estoque.
4. Para cada categoria de produto, é necessário registrar: código, nome e
descrição.
5. O sistema deverá armazenar dados dos clientes, que devem ser: código,
nome completo, nome de usuário, e-mail, cpf, data de nascimento e
endereço.
6. Através do sistema, os clientes podem realizar pedidos.
7. Cada pedido deve conter um ou mais produtos, a data em que foi realizado e
por quem foi realizado.
8. Um pedido pode ter mais de um item de um mesmo produto, de acordo com
a quantidade disponível em estoque.
9. Sobre os funcionários, é necessário guardar apenas um código, nome e cpf

### Para os alunos entregarem:

1. Diagrama DER
2. SQL de criação das tabelas
3. SQL de inserção de dados nas tabelas (pelo menos 5 registros em
cada uma)
4. Um comando SQL de atualização em algum registro em uma tabela
5. Um comando SQL de exclusão de algum registro em uma tabela
6. 5 SQLs de consulta
    - a. Pelo menos 2 com algum tipo de junção
    - b. Pelo menos 1 com usando count() e group by()
    - c. 1 SQL para construção de nota fisca

### DER - Diagrama Entidade Relacionamento
![DER](/Projeto%20Grupo%203/Grupo%203%20-%20DER.png)

### Ordem de execução dos arquivos SQL
1. Criar um Banco de dados
2. Executar o arquivo em SQL "Grupo 3 - SQL Criacao do BD.sql"  - [Arquivo de criacao da Base](/Projeto%20Grupo%203/Grupo%203%20-%20SQL%20Criacao%20do%20BD.sql)
3. Executar o arquivo em SQL "Grupo 3 - SQL Insercao de dados no BD.sql"  - [Arquivo de inserção de dados na Base](/Projeto%20Grupo%203/Grupo%203%20-%20SQL%20Insercao%20de%20dados%20no%20BD.sql)
4. Executar cada consulta separadamente em SQL "Grupo 3 - SQL Consultas.sql"  - [Arquivo de consultas a Base](/Projeto%20Grupo%203/Grupo%203%20-%20SQL%20Consultas.sql)
