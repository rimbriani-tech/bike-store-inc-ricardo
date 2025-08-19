--1 Listar todos os clientes que não tenham realizado compras
--2 Listar os produtos que não tenham sido comprados
--3 Listar os produtos sem Estoque
--4 Agrupar a quantidade de vendas de uma determinada marca por loja
--5 Listar os Funcionarios que não estejam relacionados a um pedido


--1
SELECT 	cust.customer_id,
		cust.first_name,
		cust.last_name,
		cust.phone,
		cust.email,
		cust.street,
		cust.city,
		cust.state,
		cust.zip_code
FROM	customers cust
WHERE	cust.customer_id NOT IN (SELECT	customer_id 
								 FROM	orders)



--2
SELECT	prod.product_id,
		prod.product_name,
		prod.brand_id,
		prod.category_id,
		prod.model_year,
		prod.list_price
FROM	products prod
WHERE	prod.product_id NOT IN (SELECT 	product_id
								FROM	order_items)




--3
SELECT		prod.product_id,
			prod.product_name,
			prod.brand_id,
			prod.category_id,
			prod.model_year,
			prod.list_price,
			SUM(stock.quantity)
FROM		products prod
INNER JOIN	stocks stock ON prod.product_id = stock.product_id
GROUP BY	prod.product_id,
			prod.product_name,
			prod.brand_id,
			prod.category_id,
			prod.model_year,
			prod.list_price
HAVING		SUM(stock.quantity) = 0




--4
SELECT		store.store_name, 
			SUM(orditens.quantity) quantidade
FROM		stores store
INNER JOIN	orders ord ON ord.store_id = store.store_id
INNER JOIN	order_items orditem ON orditem.order_id = ord.order_id
INNER JOIN	products prod ON prod.product_id = orditem.product_id
WHERE		prod.brand_id = 'SHIMANO'
GROUP BY	store.store_name



--5
SELECT	staff.staff_id,
		staff.first_name,
		staff.last_name,
		staff.email,
		staff.phone,
		staff.active,
		staff.store_id,
		staff.manager_id
FROM	staffs staff
WHERE	staff.staff_id NOT IN  (SELECT	staff_id
								FROM	orders)

