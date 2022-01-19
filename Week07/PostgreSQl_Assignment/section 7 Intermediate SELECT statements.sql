--29. ORDER BY


SELECT DISTINCT(country)
FROM customers;

SELECT DISTINCT(country)
FROM suppliers
ORDER BY country ASC;

SELECT DISTINCT(country)
FROM suppliers
ORDER BY country DESC;

SELECT DISTINCT country,city
FROM suppliers
ORDER BY country ASC,city ASC;

Q)get a list products names and units prices order by prices highest to lowest 
and product  name a to z (if they have same price)

SELECT productname,unitprice
FROM products
ORDER BY unitprice DESC, productname ASC;

--30. Using MIN and MAX Functions

SELECT MIN(orderdate)
FROM orders
WHERE shipcountry='Italy';

SELECT MAX(shippeddate)
FROM orders
WHERE shipcountry='Canada';

Q)find the slowest order sent to france based on order date versus ship date

SELECT MAX(shippeddate-orderdate)
FROM orders
WHERE shipcountry='France';

--31. Using AVG and SUM
SELECT AVG(freight)
FROM orders
WHERE shipcountry='Brazil';

SELECT SUM(quantity)
FROM order_details
WHERE productid=14;

Q)what was the average number of steeleye stout(productid=35) per order

SELECT AVG(quantity)
FROM order_details
WHERE productid=35;

--32. LIKE to Match Patterns
SELECT companyname,contactname
FROM customers
WHERE contactname LIKE 'D%';

SELECT companyname
FROM suppliers
WHERE companyname LIKE '_or%';

Q)which customer company names end in 'er'?

SELECT companyname
FROM customers
WHERE companyname LIKE '%er';

--33. Renaming Columns With Alias
SELECT unitprice*quantity AS TotalSpent
FROM order_details;

SELECT unitprice*quantity AS TotalSpent
FROM order_details
ORDER BY TotalSpent DESC;

Q)calculate our inventory value of products (nees unitprice and unitinstock 
and return fields) and returns as totalinventory and order by this column by desc

SELECT unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory DESC;

--34. LIMIT to Control Number of Records Returned
SELECT productid,unitprice*quantity AS TotalCost
FROM order_details
ORDER BY TotalCost DESC
LIMIT 3;

Q) calculate the 2 products with the least inventory in stock by total dollar amount of 
inventory

SELECT productname,unitprice*unitsinstock AS TotalInventory
FROM products
ORDER BY TotalInventory ASC
LIMIT 2;

--35. NULL Values
SELECT count(*)
FROM customers
WHERE region IS NULL;

SELECT count(*)
FROM suppliers
WHERE region IS NOT NULL;

Q)how many orders did not have a ship region?
SELECT count(*)
FROM orders
WHERE shipregion IS NULL;

--36. Practice What You've Learned  //AdventureWorks

--Q1)Return the name, weight, and productnumber of  all the products  ordered by weight from lightest to heaviest.
(Remember to use schema to reach table.  It is in production schema.)

SELECT name,weight,productnumber
FROM production.product
ORDER BY weight ASC;

--Q2)Return the records from productvendor for productid = 407 in order of averageleadtime from shortest to longest. 
(You'll have to figure out which schema this is in.)

SELECT *
FROM purchasing.productvendor
WHERE productid=407
ORDER BY averageleadtime ASC;

--Q3)Find all the salesorderdetail records for productid 799 and order them by largest orderqty to smallest.

SELECT *
FROM sales.salesorderdetail
WHERE productid=799
ORDER BY orderqty DESC;

--Q4)What is the largest  discount percentage offered in the specialoffer table.
SELECT MAX(discountpct)
FROM sales.specialoffer;

--Q5)Find the smallest number of sickleavehours for an employee.
SELECT MIN(sickleavehours)
FROM humanresources.employee;

--Q6)Find the largest rejected quantity in the purchaseorderdetail table.
SELECT MAX(rejectedqty)
FROM purchasing.purchaseorderdetail;

--Q7)Find the average rate from employeepayhistory table.
SELECT AVG(rate)
FROM humanresources.employeepayhistory;

--Q8)Find the average standardcost in the productcosthistory table for productid 738.
SELECT AVG(standardcost)
FROM production.productcosthistory
WHERE productid=738;

--Q9)Find the sum of scrappedqty from the workorder table for productid 529.

SELECT SUM(scrappedqty)
FROM production.workorder
WHERE productid = 529;

--Q10)Find all vendor names with a name that starts with letter G.
SELECT name
FROM purchasing.vendor
WHERE name LIKE 'G%';

--Q11)Find all vendor names that have the word Bike in them.
SELECT name
FROM purchasing.vendor
WHERE name LIKE '%Bike%';

--Q12)Search the person table for every firstname that has t as a second letter.
SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';

--Q13)Return the first 20 records from emailaddress table.
SELECT *
FROM person.emailaddress
LIMIT 20;

--Q14)Return the first 2 records from productcategory table.
SELECT *
FROM production.productcategory
LIMIT 2;

--Q15)How many product records have a missing weight value.
SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

--Q16)How many person records have an additionalcontactinfo field that has a value.
SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;
************************