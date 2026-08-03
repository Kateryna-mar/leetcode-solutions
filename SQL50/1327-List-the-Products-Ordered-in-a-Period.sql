SELECT *
FROM (SELECT DISTINCT product_name, SUM(unit) OVER (PARTITION BY product_name) AS unit
FROM Products P
JOIN Orders O
ON P.product_id = O.product_id
WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2020) AS units
WHERE unit>=100;