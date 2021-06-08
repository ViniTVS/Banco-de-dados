SELECT
	COUNT(pedidos.soma)
FROM (SELECT
		sum(
		case 
			when INSTR(O_COMMENT, 'special request')>0 
			then 1
			else 0
		end)
		as soma
	FROM
		CUSTOMER
	LEFT JOIN ORDERS ON
    		CUSTOMER.C_CUSTKEY = ORDERS.O_CUSTKEY

	GROUP BY C_NAME	)
as pedidos
WHERE 
	pedidos.soma = 0
;
