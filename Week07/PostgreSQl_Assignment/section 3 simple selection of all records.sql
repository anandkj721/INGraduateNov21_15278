--7. Selecting All Data From a Table

SELECT *
FROM customers;

Q)select everything from employee table

SELECT *
FROM employees;

--8. Selecting Specific Fields

SELECT companyname, city, country
FROM suppliers;

Q)select the name and description of all the product categories

SELECT categoryname, description
FROM categories;

--9. Selecting Distinct Values

SELECT DISTINCT country
FROM customers;

SELECT DISTINCT city, country
FROM customers;

Q)what are the unique regions our suppliers are in?

SELECT DISTINCT region
FROM suppliers;

--10. Counting Results

SELECT COUNT(*)
FROM Products;

Q)how many orders  have we  had?

SELECT COUNT(*)
FROM orders;

Q)how many cities are our suppliers in?

SELECT COUNT(DISTINCT city)
FROM  suppliers;

Q)how many distinct peoducts have been ordered (user order details)?

SELECT COUNT(DISTINCT productid)
FROM  order_details;

--11. Combining Fields in SELECT

SELECT orderid, shippeddate - orderdate
FROM orders;

Q)select the amount spent on order details(price times quantity)
SELECT orderid, unitprice * quantity
FROM order_details;

--12. Practice What You've Learned

Q1)Select all fields, and all records from actor table
SELECT * FROM actor;

Q2)Select all fields and records from film table
SELECT * FROM film;

Q3)Select all fields and records from the staff table
SELECT * FROM staff;

Q4)Select address and district columns from address table
SELECT address,district FROM address;

Q5)Select title and description from film table
SELECT title,description FROM film;

Q6)Select city and country_id from city table
SELECT city,country_id FROM city;

Q7)Select all the distinct last names from customer table
SELECT DISTINCT(last_name) FROM customer;

Q8)Select all the distinct first names from the actor table
SELECT DISTINCT(first_name) FROM actor;

Q9)Select all the distinct inventory_id values from rental table
SELECT DISTINCT(inventory_id) FROM rental;

Q10)Find the number of films ( COUNT ).
SELECT COUNT(*) FROM film;

Q11)Find the number of categories.
SELECT COUNT(*) FROM category;

Q12)Find the number of distinct first names in actor table
SELECT COUNT(DISTINCT first_name) FROM actor;

Q13)Select rental_id and the difference between return_date and rental_date in rental table
SELECT rental_id,return_date-rental_date FROM rental;
