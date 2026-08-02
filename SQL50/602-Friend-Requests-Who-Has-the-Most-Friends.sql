WITH num_per_id AS ((SELECT DISTINCT requester_id AS id, COUNT(accepter_id) AS count
FROM RequestAccepted
GROUP BY requester_id)
UNION ALL
(SELECT DISTINCT accepter_id AS id, COUNT(requester_id) AS count
FROM RequestAccepted
GROUP BY accepter_id))

SELECT DISTINCT id, SUM(count) OVER (PARTITION BY id) AS num
FROM num_per_id
ORDER BY num DESC
LIMIT 1;