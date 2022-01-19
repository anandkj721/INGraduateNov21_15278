--141. Declaring Arrays
DROP TABLE IF EXISTS friends;

CREATE TABLE friends (
    name full_name,
    address address,
    specialdates dates_to_remember,
    children varchar(50) ARRAY
);

DROP TABLE IF EXISTS salary_employees;

CREATE TABlE salary_employees (
    name text,
    pay_by_quarter integer[4],
	schedule text[][]
)

SELECT * FROM salary_employees

--142. Inputting Array Values
SELECT * FROM friends

INSERT INTO friends (name, address, specialdates, children)
VALUES (ROW('Boyd','M','Gregory'),
		ROW('7777','','Boise','Idaho','USA','99999'),
		ROW('1969-02-01',49,'2001-07-15'),
	   '{"Austin","Ana Grace"}');

 INSERT INTO friends (name, address, specialdates, children)
 VALUES (ROW('Scott','X','Levy'),
 		ROW('357 Page Road','','Austin','TX','USA','88888'),
 		ROW('1972-03-01',46,'2002-01-30'),
 		   ARRAY['Ben','Jill']);

SELECT * FROM salary_employees
INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 		'{20000, 20000, 20000, 20000}',
				'{{"meeting", "training"},{"lunch", "sales call"}}')

INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 ARRAY[20000, 20000, 20000, 20000],
		 ARRAY[['meeting', 'training'],['lunch', 'sales call']])

----143. Accessing Arrays
SELECT * FROM friends;

SELECT children[2]
FROM friends;


SELECT * FROM salary_employees;
SELECT pay_by_quarter[2:3]
FROM salary_employees;

SELECT array_dims(schedule)
FROM salary_employees;

SELECT array_length(schedule,1),array_length(schedule,2)
FROM salary_employees;

----144. Modifying Arrays

UPDATE friends
SET children=ARRAY['Maddie','Timmy','Cheryl']
WHERE (name).first_name = 'Boyd';

SELECT * FROM friends;

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;



UPDATE friends
SET children[2]='Ricky'
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

SELECT * FROM friends;
UPDATE friends
SET children[2:3]=ARRAY['Suzy','Billy']
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

SELECT * FROM salary_employees;

UPDATE salary_employees
SET pay_by_quarter=ARRAY[22000,25000,27000,22000]
WHERE name='Bill';


SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';


SELECT * FROM salary_employees;
UPDATE salary_employees
SET pay_by_quarter[4]=26000
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';

UPDATE salary_employees
SET pay_by_quarter[2:3]=ARRAY[24000,25000]
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';

----145. Searching Arrays

SELECT *
FROM friends
WHERE children[0] = 'Billy' OR children[1] = 'Billy'
OR children[2]='Billy' OR children[3]='Billy';

SELECT *
FROM friends
WHERE 'Austin' = ANY (children)

SELECT *
FROM salary_employees
WHERE 'sales call' = ANY (schedule);

----146. Array Operators
-- equal
SELECT ARRAY[1, 2, 3, 4] = ARRAY[1, 2, 3, 4];--true

-- not equal, the elements are not in same order
SELECT ARRAY[1, 2, 4, 3] = ARRAY[1, 2, 3, 4];--false

-- true
SELECT ARRAY[1, 2, 4, 3] > ARRAY[1, 2, 3, 4];

-- false
SELECT ARRAY[1, 2, 3, 4] > ARRAY[1, 2, 3, 4];

-- false 3 smaller than 4, doesn't look at 5 greater than 4
SELECT ARRAY[1, 2, 3, 5] > ARRAY[1, 2, 4, 4];

-- true
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5];

-- false
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5, 7];

-- true
SELECT ARRAY[1, 2] <@ ARRAY[2, 5, 7, 1];

-- true
SELECT ARRAY[1, 2, 13, 17] && ARRAY[2, 5, 7, 1];

--false
SELECT ARRAY[ 13, 17] && ARRAY[2, 5, 7, 1];

SELECT *
FROM friends
WHERE children && ARRAY['Billy'::varchar(50)];

SELECT *
FROM salary_employees
WHERE schedule && ARRAY['sales call'];
Q)create a table called salary_employees withs 3 fields,name,pay_by_quarter which is an 
integer with one dimension and 4, values and schedule which should be text field with 2
dimension of no particular size.

CREATE TABlE salary_employees (
    name text,
    pay_by_quarter integer[4],
	schedule text[][]
)

Q)add a row into salary_employee,bill who made 20,000 each quarter and had 2 different
schedule recods of "meeting","training",and "lunch","sales call".

INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 ARRAY[20000, 20000, 20000, 20000],
		 ARRAY[['meeting', 'training'],['lunch', 'sales call']])
		 
Q)grab the 2 and 3 elements of pay_by_quarter using range from salary_employees table.

SELECT * FROM salary_employees;
SELECT pay_by_quarter[2:3]
FROM salary_employees;

Q)replace bill's pay_by_quarter with values 22000,25000,27000,22000

UPDATE salary_employees
SET pay_by_quarter=ARRAY[22000,25000,27000,22000]
WHERE name='Bill';


Q)update bill's 4th pay_by_quarter to 26000

UPDATE salary_employees
SET pay_by_quarter[4]=26000
WHERE name='Bill';

Q)update bill's 2nd and 3rd quarter to 24000 and 25000

UPDATE salary_employees
SET pay_by_quarter[2:3]=ARRAY[24000,25000]
WHERE name='Bill';

Q)search salary employees for anyone with 'sales call' in the schedule

SELECT *
FROM salary_employees
WHERE 'sales call' = ANY (schedule);

Q)use overlap operator to find anyone with 'sales call' in schedule in salary_employee

SELECT *
FROM salary_employees
WHERE schedule && ARRAY['sales call'];
