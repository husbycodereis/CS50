--write a SQL query to list the names of all people who starred in a movie in which Kevin Bacon also starred

SELECT name
FROM people JOIN stars ON stars.person_id = people.id JOIN movies ON stars.movie_id = movies.id 
WHERE movie_id IN

(SELECT movie_id 
FROM  movies JOIN stars ON stars.movie_id = movies.id JOIN people ON stars.person_id = people.id
WHERE  name = "Kevin Bacon" AND birth = "1958")

EXCEPT 
SELECT name 
FROM people 
WHERE name = "Kevin Bacon";