SELECT ROUND(SUM(CASE WHEN DATE_ADD(A1.event_date, INTERVAL 1 DAY) = A2.event_date THEN 1 ELSE 0 END)/COUNT(DISTINCT A2.player_id), 2) AS fraction
FROM (SELECT player_id, MIN(event_date) AS event_date FROM Activity GROUP BY player_id) AS A1
JOIN Activity A2
ON A1.player_id =  A2.player_id;