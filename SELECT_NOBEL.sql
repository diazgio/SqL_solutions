/*TUTORIAL 2*/

/*1.*/

SELECT yr, subject, winner FROM nobel WHERE yr = 1950

/*2.*/

SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'

/*3. Show the year and subject that won 'Albert Einstein' his prize. */

SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'

/*4. Give the name of the 'Peace' winners since the year 2000, including 2000. */

SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace'

/*5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive. */

SELECT yr, subject, winner FROM nobel WHERE yr >= 1980 AND yr <= 1989 AND subject = 'Literature'

/*6. Show all details of the presidential winners:

    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    Barack Obama*/

SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')

/*7. Show the winners with first name John */

SELECT winner FROM nobel WHERE winner LIKE 'John%'

/*8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.*/

SELECT yr, subject, winner FROM nobel WHERE yr = 1980 AND subject = 'Physics' OR yr = 1984 AND subject = 'Chemistry'

/*9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine.*/

SELECT yr, subject, winner FROM nobel WHERE yr = 1980 AND subject NOT LIKE 'Chemistry' AND subject NOT LIKE 'Medicine'

/*10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910)
together with winners of a 'Literature' prize in a later year (after 2004, including 2004)*/

SELECT * FROM nobel WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004

/*11. Find all details of the prize won by PETER GRÜNBERG */

SELECT * FROM nobel WHERE winner = 'Peter Grünberg'

/*12. Find all details of the prize won by EUGENE O'NEILL
Escaping single quotes
You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.*/

SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL'

/*13. Knights in order
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.*/

SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC

/*14. The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.*/

SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'),subject,winner