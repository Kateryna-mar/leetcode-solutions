SELECT C1.category, COALESCE(C2.accounts_count, 0) AS accounts_count
FROM (SELECT 'Low Salary' AS category
UNION ALL
SELECT 'Average Salary'
UNION ALL
SELECT 'High Salary') AS C1
LEFT JOIN (SELECT (CASE WHEN income < 20000 THEN 'Low Salary' WHEN income > 50000  THEN 'High Salary' ELSE 'Average Salary'END) AS category, COUNT(account_id) AS accounts_count
FROM Accounts
GROUP BY category) AS C2
ON C1.category = C2.category;