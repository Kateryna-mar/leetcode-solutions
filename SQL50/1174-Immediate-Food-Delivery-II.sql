SELECT ROUND(SUM(CASE WHEN D1.order_date=D2.customer_pref_delivery_date THEN 1 ELSE 0 END)/COUNT(DISTINCT D1.customer_id)*100, 2) AS immediate_percentage
FROM (SELECT customer_id, MIN(order_date) AS order_date FROM Delivery D2 GROUP BY customer_id) AS D1
JOIN Delivery D2
ON D1.customer_id = D2.customer_id;