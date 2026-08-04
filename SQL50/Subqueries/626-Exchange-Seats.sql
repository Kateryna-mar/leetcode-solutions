SELECT (CASE WHEN id%2 = 0 THEN id-1 WHEN max_id = id THEN id ELSE id+1 END) AS id, student
FROM Seat S1
JOIN (SELECT MAX(id) AS max_id FROM Seat) S2
ORDER BY id ASC;