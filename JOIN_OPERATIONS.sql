/*TUTORIAL 7*/

/*1. List the films where the yr is 1962 [Show id, title] */

SELECT id, title FROM movie WHERE yr=1962

/*2. Give year of 'Citizen Kane'.*/

SELECT yr FROM movie WHERE title = 'Citizen Kane'

/*3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title).
Order results by year. */

SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr

/*4. What id number does the actor 'Glenn Close' have?*/

SELECT DISTINCT actor.id FROM actor 
  JOIN casting ON actor.id = casting.actorid 
  JOIN movie ON casting.movieid = movie.id 
  WHERE actor.name = 'Glenn Close'

/*5. What is the id of the film 'Casablanca' */

SELECT id FROM movie WHERE title = 'Casablanca';

/*6. Obtain the cast list for 'Casablanca'. */

SELECT actor.name FROM actor JOIN casting ON casting.actorid = actor.id
WHERE movieid = 11768;

/*7. Obtain the cast list for the film 'Alien' */

SELECT actor.name FROM actor JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid WHERE movie.title = 'Alien';

/*8. List the films in which 'Harrison Ford' has appeared */

SELECT movie.title FROM actor JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid WHERE actor.name = 'Harrison Ford';

/*9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
[Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */

SELECT movie.title FROM actor JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;

/*10. List the films together with the leading star for all 1962 films.*/

SELECT movie.title, actor.name FROM actor JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid WHERE casting.ord = 1 AND movie.yr = 1962;

/*11. Which were the busiest years for 'Rock Hudson',
show the year and the number of movies he made each year for any year in which he made more than 2 movies. */

SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id WHERE actor.name = 'Rock Hudson'
GROUP BY yr HAVING COUNT(title) > 2;

/*12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.*/

SELECT movie.title, actor.name FROM actor INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON movie.id = casting.movieid WHERE casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  INNER JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = 'Julie Andrews')
AND casting.ord = 1;

/*13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.*/

SELECT actor.name FROM actor JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid WHERE casting.ord  = 1
GROUP BY actor.name HAVING COUNT(*) >= 15;

/*14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.*/

SELECT movie.title, COUNT(*) FROM movie JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978 GROUP BY movie.title ORDER BY COUNT(*) DESC, movie.title;

/*15. List all the people who have worked with 'Art Garfunkel'.*/

SELECT actor.name FROM actor JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid IN
  (SELECT casting.movieid
  FROM casting
  INNER JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel';
