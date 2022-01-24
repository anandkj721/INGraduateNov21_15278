section 25 transaction and concurrency control
---137. Simple Transaction Control
BEGIN TRANSACTION;
	UPDATE products
	SET reorderlevel = reorderlevel - 5;

	SELECT COUNT(*)
	FROM products
	WHERE unitsinstock + unitsonorder < reorderlevel;

END TRANSACTION;

--Q)create a single transaction to increase the requiredate in orders by one day for 
-- december 2017 and decrease it by one day for november 2017.

BEGIN TRANSACTION;
	UPDATE orders
	SET requireddate = requireddate + INTERVAL '1 DAY'
	WHERE orderdate BETWEEN '1997-12-01' AND '1997-12-31';

	UPDATE orders
	SET requireddate = requireddate - INTERVAL '1 DAY'
	WHERE orderdate BETWEEN '1997-11-01' AND '1997-11-30';

END TRANSACTION;

select * from orders where orderdate BETWEEN '1997-12-01' AND '1997-12-31';

--138. Rollbacks & Savepoints
START TRANSACTION;

UPDATE orders
SET orderdate = orderdate + INTERVAL '1 YEAR';

ROLLBACK;


START TRANSACTION;

INSERT INTO employees (employeeid,lastname,firstname,title,birthdate,hiredate)
VALUES (501,'Sue','Jones','Operations Assistant','1999-05-23','2017-06-13');

SAVEPOINT inserted_employee;

UPDATE employees
SET birthdate='2025-07-11';

ROLLBACK TO inserted_employee;

UPDATE employees
SET birthdate='1998-05-23'
WHERE employeeid=501;

COMMIT;

SELECT *
FROM employees
WHERE employeeid=501;