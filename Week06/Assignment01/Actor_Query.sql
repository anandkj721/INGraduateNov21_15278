-- 1
SELECT * FROM actor;

--2
SELECT * FROM film;

--3
SELECT * FROM staff;

--4
SELECT address,district FROM address;

--5
SELECT title,description FROM film;

--6
SELECT city,country_id FROM city;

--7
SELECT DISTINCT(last_name) FROM customer;

--8
SELECT DISTINCT(first_name) FROM actor;

--9
SELECT DISTINCT(inventory_id) FROM rental;

--10
SELECT COUNT(*) FROM film;

--11
SELECT COUNT(*) FROM category;

--12
SELECT COUNT(DISTINCT first_name) FROM actor;

--12
SELECT rental_id,return_date-rental_date FROM rental;
