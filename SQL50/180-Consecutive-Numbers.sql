SELECT DISTINCT num AS ConsecutiveNums
FROM Logs L1
JOIN (SELECT id, LEAD(num) OVER (ORDER BY id) AS lead_num, LAG(num) OVER (ORDER BY id) AS lag_num
FROM Logs) L2
ON L1.id = L2.id
WHERE lead_num = num AND lag_num = num;