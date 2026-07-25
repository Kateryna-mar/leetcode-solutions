SELECT customer_id
FROM Product P
INNER JOIN Customer C
GROUP BY C.customer_id
HAVING COUNT(DISTINCT C.product_key) >= COUNT( DISTINCT P.product_key);