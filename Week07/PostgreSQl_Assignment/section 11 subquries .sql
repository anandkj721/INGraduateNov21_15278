--55. Subquery Using EXISTS

SELECT companyname,contactname
FROM customers
WHERE EXISTS (SELECT customerid FROM orders
WHERE customerid=customers.customerid AND
orderdate BETWEEN '1997-04-01' AND '1997-04-30');

 SELECT companyname,contactname
 FROM customers
 WHERE NOT EXISTS (SELECT customerid FROM orders
 WHERE customerid=customers.customerid AND
 orderdate BETWEEN '1997-04-01' AND '1997-04-30');

SELECT productname
FROM products
WHERE NOT EXISTS (SELECT orders.orderid FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
WHERE order_details.productid=products.productid AND
orderdate BETWEEN '1997-04-01' AND '1997-04-30');

				  
Q)find all suppliers with product that costs more than $200
				  
SELECT companyname
FROM suppliers
WHERE EXISTS (SELECT productid FROM products
WHERE products.supplierid=products.supplierid AND
unitprice > 200);

Q) find all suppliers that don't have an order in december 1996
				
SELECT companyname
FROM suppliers
WHERE  NOT EXISTS (SELECT products.productid FROM products
JOIN order_details ON products.productid=order_details.productid
JOIN orders ON order_details.orderid=orders.orderid
WHERE suppliers.supplierid=products.supplierid AND
orderdate BETWEEN '1996-12-01' AND '1996-12-31' );
				  
--56. Subquery Using ANY and ALL

SELECT companyname
FROM customers
WHERE  customerid = ANY (SELECT customerid FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
WHERE quantity > 50);

SELECT companyname
FROM suppliers
WHERE  supplierid = ANY (SELECT products.supplierid FROM order_details
JOIN products ON products.productid=order_details.productid
WHERE quantity = 1);

Q)find all suppliers that have had an oreder with 1 item

SELECT DISTINCT productname
FROM products
JOIN order_details ON products.productid=order_details.productid
WHERE  order_details.unitprice*quantity > ALL
(SELECT AVG(order_details.unitprice*quantity)
FROM order_details
GROUP BY productid);

Q)find all distinct customer that ordered more in one item than the average order amount 
per item of all customers

 SELECT DISTINCT companyname
 FROM customers
 JOIN orders ON orders.customerid=customers.customerid
 JOIN order_details ON orders.orderid=order_details.orderid
 WHERE  order_details.unitprice*quantity > ALL
(SELECT AVG(order_details.unitprice*quantity)
FROM order_details
JOIN orders ON orders.orderid=order_details.orderid
GROUP BY orders.customerid);
       