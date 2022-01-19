--100. Create A Sequence
CREATE SEQUENCE test_sequence;
SELECT nextval('test_sequence');
SELECT currval('test_sequence');
SELECT lastval();

-- set value but next value will increment
SELECT setval('test_sequence',14);
SELECT nextval('test_sequence');

-- set value and next value will be what you set
SELECT setval('test_sequence',25,false);
SELECT nextval('test_sequence');

CREATE SEQUENCE IF NOT EXISTS test_sequence2 INCREMENT 5;
SELECT nextval('test_sequence2');
SELECT currval('test_sequence2');
SELECT lastval();

CREATE SEQUENCE IF NOT EXISTS test_sequence_3
INCREMENT 50 MINVALUE 350 MAXVALUE 5000 START WITH 550;
SELECT nextval('test_sequence_3');
SELECT currval('test_sequence_3');
SELECT lastval();

CREATE SEQUENCE IF NOT EXISTS test_sequence_4 INCREMENT 7 START WITH 33;
SELECT nextval('test_sequence_4');
SELECT currval('test_sequence_4');
SELECT lastval();

SELECT MAX(employeeid) FROM employees;
CREATE SEQUENCE IF NOT EXISTS employees_employeeid_seq
START WITH 10 OWNED BY employees.employeeid;

--This insert will fail
INSERT INTO employees
(lastname,firstname,title,reportsto)
VALUES ('Smith','Bob', 'Assistant', 2);

--must alter the default value
ALTER TABLE employees
ALTER COLUMN employeeid SET DEFAULT nextval('employees_employeeid_seq');
SELECT nextval('employees_employeeid_seq');

--Now Insert will work
INSERT INTO employees
(lastname,firstname,title,reportsto)
VALUES ('Smith','Bob', 'Assistant', 2);

SELECT * FROM employees

--INSERT INTO users (name,age) VALUES (‘Liszt’,10) RETURNING id;

SELECT MAX(orderid) FROM orders;
CREATE SEQUENCE IF NOT EXISTS orders_orderid_seq START WITH 11077;

ALTER TABLE orders
ALTER COLUMN orderid SET DEFAULT nextval('orders_orderid_seq');

INSERT INTO orders (customerid,employeeid,requireddate,shippeddate)
VALUES ('VINET',5,'1996-08-01','1996-08-10') RETURNING orderid;
--SELECT * FROM orders WHERE customerid='VINET'

--101. Alter and Delete Sequences
ALTER TABLE employees
ALTER COLUMN employeeid SET DEFAULT nextval('employees_employeeid_seq');
SELECT nextval('employees_employeeid_seq');

ALTER SEQUENCE employees_employeeid_seq RESTART WITH 1000

ALTER SEQUENCE orders_orderid_seq RESTART WITH 200000
SELECT nextval('orders_orderid_seq')

---rename sequence
ALTER SEQUENCE test_sequence RENAME TO test_sequence_1
ALTER SEQUENCE test_sequence_4  RENAME TO test_sequence_four

--drop sequence
DROP SEQUENCE test_sequence_1
DROP SEQUENCE test_sequence_four

--102. Using Serial Datatypes
DROP TABLE IF EXISTS exes;
CREATE TABLE exes (
exid SERIAL,
name varchar(255)
);
INSERT INTO exes (name) VALUES ('alexendra daddrio') RETURNING exid
SELECT * FROM exes

DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
petid SERIAL,
name varchar(255)
);
INSERT INTO pets (name) VALUES ('Fluffy') RETURNING petid;
SELECT * FROM pets
