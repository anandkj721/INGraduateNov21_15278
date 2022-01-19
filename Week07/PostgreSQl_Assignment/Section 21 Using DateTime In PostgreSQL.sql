SHOW DateStyle;

SET DateStyle = 'ISO,DMY';

SET DateStyle = 'ISO,MDY'


CREATE TABLE test_time (
	startdate DATE,
	startstamp TIMESTAMP,
	starttime TIME
);

SELECT * FROM test_time
Insert INTO test_time (startdate, startstamp,starttime)
VALUES ('DATE, ,'TIMESTAMP,,'TIME');--SHOWING ERROR


SELECT * FROM test_time;

Insert INTO test_time (startdate, startstamp)
VALUES ('NOW'::abstime,'today'::abstime);--SHOWING ERROR


SELECT * FROM test_time;

--116. Times Zones	
SELECT * FROM pg_timezone_names;

SELECT * FROM  pg_timezone_abbrevs;

ALTER TABLE test_time
ADD COLUMN endstamp TIMESTAMP WITH TIME ZONE;

ALTER TABLE test_time
ADD COLUMN endtime TIME WITH TIME ZONE;


INSERT INTO test_time
(endstamp,endtime)
VALUES ('01/20/2018 10:30:00 US/Pacific', '10:30:00+5');--ERROR showing

INSERT INTO test_time (endstamp,endtime)
VALUES ('06/20/2018 10:30:00 US/Pacific', '10:30:00+5');--ERROR showing

--Notice the difference in offset due to daylight savings time
SELECT * FROM test_time;


SHOW TIME ZONE;
--notice the offset of time
SELECT * FROM test_time;


--notice offset changed
SELECT * FROM test_time;

--117. Interval Data Type

ALTER TABLE test_time
ADD COLUMN span interval;

DELETE  FROM test_time;

--Postgres Format
INSERT INTO test_time (span)
VALUES ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS');
SELECT * FROM test_time;

INSERT INTO test_time (span)
VALUES ('5 DECADES 3 YEARS, 6 MONTHS 3 DAYS ago');

SELECT * FROM test_time;

--SQL Standard

INSERT INTO test_time (span)
VALUES ('4 32:12:10');

SELECT * FROM test_time;

INSERT INTO test_time (span)
VALUES ('1-2');


--ISO 8061 Format
INSERT INTO test_time (span)
VALUES (‘P5Y3MT7H3M’)--ERROR SHOWING

INSERT INTO test_time (span)
VALUES ('P25-2-30T17:33:10');

SELECT * FROM test_time;

SHOW intervalstyle;
SELECT * FROM test_time;

SET intervalstyle='postgres_verbose';
SELECT * FROM test_time;

SET intervalstyle='sql_standard';
SELECT * FROM test_time;

SET intervalstyle='iso_8601';
SELECT * FROM test_time;

SET intervalstyle='postgres';

*****************************

--118. Date Arithmetic

SELECT DATE '2018-09-28' + INTERVAL '5 days 1 hour';--2018-10-03 01:00:00

SELECT TIME '5:30:10' + INTERVAL '70 minutes 80 seconds';--06:41:30

SELECT TIMESTAMP '1917-06-20 12:30:10.222' +
 INTERVAL '30 years 6 months 7 days 3 hours 17 minutes 3 seconds';--1947-12-27 15:47:13.222
 
SELECT INTERVAL '5 hours 30 minutes 2 seconds' +
INTERVAL '5 days 3 hours 13 minutes';--5 days 08:43:02

SELECT DATE '2017-04-05' +  INTEGER '7';--2017-04-12

----------subtracting intervals from date,time, timestamp
SELECT DATE '2018-10-20' - INTERVAL '2 months 5 days';--2018-08-15 00:00:00

SELECT TIME '23:39:17' - INTERVAL '12 hours 7 minutes 3 seconds';--11:32:14

SELECT TIMESTAMP '2016-12-30' - INTERVAL '27 years 3 months 17 days 3 hours 37 minutes';--1989-09-12 20:23:00

----------subtracting integer from date
SELECT DATE '2016-12-30' - INTEGER '300';--2016-03-05

----------subtracting 2 dates
SELECT DATE '2016-12-30' - DATE '2009-04-7';--2824

----------subtracting 2 times and 2 timestamps
SELECT TIME '17:54:01' - TIME '03:23:45';--14:30:16

SELECT TIMESTAMP '2001-02-15 12:00:00' - TIMESTAMP '1655-08-30 21:33:05';--126177 days 14:26:55

----------Multiply and divide intervals
SELECT 5 * INTERVAL '7 hours 5 minutes';--35:25:00

SELECT INTERVAL '30 days 20 minutes' / 2;--15 days 00:10:00

SELECT age(TIMESTAMP '2022-01-17', TIMESTAMP '1992-07-21');--29 years 5 mons 27 days

SELECT age (TIMESTAMP '1992-07-21');--29 years 5 mons 27 days



----119. Pulling Out Parts of Dates and Times

SELECT EXTRACT(YEAR FROM age(birthdate)),firstname, lastname
FROM employees;

SELECT date_part('day', shippeddate)
FROM orders;

SELECT EXTRACT(DECADE FROM age(birthdate)),firstname, lastname
FROM employees;

SELECT date_part('DECADE',age(birthdate)),firstname, lastname
FROM employees;
******
--120. Converting One Data Type Into Another
SELECT hiredate::TIMESTAMP
FROM employees;

SELECT CAST(hiredate AS TIMESTAMP)
FROM employees;

SELECT (ceil(unitprice*quantity))::TEXT || ' dollars spent'
FROM order_details;

SELECT CAST('2015-10-03' AS DATE),  375::TEXT;



SELECT DATE '2018-09-28' + INTERVAL '5 days 1 hour';--2018-10-03 01:00:00

SELECT TIME '5:30:10' + INTERVAL '70 minutes 80 seconds';--06:41:30

SELECT TIMESTAMP '1917-06-20 12:30:10.222' +
 INTERVAL '30 years 6 months 7 days 3 hours 17 minutes 3 seconds';--1947-12-27 15:47:13.222
 
SELECT INTERVAL '5 hours 30 minutes 2 seconds' +
INTERVAL '5 days 3 hours 13 minutes';--5 days 08:43:02

SELECT DATE '2017-04-05' +  INTEGER '7';--2017-04-12

----------subtracting intervals from date,time, timestamp
SELECT DATE '2018-10-20' - INTERVAL '2 months 5 days';--2018-08-15 00:00:00

SELECT TIME '23:39:17' - INTERVAL '12 hours 7 minutes 3 seconds';--11:32:14

SELECT TIMESTAMP '2016-12-30' - INTERVAL '27 years 3 months 17 days 3 hours 37 minutes';--1989-09-12 20:23:00

----------subtracting integer from date
SELECT DATE '2016-12-30' - INTEGER '300';--2016-03-05

----------subtracting 2 dates
SELECT DATE '2016-12-30' - DATE '2009-04-7';--2824

----------subtracting 2 times and 2 timestamps
SELECT TIME '17:54:01' - TIME '03:23:45';--14:30:16

SELECT TIMESTAMP '2001-02-15 12:00:00' - TIMESTAMP '1655-08-30 21:33:05';--126177 days 14:26:55

----------Multiply and divide intervals
SELECT 5 * INTERVAL '7 hours 5 minutes';--35:25:00

SELECT INTERVAL '30 days 20 minutes' / 2;--15 days 00:10:00

SELECT age(TIMESTAMP '2022-01-17', TIMESTAMP '1992-07-21');--29 years 5 mons 27 days

SELECT age (TIMESTAMP '1992-07-21');--29 years 5 mons 27 days

----119. Pulling Out Parts of Dates and Times
SELECT EXTRACT(YEAR FROM age(birthdate)),firstname, lastname
FROM employees;--73	"Nancy"	"Davolio"


SELECT date_part('day', shippeddate)
FROM orders;--16

SELECT EXTRACT(DECADE FROM age(birthdate)),firstname, lastname
FROM employees; --7	"Nancy"	"Davolio"	

SELECT date_part('DECADE',age(birthdate)),firstname, lastname
FROM employees;--7	"Nancy"	"Davolio"

--120. Converting One Data Type Into Another
SELECT hiredate::TIMESTAMP
FROM employees;

SELECT CAST(hiredate AS TIMESTAMP)
FROM employees;

SELECT (ceil(unitprice*quantity))::TEXT || ' dollars spent'
FROM order_details;

SELECT CAST('2015-10-03' AS DATE),  375::TEXT;

--119. Pulling Out Parts of Dates and Times
Q)find how many decades old employee is using both syntaxes

SELECT date_part('DECADE',age(birthdate)),firstname, lastname
FROM employees;