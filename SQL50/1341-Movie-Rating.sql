(SELECT Users.name AS results
FROM Users
JOIN (SELECT COUNT(rating) AS rating_count, user_id FROM MovieRating GROUP BY user_id) AS Rating
ON Users.user_id = Rating.user_id
ORDER BY rating_count DESC, name ASC
LIMIT 1)
UNION ALL
(SELECT title AS results
FROM Movies
JOIN (SELECT AVG(rating) AS avg_rating, movie_id FROM MovieRating WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29' GROUP BY movie_id) AS MovieRating
ON Movies.movie_id = MovieRating.movie_id
ORDER BY avg_rating DESC, title ASC
LIMIT 1);