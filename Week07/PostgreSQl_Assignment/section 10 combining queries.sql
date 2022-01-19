--52. Union

SELECT companyname
FROM customers
UNION
SELECT companyname
FROM suppliers;

SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

Q)distinct countries of all our customers and suppliers in alphabetical order

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country ASC;

Q)all list of countries our suppliers and customers ,with record for each one.

SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country ASC;

--53. Intersect
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers;


SELECT COUNT(*) FROM
(SELECT country FROM customers
INTERSECT ALL
SELECT country FROM suppliers) AS same_country;

Q)distinct cities that we have a suppliers and customers located in

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers
ORDER BY country ASC;

Q)the count of the number of customers and suppliers pairs that are in the same city

SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;

--54. Except

SELECT country FROM customers
EXCEPT
SELECT country FROM suppliers;

SELECT COUNT(*) FROM
(SELECT country FROM customers
EXCEPT ALL
SELECT country FROM suppliers) AS same_country;

SELECT city FROM suppliers
EXCEPT
SELECT city FROM customers;

Q)cities we have a suppliers with no customer\

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers
ORDER BY city DESC;

Q)how many customers do we have in cities without suppliers

SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;

****************************************