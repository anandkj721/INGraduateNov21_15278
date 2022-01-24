section 24 SQL functions and procedures
--126. Write Your First Function
CREATE  OR REPLACE FUNCTION fix_homepage() RETURNS void AS $$
	UPDATE suppliers
	SET homepage='N/A'
	WHERE homepage IS NULL;
$$ LANGUAGE SQL;

SELECT fix_homepage();

CREATE OR REPLACE FUNCTION set_employee_default_photo() RETURNS void AS $$
	UPDATE employees
	SET photopath='http://accweb/emmployees/default.bmp'
	WHERE photopath IS NULL;
$$ LANGUAGE SQL;

SELECT set_employee_default_photo();

--127. Write A Function That Returns A Single Value
CREATE OR REPLACE FUNCTION max_price() RETURNS real AS $$
	SELECT MAX(unitprice)
	FROM products;
$$ LANGUAGE SQL;

SELECT max_price();

--Q)write a function biggest_order that returns the largest order in terms of total money spent 

CREATE OR REPLACE FUNCTION biggest_order() RETURNS double precision AS $$

	SELECT MAX(amount)
	FROM
	(SELECT SUM(unitprice*quantity) as amount,orderid
	FROM order_details
	GROUP BY orderid) as totals;

$$ LANGUAGE SQL;

SELECT biggest_order();

--128. Functions With Parameters
CREATE OR REPLACE FUNCTION customer_largest_order(cid bpchar) RETURNS double precision AS $$
	SELECT MAX(order_total) FROM
	(SELECT SUM(quantity*unitprice) as order_total,orderid
	FROM order_details
	NATURAL JOIN orders
	WHERE customerid=cid
	GROUP BY orderid) as order_total;
$$ LANGUAGE SQL;

SELECT customer_largest_order('ANATR');

--Q)find the most ordered product of particular customer by number of items orderd.call the function most_ordered_product

CREATE OR REPLACE FUNCTION most_ordered_product(customerid bpchar) RETURNS varchar(40) AS $$
	SELECT productname
	FROM products
	WHERE productid IN
	(SELECT productid FROM
	(SELECT SUM(quantity) as total_ordered, productid
	FROM order_details
	NATURAL JOIN orders
	WHERE customerid= $1
	GROUP BY productid
	ORDER BY total_ordered DESC
	LIMIT 1) as ordered_products);
$$ LANGUAGE SQL;

SELECT most_ordered_product('CACTU');

--129. Functions That Have Composite Parameters
CREATE OR REPLACE FUNCTION new_price(products, increase_percent numeric)
RETURNS double precision AS $$
	SELECT $1.unitprice * increase_percent/100
$$ LANGUAGE SQL

SELECT productname,unitprice,new_price(products.*,110)
FROM products;

--create a function full_name that takes employees and return title ,firstname and lastname concatenated together.then use this in a select statement.

CREATE OR REPLACE FUNCTION full_name(employees) RETURNS varchar(62) AS $$
	SELECT $1.title || ' ' || $1.firstname || ' ' || $1.lastname
$$ LANGUAGE SQL;

SELECT full_name(employees.*),city,country
FROM employees;

--130. Functions That Return A Composite
CREATE OR REPLACE FUNCTION newest_hire() RETURNS employees AS $$
	SELECT *
	FROM employees
	ORDER BY hiredate DESC
	LIMIT 1;
$$ LANGUAGE SQL;

SELECT newest_hire();

SELECT (newest_hire()).lastname;

SELECT lastname(newest_hire());

--Q)create a function called highest_inventory that returns the products row that has
the most amount of money tied up in inventory .
CREATE OR REPLACE FUNCTION highest_inventory() RETURNS products AS $$

	SELECT * FROM products
	ORDER BY (unitprice*unitsinstock) DESC
	LIMIT 1;

$$ LANGUAGE SQL;

SELECT (highest_inventory()).productname;

--Q)run function and grab the productname only
SELECT productname(highest_inventory());

---131. Functions With Output Parameters

CREATE OR REPLACE FUNCTION sum_n_product (x int, y int, OUT sum int, OUT product int) AS $$
	SELECT x + y, x * y
$$ LANGUAGE SQL;

SELECT sum_n_product(5, 20);
SELECT (sum_n_product(5, 20)).*;

--Q)create a function that takes a single number and returns the square and cube the number using 
--OUT parameters .call it square_n_cube
CREATE OR REPLACE FUNCTION square_n_cube(IN x int, OUT square int, OUT cube int) AS $$
	SELECT x * x, x*x*x;
$$ LANGUAGE SQL;

SELECT (square_n_cube(55)).*;

--132. Functions With Default Values

CREATE OR REPLACE FUNCTION new_price(products, increase_percent numeric DEFAULT 105)
RETURNS double precision AS $$
	SELECT $1.unitprice * increase_percent/100
$$ LANGUAGE SQL;

SELECT productname,unitprice,new_price(products)
FROM products;

--Q)redo square_n_cube. create a function that takes a single number and returns the square and cube of the 
--number using OUT parameters .give the input a default value of 10.run function without any input.

CREATE OR REPLACE FUNCTION square_n_cube(IN x int DEFAULT 10, OUT square int, OUT cube int) AS $$
	SELECT x * x, x*x*x;
$$ LANGUAGE SQL;

SELECT (square_n_cube()).*;

--133. Using Functions as Table Source --//showing error
SELECT firstname,lastname,hiredate
FROM newest_hire(); 


--Q)use highest_inventory to pull back productname,and supplier companyname(you will have to join 
--function results)  --//showing error
SELECT productname,companyname
FROM highest_inventory() AS hi
JOIN suppliers ON hi.supplierid=suppliers.supplierid;

--134. Functions That Return More Than One Row

--Q)create a function that all suppliers that have products that need to be ordered
--(units on hand plus ordered is less than reorder level).use SETOF syntax 
--call function :suppliers_to_reorder_from
CREATE OR REPLACE FUNCTION sold_more_than(total_sales real)
RETURNS SETOF products AS $$
 SELECT * FROM products
 WHERE productid IN (
	 SELECT productid FROM
 	 (SELECT SUM(quantity*unitprice),productid
	 FROM order_details
	 GROUP BY productid
	 HAVING SUM(quantity*unitprice) > total_sales) as qualified_products
 )
$$ LANGUAGE SQL;

SELECT productname, productid, supplierid
FROM sold_more_than(25000);


--Q)create function that returns the excess inventory ,productid and productname from
--products table based on an input parameter of percent of inventory threshold.use
--RETURNS TABLE syntax
 

CREATE OR REPLACE FUNCTION suppliers_to_reorder_from()
RETURNS SETOF suppliers AS $$
  SELECT * FROM suppliers
  WHERE supplierid IN (
	 SELECT supplierid FROM products
	  WHERE unitsinstock + unitsonorder < reorderlevel
  )
$$ LANGUAGE SQL;

SELECT * FROM suppliers_to_reorder_from()

--135. Procedures - Functions That Don't Return Anything
CREATE OR REPLACE PROCEDURE add_em(x int, y int) AS $$

	SELECT x + y

$$ LANGUAGE SQL;

CALL add_em(5,3);

--Q)create a procedure change_suppliers _prices that takes the suppliers anf amount 
--and increases all the units prices in products table for that suppliers,
--run procedure with supplied 20 and raise prices by $0.50.

CREATE OR REPLACE PROCEDURE change_supplier_prices(supplierid smallint, amount real) AS $$

	UPDATE products
	SET unitprice = unitprice + amount
	WHERE supplierid = $1

$$ LANGUAGE;

CALL change_supplier_prices(20::smallint, 0.50);