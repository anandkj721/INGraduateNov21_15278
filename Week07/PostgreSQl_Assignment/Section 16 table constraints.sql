--92. NOT NULL Constraint

CREATE TABLE IF NOT EXISTS practices (
	practiceid integer NOT NULL
);

INSERT INTO practices (practiceid)
VALUES (null);

DROP TABLE IF EXISTS practices;

CREATE TABLE IF NOT EXISTS practices (
practiceid integer NOT NULL,
practice_field varchar(50) NOT NULL
);

ALTER TABLE products
ALTER COLUMN unitprice SET NOT NULL;

ALTER TABLE employees
ALTER COLUMN lastname SET NOT NULL;

--93. UNIQUE Constraint

DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer UNIQUE,
  fieldname varchar(50) NOT NULL
);

INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field1');
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field2');


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer UNIQUE,
    name varchar(25) NOT NULL
)


----94. PRIMARY KEY Constraint

DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
fieldname varchar(50) NOT NULL
);

INSERT INTO practices (practiceid,fieldname)
VALUES (1, null);
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field1');
INSERT INTO practices (practiceid,fieldname)
VALUES (1, 'field2');

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
name varchar(25) NOT NULL
);

ALTER TABLE practices
DROP CONSTRAINT practices_pkey;

ALTER TABLE practices
ADD PRIMARY KEY (practiceid);

ALTER TABLE pets
DROP CONSTRAINT pets_pkey;

ALTER TABLE pets
ADD PRIMARY KEY (petid);

----95. FOREIGN KEY Constraint
DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
)


DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)

ALTER TABLE practices
DROP CONSTRAINT practices_employeeid_fkey;

ALTER TABLE practices
ADD CONSTRAINT practices_employee_fkey
FOREIGN KEY (employeeid) REFERENCES employees(employeeid);

ALTER TABLE pets
DROP CONSTRAINT pets_customerid_fkey;

ALTER TABLE pets
ADD CONSTRAINT pets_customerid_fkey
FOREIGN KEY (customerid) REFERENCES customers(customerid);

--96. CHECK Constraint


DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	cost integer CONSTRAINT practices_cost CHECK (cost >= 0 AND cost <= 1000),
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
);

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	weight integer CONSTRAINT pets_weight CHECK (weight > 0 AND weight < 200),
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

SELECT * FROM pets

ALTER TABLE orders
ADD CONSTRAINT orders_freight CHECK (freight > 0);

SELECT * FROM orders_freight

ALTER TABLE products
ADD CONSTRAINT products_unitprice CHECK (unitprice > 0);

SELECT * FROM products

--97. DEFAULT Values
DROP TABLE IF EXISTS practices;

CREATE TABLE practices (
	practiceid integer PRIMARY KEY,
	practicefield varchar(50) NOT NULL,
	employeeid integer NOT NULL,
	cost integer DEFAULT 50 CONSTRAINT practices_cost CHECK (cost >= 0 AND cost <= 1000),
	FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
);

SELECT * FROM practices

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	weight integer DEFAULT 5 CONSTRAINT pets_weight CHECK (weight > 0 AND weight < 200),
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

SELECT * FROM orders

ALTER TABLE orders
ALTER COLUMN shipvia SET DEFAULT 1;

ALTER TABLE products
ALTER COLUMN reorderlevel SET DEFAULT 5;

SELECT * FROM products

--98. Changing a Column's Default Value
ALTER TABLE products
ALTER COLUMN reorderlevel SET DEFAULT 5

ALTER TABLE products
ALTER COLUMN reorderlevel DROP DEFAULT

ALTER TABLE suppliers
ALTER COLUMN homepage SET DEFAULT 'N/A'

ALTER TABLE suppliers
ALTER COLUMN homepage DROP DEFAULT

--99. Adding and Removing a Column's Constraint
ALTER TABLE products
ADD CHECK ( reorderlevel > 0);

-- All rows must meet the condition
UPDATE products
SET reorderlevel = 0
WHERE reorderlevel is null or reorderlevel < 0;

ALTER TABLE products
ALTER COLUMN discontinued SET NOT NULL;


ALTER TABLE products
ALTER COLUMN discontinued DROP NOT NULL;

ALTER TABLE order_details
ADD CHECK (unitprice > 0);

ALTER TABLE order_details
ALTER COLUMN discount SET NOT NULL;	

ALTER TABLE order_details
DROP CONSTRAINT order_details_unitprice_check;

ALTER TABLE order_details
ALTER COLUMN discount DROP NOT NULL;

--93. UNIQUE Constraint

Q) Make the employee field of shippers table is unique.

ALTER TABLE shippers
ADD CONSTRAINT shippers_companyname UNIQUE(companyname);

Q)drop old pets table and create a table called pets with 2 fields:
petid integer that is the primary key
name varchar (25) and must not have null values 

--94. PRIMARY KEY Constraint

Q)drop primary key for pets and re-create

ALTER TABLE pets
DROP CONSTRAINT pets_pkey;

ALTER TABLE pets
ADD PRIMARY KEY (petid);

--95. FOREIGN KEY Constraint
Q)drop old pets table and create a table called pets with 3 fields.
petid integer that is primary key
name varchar(25) and must not have null values.
customerid char (5) which can't be null and a foreign key from customer table.

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
)


Q)drop foreign key for customerid in pets table and re -create
ALTER TABLE pets
DROP CONSTRAINT pets_customerid_fkey;

ALTER TABLE pets
ADD CONSTRAINT pets_customerid_fkey
FOREIGN KEY (customerid) REFERENCES customers(customerid);

----96. CHECK Constraint

Q)drop old pets table and create a table called pets with 4 fields:
pestid interger that is the primary key 
name varchar(25) and must not have null values
customerid char(5) which can't be null and a foreign key from customers table
weight integer which has to be greater than 0 and less than 200

CREATE TABLE pets (
	petid integer PRIMARY KEY,
	name varchar(25) NOT NULL,
	customerid char(5) NOT NULL,
	weight integer CONSTRAINT pets_weight CHECK (weight > 0 AND weight < 200),
	FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

Q)add a CHECK contraint that unitprice in product table must be positive.

ALTER TABLE products
ADD CONSTRAINT products_unitprice CHECK (unitprice > 0);

-- 97. DEFAULT Values
Q)set the default value of recorderlevel in product table to 5

ALTER TABLE products
ALTER COLUMN reorderlevel SET DEFAULT 5;

SELECT * FROM products

---	98. Changing a Column's Default Value

Q)make the suppliers homepage a default of 'N/A' (not available)
ALTER TABLE suppliers
ALTER COLUMN homepage SET DEFAULT 'N/A'

Q)remove the homepage a default  on the suppliers table
ALTER TABLE suppliers
ALTER COLUMN homepage DROP DEFAULT

--99. Adding and Removing a Column's Constraint
Q)add a check constraint to order_details column unitprice to make sure it is positive
number

ALTER TABLE order_details
ADD CHECK (unitprice > 0);

Q)add a not null constraints to discount column in orders_details table

ALTER TABLE order_details
ALTER COLUMN discount SET NOT NULL;	

Q)remove  the  two Constraint you just added

ALTER TABLE order_details
DROP CONSTRAINT order_details_unitprice_check;

ALTER TABLE order_details
ALTER COLUMN discount DROP NOT NULL;
