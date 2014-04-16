-- Show that it's possible to get from Craiglockhart to Sighthill using 2 buses. (This DB doesn't make this easy!)


SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Sighthill';

-- No buses go directly from Craiglockhart to Sighthill


SELECT DISTINCT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';

-- stops that you can get to from Craiglockhart


SELECT DISTINCT stopa.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name='Sighthill';

-- stops and routes that will take you to Sighthill

SELECT DISTINCT *
FROM (SELECT DISTINCT stopa.name AS stopa_name, stopb.name AS stopb_name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart') stopcl
JOIN
(SELECT DISTINCT stopa.name AS stopa_name, stopb.name AS stopb_name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name='Sighthill') stopsh
ON
stopcl.stopb_name=stopsh.stopa_name