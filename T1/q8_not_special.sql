-- Explicando a lógica da consulta:
-- Primeiramente faço uma consulta ao banco buscando os clientes e suas compras.
-- Caso um cliente tenha uma compra com 'special request', uma "flag" é marcada nele com 1
-- caso contrário, o cliente é marcado com 0.
-- Com isso, basta fazer a contagem de clientes sem flag

SELECT
	COUNT(pedidos.soma)
FROM (SELECT
	SUM(
		CASE 
			WHEN INSTR(O_COMMENT, 'special request')>0 
			THEN 1
			ELSE 0
		END)
	as soma
	FROM
		CUSTOMER
	LEFT JOIN ORDERS ON
    		CUSTOMER.C_CUSTKEY = ORDERS.O_CUSTKEY

	GROUP BY C_NAME
) as pedidos
WHERE 
	pedidos.soma = 0;
