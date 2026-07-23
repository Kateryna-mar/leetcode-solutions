SELECT Signups.user_id, ROUND(COALESCE(SUM(CASE WHEN action='confirmed' THEN 1 ELSE 0 END)/COUNT(Confirmations.time_stamp), 0), 2) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations
ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;