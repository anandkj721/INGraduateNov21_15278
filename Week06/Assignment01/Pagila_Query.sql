--Q1
SELECT *
FROM actor

--Q2
SELECT *
FROM film

--Q3
SELECT *
FROM staff
 
 --Q4
 SELECT DISTINCT (address,district)
 FROM
 address
 
 --Q5
 SELECT title ,description 
 FROM 
 film 
 
 --Q6
  SELECT city  ,country_id  
 FROM 
 city
 
 --Q7
 SELECT DISTINCT (last_Name) 
 FROM 
 customer 
 
 --Q8
 SELECT DISTINCT (first_Name) 
 FROM 
 actor 
 
  --Q9
 SELECT DISTINCT (inventory_id) 
 FROM 
 rental 
 
 --Q10
 SELECT COUNT(*)
 FROM film
 
 --Q11
  SELECT COUNT(*)
 FROM category
 
 --Q12
 SELECT COUNT( DISTINCT first_name)
 FROM actor
 
 
 SELECT rental_id,return_date-rental_date
 from rental
 
 
 
 