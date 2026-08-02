SELECT ROUND(SUM(I.tiv_2016), 2) AS tiv_2016
FROM Insurance I
JOIN (SELECT tiv_2015
FROM Insurance
GROUP BY tiv_2015
HAVING COUNT(*) >1) AS C1
ON I.tiv_2015 = C1.tiv_2015
JOIN (SELECT lat, lon
FROM Insurance
GROUP BY lat, lon
HAVING COUNT(*)=1) AS C2
ON I.lat = C2.lat AND I.lon = C2.lon;