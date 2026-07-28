SELECT Q1.person_name
FROM (SELECT person_name, SUM(weight) OVER (ORDER BY turn) AS weight_max FROM Queue) AS Q1
WHERE Q1.weight_max <= 1000
ORDER BY weight_max DESC
LIMIT 1;