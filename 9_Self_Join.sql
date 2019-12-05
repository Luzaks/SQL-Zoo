SELECT COUNT(id)
 FROM stops;

SELECT id FROM stops
 WHERE name = 'Craiglockhart';

SELECT id, name FROM stops 
 JOIN route ON (id = stop)
  WHERE num = '4' AND company= 'LRT';

SELECT company, num, COUNT(*) FROM route 
 WHERE stop = 149 OR stop = 53
  GROUP BY company, num
   HAVING COUNT(*) >= 2;

SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
 WHERE a.stop = 53 AND b.stop = 149;

 SELECT a.company, a.num, stop1.name, stop2.name
  FROM route a JOIN route b ON
   (a.company=b.company AND a.num=b.num)
   JOIN stops stop1 ON (a.stop=stop1.id)
   JOIN stops stop2 ON (b.stop=stop2.id)
  WHERE stop1.name='Craiglockhart' AND stop2.name='London Road';

SELECT DISTINCT a.company, a.num FROM route 
 a JOIN route b ON (a.company = b.company AND a.num = b.num)
 WHERE a.stop = 115 AND b.stop = 137;

SELECT a.company, a.num FROM route 
 a JOIN route b ON (a.company = b.company AND a.num = b.num) 
  JOIN stops stop1 ON (a.stop = stop1.id) JOIN stops stop2 ON (b.stop = stop2.id) 
  WHERE stop1.name ='Craiglockhart' AND stop2.name = 'Tollcross';

SELECT stop2.name, a.company, a.num FROM route 
 a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stop1 ON (a.stop=stop1.id)
  JOIN stops stop2 ON (b.stop=stop2.id)
   WHERE stop1.name='Craiglockhart';

SELECT  a.num, a.company, stopb.name, d.num, d.company FROM route
 a JOIN route b ON (a.company=b.company AND a.num=b.num) 
  JOIN ( route c JOIN route d ON (c.company = d.company AND c.num= d.num))
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
  JOIN stops stopc ON (c.stop = stopc.id)
  JOIN stops stopd ON (d.stop = stopd.id)
  WHERE  stopa.name = 'Craiglockhart' AND stopd.name = 'Lochend' AND stopb.name = stopc.name;