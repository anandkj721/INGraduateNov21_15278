--Q1
SELECT name,weight,productnumber
FROM production.product
ORDER BY weight ASC;

--Q2
SELECT *
FROM purchasing.productvendor
WHERE productid=407
ORDER BY averageleadtime ASC;

--Q3
SELECT *
FROM sales.salesorderdetail
WHERE productid=799
ORDER BY orderqty DESC;

--Q4
SELECT MAX(discountpct)
FROM sales.specialoffer;

--Q5
SELECT MIN(sickleavehours)
FROM humanresources.employee;

--Q6
SELECT MAX(rejectedqty)
FROM purchasing.purchaseorderdetail;

--Q7
SELECT AVG(rate)
FROM humanresources.employeepayhistory;

--Q8
SELECT AVG(standardcost)
FROM production.productcosthistory
WHERE productid=738;

--Q9
SELECT SUM(scrappedqty)
FROM production.workorder
WHERE productid = 529;

--Q10
SELECT name
FROM purchasing.vendor
WHERE name LIKE 'G%';

--Q11
SELECT name
FROM purchasing.vendor
WHERE name LIKE '%Bike%';

--Q12
SELECT firstname
FROM person.person
WHERE firstname LIKE '_t%';

--Q13
SELECT *
FROM person.emailaddress
LIMIT 20;

--Q14
SELECT *
FROM production.productcategory
LIMIT 2;

--Q15
SELECT COUNT(*)
FROM production.product
WHERE weight IS NULL;

--Q16
SELECT COUNT(*)
FROM person.person
WHERE additionalcontactinfo IS NOT NULL;
