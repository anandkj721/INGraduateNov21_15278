----38. Grabbing Information From Two
SELECT companyname,orderdate,shipcountry
FROM orders
JOIN customers ON customers.customerid=orders.customerid;

Q)connect employees to order and pull back first name,last name and order date 
for all orders.

SELECT firstname,lastname,orderdate
FROM orders
JOIN employees ON employees.employeeid=orders.employeeid;

Q)connect to suppliers and pull back company name ,unit cost and units in stock

SELECT companyname,unitprice,unitsinstock
FROM products
JOIN suppliers ON products.supplierid=suppliers.supplierid;

--39. Grabbing Information From Multiple Tables

SELECT companyname,orderdate,unitprice,quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid;

Q)connect products to previous query and add product name to field

SELECT companyname, productname, orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid;

Q)connect categories to previous query and brinh back category name

SELECT companyname, productname, categoryname,
	     Orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid;

Q)take previous query and add a where clause that select category name of seafood and 
amount spent >=500

SELECT companyname, productname, categoryname,
	    orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid
WHERE 	categoryname='Seafood' AND
		order_details.unitprice*quantity >= 500;

		
--40. Left Joins

SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid=orders.customerid;

SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid=orders.customerid
WHERE orderid IS NULL;

Q)do a left joine between products and order_details

SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid;

Q)use IS NULL  to find products without orders

SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid
WHERE orderid IS NULL;


--41. Right Joins
SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid;

SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid
WHERE orderid IS NULL;

Q)do a right joine between customer deom and customers
 
SELECT companyname, customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers ON customers.customerid=customercustomerdemo.customerid;

--42. Full Joins
SELECT companyname, orderid
FROM orders
FULL JOIN customers ON customers.customerid=orders.customerid;

Q)do a full joine between products and categories

SELECT productname, categoryname
FROM categories
FULL JOIN products ON products.categoryid=categories.categoryid;

--43. Self Joins
SELECT A.companyname AS CustomerName1, B.companyname AS CustomerName2, A.city
FROM customers A, customers B
WHERE A.customerid > B.customerid
AND A.city = B.city
ORDER BY A.city;

Q)find suooliers from sane country and order by country

SELECT  A.companyname AS SupplierName1,
		    B.companyname AS SupplierName2,  A.country
FROM suppliers A, suppliers B
WHERE A.supplierid > B.supplierid
AND A.country = B.country
ORDER BY A.country;

--44. USING To Reduce Typing
SELECT *
FROM orders
JOIN order_details USING (orderid);

Q)add product to the previous join of orders and order_details

SELECT *
FROM orders
JOIN order_details USING (orderid)
JOIN products USING (productid);

--45. Even Less Typing With NATURAL
SELECT *
FROM orders
NATURAL JOIN order_details;

Q)add customers to previous query using natural joine
SELECT *
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details;


--notice the difference between these two joins
SELECT COUNT(*)
FROM products
NATURAL JOIN order_details;  --this is joining on both productid and unitprice

SELECT COUNT(*)
FROM products
JOIN order_details USING (productid);

--46. Practice What You've Learned //AdventureWorks

--Q1)Join (with inner join) together person, personphone, businessentity and phonenumber type in the persons schema.  
Return first name, middle name, last name, phone number and the name of the phone number type (home, office, etc.)  
Order by business entity id descending.

-- this is spelling out the ON
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity AS be ON be.businessentityid=ph.businessentityid
JOIN person.person AS pe ON pe.businessentityid=be.businessentityid
JOIN person.phonenumbertype AS pnt ON pnt.phonenumbertypeid=ph.phonenumbertypeid
ORDER BY ph.businessentityid DESC;

--this is with USING
SELECT firstname,middlename,lastname,phonenumber,name
FROM person.personphone AS ph
JOIN person.businessentity USING (businessentityid)
JOIN person.person USING (businessentityid)
JOIN person.phonenumbertype USING (phonenumbertypeid)
ORDER BY ph.businessentityid DESC;


--Q2)Join (Inner) productmodel, productmodelproductiondescriptionculture, productdescription and culture from the production schema. 
 Return the productmodel name, culture name, and productdescription description ordered by the product model name.
 
SELECT pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
ORDER BY pm.name ASC;

--Q3)Add a join to previous example to production.product and return the product name field in addition to other information.

SELECT p.name,pm.name,c.name,description
FROM production.productdescription
JOIN production.productmodelproductdescriptionculture USING (productdescriptionid)
JOIN production.culture AS c USING (cultureid)
JOIN production.productmodel AS pm USING (productmodelid)
JOIN production.product AS p USING (productmodelid)
ORDER BY pm.name ASC;

--Q4)Join product and productreview in the schema table.  Include every record from product and any reviews they have. 
Return the product name, review rating and comments.  Order by rating in ascending order.

SELECT name, rating, comments
FROM production.product
LEFT JOIN production.productreview USING (productid)
ORDER BY rating ASC;

--Q5)Use a right join to combine workorder and product from production schema to bring back all products and any work orders they have.  
Include the product name and workorder orderqty and scrappedqty fields.  Order by productid ascending.

SELECT p.name,orderqty,scrappedqty
FROM production.workorder
RIGHT JOIN production.product AS p USING (productid)
ORDER BY p.productid ASC;
******************************
--SECTION 09 Grouping and aggregation functions

--47. Group By
SELECT COUNT(*), country
FROM customers
GROUP BY country
ORDER BY COUNT(*) DESC;

SELECT COUNT(*),categoryname
FROM categories
JOIN products ON categories.categoryid=products.categoryid
GROUP BY categoryname
ORDER BY COUNT(*) DESC;

SELECT productname,ROUND(AVG(quantity))
FROM products
JOIN order_details ON order_details.productid=products.productid
GROUP BY productname
ORDER BY AVG(quantity) DESC;

Q)how many suppliers in each country?
SELECT COUNT(*),country
FROM suppliers
GROUP BY country
ORDER BY COUNT(*) DESC;

Q)toal value of each product sold for year of 1997

SELECT productname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM products
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON orders.orderid=order_details.orderid
WHERE orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY productname
ORDER BY AmountBought DESC;

--48. Use HAVING to Filter Groups
SELECT productname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM products
JOIN order_details USING (productid)
GROUP BY productname
HAVING SUM(quantity * order_details.unitprice) <2000
ORDER BY AmountBought ASC;

SELECT companyname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice) >5000
ORDER BY AmountBought DESC;


Q)customers that have brought more than $5000 of products with order date in first six months
of the the year of 1997

SELECT companyname, SUM(quantity * order_details.unitprice) AS AmountBought
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details
WHERE orderdate BETWEEN '1997-01-01' AND '1997-6-30'
GROUP BY companyname
HAVING SUM(quantity * order_details.unitprice) >5000
ORDER BY AmountBought DESC;

--49. Grouping Sets

SELECT categoryname,productname,SUM(od.unitprice*quantity)
FROM categories
NATURAL JOIN products
NATURAL JOIN order_details AS od
GROUP BY GROUPING SETS  ((categoryname),(categoryname,productname))
ORDER BY categoryname, productname;

Q)find the total sales by both customers's renamed as buyerand supplier's company 
name renamed as suppliers and order by buyer and suppliers

SELECT c.companyname AS buyer,s.companyname AS supplier,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN suppliers  AS s USING (supplierid)
GROUP BY GROUPING SETS ((buyer),(buyer,supplier))
ORDER BY buyer,supplier;

Q)find total sales groped by customers companyname and categoryname (must link to table)
order by companyname ,categoryname with NULL FIRST
 
SELECT companyname,categoryname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  AS s USING (categoryid)
GROUP BY GROUPING SETS ((companyname),(companyname,categoryname))
ORDER BY companyname,categoryname NULLS FIRST;

--50. Rollup
SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY ROLLUP(companyname, categoryname, productname);
ORDER BY companyname,categoryname,productname

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY ROLLUP(supplier, buyer, productname)
ORDER BY supplier,buyer,productname;

--51. Cube - Rollup On Steroids

SELECT c.companyname,categoryname,productname,SUM(od.unitprice*quantity)
FROM customers AS c
NATURAL JOIN orders
NATURAL JOIN order_details AS od
JOIN products USING (productid)
JOIN categories  USING (categoryid)
GROUP BY CUBE (companyname, categoryname, productname);

Q)do a cube total sales by suppliers products and customers

SELECT s.companyname AS supplier, c.companyname AS buyer,productname, SUM(od.unitprice*quantity)
FROM suppliers AS s
JOIN products USING (supplierid)
JOIN order_details AS od USING (productid)
JOIN orders USING (orderid)
JOIN customers AS c USING (customerid)
GROUP BY CUBE(supplier, buyer, productname);
*******************************************