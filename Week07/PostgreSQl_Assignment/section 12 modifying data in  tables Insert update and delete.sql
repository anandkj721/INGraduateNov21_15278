--58. INSERT INTO

INSERT INTO orders
(customerid, employeeid, orderdate, requireddate, shipvia,
 freight, shipname, shipaddress, shipcity, shippostalcode,shipcountry)
VALUES ('VINET', 4, '2017-09-16','2017-09-30',3,
        42.5, 'Vins et alcools Chevalier',
        '59 rue de l''Abbaye', 'Reims','51100', 'France');

SELECT MAX(orderid)
FROM orders;

INSERT INTO orders
(orderid,customerid, employeeid, orderdate, requireddate, shipvia,
 freight, shipname, shipaddress, shipcity, shippostalcode,shipcountry)
VALUES (11078, 'VINET', 4, '2017-09-16','2017-09-30',3,
        42.5, 'Vins et alcools Chevalier',"59 rue de l'Abbaye" 'Reims','51100', 'France');

SELECT *
FROM PRODUCTS
WHERE productname='Queso Cabrales'
productid=11;

Q)insert an order details for order we just created .make it an quantity of 20 of queso
cabrales with price of $14

INSERT INTO order_details
(orderid, productid, unitprice,quantity,discount)
VALUES (11078,11,14,20,0);

--59. UPDATE

UPDATE orders
SET requireddate='2017-09-20',freight=50
WHERE orderid=11078;

Q)they also went 40 queso cabrales instead of 20 and we are giving of 50
UPDATE order_details
SET quantity=40,discount=.05
WHERE orderid=11078 AND productid=11;

--60. DELETE
DELETE FROM order_details
WHERE orderid=11078 AND productid=11;

Q)delete the order for the customer using the order id.
DELETE FROM orders
WHERE orderid=11078;

--61. SELECT INTO

INSERT INTO suppliers_northamerica
SELECT *
FROM suppliers
WHERE country IN ('Brazil','Argentina')

Q)backup orders in the year 1997 to a new table orders_1997

INSERT INTO orders_1997
SELECT * FROM orders
WHERE orderdate BETWEEN '1996-12-01' AND '1996-12-31'

--63. Returning Data From Update, Delete, and Insert

INSERT INTO employees
(firstname,lastname,address,city,country,postalcode,homephone,title,employeeid,reportsto)
VALUES
('Bob','Smith','463-4613 Ipsum Street','New Orleans','USA','73-638','741-0423','Chief Strategy',50,NULL)
RETURNING employeeid;

Q)insert a new order into table (i would use orderid=500)and return the orderid

INSERT INTO orders (customerid,employeeid,requireddate,shippeddate,orderid)
VALUES ('VINET',5,'1996-08-01','1996-08-10',500) RETURNING orderid;

UPDATE products
SET unitprice = unitprice * 1.2
WHERE productid=1
RETURNING productid,unitprice AS new_price;

Q)update oreder_details for orderis 10248 and productid 11 to double the quantity
ordered and return the new quantity

UPDATE order_details
SET quantity = quantity * 2
WHERE orderid=10248 AND productid=11
RETURNING quantity AS new_quantity;

Q)delete the order you entered (orderid=50) earlier and return al fields

DELETE FROM employees
WHERE employeeid=50
RETURNING *;

DELETE FROM orders
WHERE orderid=500
RETURNING *;