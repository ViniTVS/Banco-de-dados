SELECT
    C_NAME,
    O_ORDERKEY,
    O_COMMENT
FROM
    CUSTOMER
LEFT JOIN ORDERS ON
    CUSTOMER.C_CUSTKEY = ORDERS.O_ORDERKEY
WHERE 
	strpos(O_COMMENT, 'special request')>0;