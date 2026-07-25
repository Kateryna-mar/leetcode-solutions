SELECT Prices.product_id, COALESCE(ROUND(SUM(price * units)/SUM(units), 2), 0) AS average_price
FROM Prices
LEFT JOIN UnitsSold
ON Prices.product_id = UnitsSold.product_id
AND start_date <= purchase_date
AND end_date >= purchase_date
GROUP BY Prices.product_id;