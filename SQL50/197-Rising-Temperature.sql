SELECT w1.id
FROM Weather w1
INNER JOIN Weather w2
WHERE w1.temperature > w2.temperature AND w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY);