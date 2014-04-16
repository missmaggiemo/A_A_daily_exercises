SELECT title, name FROM
  movie JOIN (casting JOIN actor ON actorid=actor.id)
  ON movieid=movie.id
WHERE movieid IN (SELECT DISTINCT movieid FROM
  casting WHERE actorid=(SELECT id FROM
    actor WHERE name='Julie Andrews')) AND ord=1;




SELECT DISTINCT name
FROM actor
JOIN casting
  ON id=actorid
WHERE movieid IN
  (SELECT DISTINCT movieid
  FROM casting
  WHERE actorid=
    (SELECT id
    FROM actor
    WHERE name='Art Garfunkel'));


SELECT id, name
FROM stops
JOIN route
  ON stops.id=route.stop
WHERE company='LRT'
  AND num='4';




SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';


SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137;


SELECT DISTINCT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross';


SELECT DISTINCT a.company, a.num, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';
























