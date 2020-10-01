--write a SQL query to list the titles of the five highest rated movies (in order) that
-- Chadwick Boseman starred in, starting with the highest rated.


SELECT title 
FROM  movies JOIN stars ON stars.movie_id = movies.id JOIN ratings ON ratings.movie_id = stars.movie_id JOIN people ON stars.person_id = people.id
WHERE  name = "Chadwick Boseman"
ORDER BY rating DESC
LIMIT 5; 