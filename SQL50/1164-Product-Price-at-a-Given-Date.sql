SELECT P3.product_id, COALESCE(P4.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) AS P3
LEFT JOIN (SELECT product_id, MAX(change_date) AS change_date
FROM (SELECT product_id, new_price AS price, change_date FROM Products WHERE change_date <= '2019-08-16') AS P1
GROUP BY product_id) AS P2
ON P2.product_id =  P3.product_id
LEFT JOIN Products as P4
ON P3.product_id = P4.product_id AND P2.change_date = P4.change_date;