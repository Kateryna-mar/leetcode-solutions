SELECT id, movie, description, rating
FROM Cinema
WHERE description NOT LIKE 'boring'
HAVING id%2 = 1
ORDER BY rating DESC;