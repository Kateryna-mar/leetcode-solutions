SELECT visited_on, amount, average_amount
FROM (SELECT visited_on, rn, SUM(sum_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount, ROUND(AVG(sum_amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
FROM (SELECT SUM(amount) AS sum_amount, visited_on, ROW_NUMBER() OVER (ORDER BY visited_on) AS rn FROM Customer GROUP BY visited_on) AS DailyAmount
ORDER BY visited_on) AS SevenDayStats
WHERE rn>=7;