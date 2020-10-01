--write a SQL query to list the names of all people who starred in a movie released in 2004, ordered by birth year

SELECT  name 
FROM people JOIN stars ON people.id = stars.person_id JOIN movies ON stars.movie_id = movies.id
WHERE  year = 2004 
GROUP BY person_id
ORDER BY birth; 