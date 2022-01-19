--14. Searching For Specific Text

SELECT companyname
FROM suppliers
WHERE city='Berlin';

Q)find all customers names and contacts that we have in mexico
SELECT companyname,contactname
FROM customers
WHERE country='Mexico';

--15. Searching Numeric Fields
SELECT COUNT(*)
FROM orders
WHERE employeeid=3;

SELECT COUNT(*)
FROM order_details
WHERE quantity>20;

Q)how many orders had a freight cost equal to or greater than $250?

SELECT COUNT(*)
FROM orders
WHERE freight>=250;

--16. Searching Date Fields

SELECT COUNT(*)
FROM orders
where orderdate >= '1998-01-01';

Q)how many orders shipped before july 5,1997

SELECT COUNT(*)
FROM orders
where shippeddate < '1997-07-05';

--17. WHERE Using Logical AND Operator

SELECT COUNT(*)
FROM orders
WHERE freight > 100 AND shipcountry = 'Germany';

Q)we want the distinct customers where orders were shipped via united package(id=2)
and the ship country is brazil.

SELECT DISTINCT customerid
FROM orders
WHERE shipvia=2 AND shipcountry='Brazil';

--18. WHERE Using Logical OR Operator

SELECT COUNT(*)
FROM customers
WHERE country='USA' OR country='Canada';

Q)how many suppliers do we have in germany and spain

SELECT COUNT(*)
FROM customers
WHERE country='Germany' OR country='Spain';

Q)how many orders shipped to USA ,brazil and argentina

SELECT COUNT(*)
FROM orders
WHERE shipcountry='USA' OR shipcountry='Brazil'
OR shipcountry='Argentina';

--19. WHERE Using Logical NOT Operator

SELECT COUNT(*)
FROM customers
WHERE NOT country='France';

Q)how many suppliers are not in usa
SELECT COUNT(*)
FROM suppliers
WHERE NOT country='USA';

--20. WHERE Combining AND, OR, and NOT

SELECT COUNT(*)
FROM orders
WHERE shipcountry='Germany'
AND (freight<50 OR freight>175);


Q)how many orders shipped to canada or spain and shippeddate after may 1,1997

SELECT COUNT(*)
FROM orders
WHERE (shipcountry='Canada' OR shipcountry='Spain')
AND shippeddate > '1997-05-01';

--21. Using BETWEEN

SELECT COUNT(*)
FROM order_details
WHERE unitprice BETWEEN 10 AND 20;

Q)how many orders shipped between june 1,1996 and september 30,1996

SELECT COUNT(*)
FROM orders
WHERE shippeddate BETWEEN '1996-06-01' AND '1996-09-30';

--22. Using IN

Q)are located in germany ,france spain or Itely

SELECT COUNT(*)
FROM suppliers
WHERE country IN ('Germany','France','Spain','Italy');

Q)how many products do we have in categoryid 1,4,6 or 7

SELECT COUNT(*)
FROM products
WHERE categoryid IN (1, 4, 6, 7);

--23. Practice What You've Learned

--Q1)Select all records from data_src which came from the journal named 'Food Chemistry'.

SELECT * FROM data_src
WHERE journal = 'Food Chemistry';

--Q2)Select record from nutr_def where nutrdesc is Retinol.

SELECT * FROM nutr_def
WHERE nutrdesc = 'Retinol';

--Q3)Find all the food descriptions (food_des) records for manufacturer Kellogg, Co. (must include punctuation for exact match).

SELECT * FROM food_des
WHERE manufacname = 'Kellogg, Co.';

--Q4)Find the number of records in data sources (data_src) that were published after year 2000 (it is numeric field).

SELECT COUNT(*) FROM data_src
WHERE year > 2000;

--Q5)Find the number of records in food description that have a fat_factor < 4.

SELECT COUNT(*) FROM food_des
WHERE fat_factor<4;

--Q6)Select all records from weight table that have gm_weight of 190.

SELECT * FROM weight
WHERE gm_wgt = 190;

--Q7)Find the number of records in food description table that have pro_factor greater than 1.5 and fat_factor less than 5.
SELECT COUNT(*)
FROM food_des
WHERE pro_factor > 1.5 AND fat_factor < 5;

--Q8)Find the record in data source table that is from year 1990 and the journal Cereal Foods World.

SELECT * FROM data_src
WHERE year=1990 AND journal='Cereal Foods World';

--Q9)Select count of weights where gm_wgt is greater than 150 and less than 200.

SELECT COUNT(*) FROM weight
WHERE gm_wgt > 150 and gm_wgt < 200;

--Q10)Select the records in nutr_def table (nutrition definitions) that have units of kj or kcal.

SELECT *
FROM nutr_def
WHERE units = 'kj' or units='kcal';

--Q11)Select all records from data source table (data_src) that where from the year 2000 or the journal Food Chemistry.

SELECT * FROM data_src
WHERE year=2000 OR journal='Food Chemistry';

--Q12)How many records in food_des are not about food group Breakfast Cereals.  
The field fdgrp_cd is an id field and you will have to find it in fd_group for fddrp_desc = ' Breakfast Cereals'.

SELECT fdgrp_cd FROM fd_group
WHERE fddrp_desc = 'Breakfast Cereals';
-- find the count
SELECT COUNT(*) FROM food_des
WHERE NOT fdgrp_cd = '0800';

--Q13)Find all the records in data sources that where between 1990 and 2000 and either 'J. Food Protection' or 'Food Chemistry'.

SELECT * FROM data_src
WHERE (year >= 1990 AND year <=2000) AND
	(journal = 'J. Food Protection' OR Journal='Food Chemistry');

--Q14)Use BETWEEN syntax to find number of weight records that weight between 50 and 75 grams (gm_wgt).

SELECT COUNT(*)
FROM weight
WHERE gm_wgt BETWEEN 50 AND 75;

--Q15)Select all records from the data source table that were published in years 1960,1970,1980,1990, and 2000.  Use the IN syntax.

SELECT * FROM data_src
WHERE year IN (1960,1970,1980,1990,2000);

************************