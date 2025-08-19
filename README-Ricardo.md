# DBA Challenge 20240802


## Descrição

Criar relatórios relacionados a vendas em lojas de bicicletas


## Linguagem utilizada

T-SQL


## Instruções

- Abrir o SQL Server Management Studio
- Conectar à base de dados
- Abrir o arquivo teste-bike_store.sql
- Executar (F5) para obter os resultados
  

## Etapas

Foram analisados os escopos de cada uma das tarefas solicitadas. Trata-se de relatórios simples relacionados a vendas e produtos. Relacionarei o processo de cada uma das tarefas abaixo.
1 - Listar todos Clientes que não tenham realizado uma compra
	Select simples de clientes, da tabela "customers", com cláusula WHERE possuindo NOT IN relacionando a tabela "orders".
	
2 - Listar os Produtos que não tenham sido comprados
	Select simples de produtos, da tabela "products", com cláusula WHERE possuindo NOT IN relacionando a tabela "order_items".
	Pensei em utilizar NOT EXISTS nessa, mas preferi utilizar o NOT IN por ser uma sintaxe mais utilizada e que qualquer desenvolvedor pode entender mais facilmente.

3 - Listar os Produtos sem Estoque
	Select com INNER JOIN entre as tabelas "stocks" e "products", em que a cláusula WHERE deve conter "quantity" = 0. 
	Revisando o texto ao final do testem, devido a algum nervosismo, percebi que a minha análise foi falha, e que o estoque é por loja e não geral. Nesse caso, é necessário adicionar um agrupamento e fazer somatório, utilizando a cláusula HAVING.

4 - Agrupar a quantidade de vendas que uma determinada Marca por Loja
	No caso desta tarefa, não tive certeza do enunciado. Poderia ser a quantidade de ordens de venda ou quantidade de itens vendidos (vendas de produtos). É algo que eu perguntaria para o cliente.
	Em todo caso, como precisei revisar o texto e o código para documentar, estou adicionando as duas variantes.

5 - Listar os Funcionarios que não estejam relacionados a um Pedido
	Select simples de funcionários, da tabela "staffs", com cláusula WHERE possuindo NOT IN relacionando a tabela "orders".
