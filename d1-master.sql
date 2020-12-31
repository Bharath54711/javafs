

SELECT 100 + 200 AS TOTAL;

SELECT 100 + 200 AS 'TOTAL VALUE';

SELECT 100 + 200 AS "TOTAL VALUE";

SELECT Pi();

SELECT MOD(45, 7);

SELECT Sqrt(25);

-- FETCH RECORDS FROM TABLE
SELECT *
FROM   actor;

SELECT *
FROM   sakila.actor;

-- SORT ORDER
SELECT *
FROM   actor
ORDER  BY first_name;

SELECT *
FROM   actor
ORDER  BY first_name ASC;

SELECT *
FROM   actor
ORDER  BY first_name DESC;

SELECT *
FROM   actor
ORDER  BY 1;

SELECT *
FROM   actor
ORDER  BY 2;

SELECT *
FROM   actor
ORDER  BY 2 DESC;

-- FILTERING
SELECT *
FROM   actor
WHERE  first_name = 'WoODY';

SELECT *
FROM   actor
WHERE  first_name = 'WoODY'
ORDER  BY 3 DESC;

SELECT *
FROM   actor
WHERE  actor_id > 195
ORDER  BY actor_id;

SELECT first_name,
       last_name
FROM   actor
ORDER  BY first_name,
          last_name;

SELECT first_name,
       last_name
FROM   actor
ORDER  BY first_name ASC,
          last_name ASC;

SELECT first_name,
       last_name
FROM   actor
ORDER  BY first_name ASC,
          last_name DESC;

-- EMPTY RESULT SET
SELECT *
FROM   actor
WHERE  false;

SELECT *
FROM   actor
WHERE  1 = 2;

SELECT *
FROM   actor
WHERE  true;

-- COLUMN ALIAS
SELECT rental_date,
       inventory_id,
       return_date
FROM   sakila.rental;

SELECT rental_date  AS DATE_RENTED,
       inventory_id AS 'ID OF INVENTORY',
       return_date
FROM   rental;

-- ARITHMETIC EXPRESSIONS
SELECT *
FROM   film;

SELECT replacement_cost,
       rental_rate,
       replacement_cost - rental_rate AS CostDiff
FROM   film;

SELECT title,
       length      AS 'MINUTES',
       length / 60 AS 'HOURS'
FROM   film;

-- FUNCTIONS - INTEGER OPERATIONS
SELECT *
FROM   payment;

-- AGGREGATE FUNCTION
SELECT amount
FROM   payment;

SELECT amount,
       Round(amount)
FROM   payment;

SELECT amount,
       Round(amount),
       Round(amount, 1),
       Round(amount, 2)
FROM   payment;

SELECT amount,
       Round(amount),
       Floor(amount)
FROM   payment;

SELECT Round(1234.1234);

SELECT Round(1234.5234);

SELECT Round(1234.5234, 0);

SELECT Round(1234.5234, 1);

SELECT Floor(1.2);

SELECT Floor(1.7);

SELECT Ceiling(1.2);

SELECT Ceiling(1.7) AS 'CEILING VALUE';

SELECT Round(1234.5734, 1);

SELECT Round(1234.5734, 2);

SELECT Round(1234.5754, 2);

SELECT Round(1234.5734, -1);

SELECT Round(1235.5734, -1);

SELECT Round(1235.5734, -3);

SELECT Round(1735.5734, -3);

SELECT Round(1735.5734, -30);

-- STRING OPERATIONS
SELECT 1 + 1 AS 'ADD';

SELECT '1' + '1' AS 'NO CONCATENATE';

SELECT 'A1' + '10' AS 'NO CONCATENATE';

SELECT Concat ('1', '1') AS 'CONCATENATE';

SELECT Concat (1, 1) AS 'CONCATENATE';

SELECT Concat ('A1', 10) AS 'CONCATENATE';

SELECT first_name,
       last_name
FROM   actor;

SELECT Concat(first_name, last_name) AS FullName
FROM   actor;

SELECT Concat(first_name, ' ', last_name) AS FullName
FROM   actor;

SELECT first_name,
       Length(first_name) AS FullName
FROM   actor;

SELECT first_name,
       last_name,
       LEFT(first_name, 1) AS Initial
FROM   actor;

SELECT Concat(LEFT(first_name, 1), ".", LEFT(last_name, 1)) AS INITIALS
FROM   actor;

SELECT first_name,
       last_name,
       LEFT(first_name, 1)                                  AS Initial,
       Concat(LEFT(first_name, 1), ".", LEFT(last_name, 1)) AS INITIALS
FROM   actor;

SELECT Concat(first_name, "", last_name)          AS Fullname,
       Reverse(Concat(first_name, "", last_name)) AS REVERSENAME
FROM   actor;

SELECT Concat(first_name, "", last_name)          AS Fullname,
       Reverse(Concat(first_name, "", last_name)) AS REVERSENAME
FROM   actor;

SELECT Concat(first_name, "", last_name)                              AS
       Fullname,
       REPLACE (Reverse(Concat(first_name, "", last_name)), 'S', '$') AS
       "REPLACED REVERSED FULL NAME"
FROM   actor;

-- SELECT @CONCATVAR;
SELECT @concatvar := Concat(first_name, "", last_name)
FROM   actor;

SELECT @concatvar := Concat(first_name, "", last_name)
FROM   actor
WHERE  actor_id = 100;

SELECT @reversevar := Reverse(@concatvar)
FROM   actor;

-- DATE OPERATIONS
SELECT LAST_UPDATE FROM ACTOR;
SELECT DATE_FORMAT(LAST_UPDATE,'%m/%d/%y') as LAST_UPDATED, LAST_UPDATE FROM ACTOR;

SELECT DATE_FORMAT(LAST_UPDATE, '%m-%d-%Y') AS LAST_UPDATED, LAST_UPDATE fROM ACTOR;

/* time with microseconds */
SELECT DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdated, LAST_UPDATE fROM ACTOR;

SELECT 	rental_date,
		DAYOFWEEK(rental_date) AS DayOfWeek,
		QUARTER(rental_date) AS Quarter,
		WEEK(rental_date) AS Week,
		MONTHNAME(rental_date) AS MonthName	
FROM sakila.rental;

-- USE DISTINCT OPERATORS
SELECT first_name
FROM sakila.actor
ORDER BY first_name;

SELECT DISTINCT first_name
FROM sakila.actor
ORDER BY first_name;

--TOTAL NUMBER OF ROWS
SELECT COUNT(*) FROM ACTOR;
SELECT COUNT(first_name)
FROM sakila.actor;
SELECT COUNT(DISTINCT first_name)
FROM sakila.actor;

SELECT * FROM ACTOR
WHERE FIRST_NAME LIKE 'PEN%';


--USING THE WHERE CLAUSE
-- WHERE clause Comparison Operators

-- Equal (=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id = 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name = 'Nick';

-- Less than (<)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id < 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name < 'Nick';

-- Greater than (>)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id > 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name > 'Nick';

-- Less than or Equal to (<=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <= 'Nick';

-- Greater than or Equal to (>=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id >= 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name >= 'Nick';

-- Not equal (<> or !=)
SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE actor_id <> 100;

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name != 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE first_name <> 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM sakila.actor
WHERE NOT first_name IN ('Nick');


--EXPLORE
--DISPLAY ONLY DUPLICATES
SELECT FIRST_NAME, COUNT(FIRST_NAME) FROM ACTOR
GROUP BY FIRST_NAME
HAVING COUNT(FIRST_NAME) > 1

SELECT FIRST_NAME FROM ACTOR
GROUP BY FIRST_NAME
HAVING COUNT(FIRST_NAME) > 1;

SELECT FIRST_NAME FROM ACTOR
WHERE FIRST_NAME IN 
(
SELECT FIRST_NAME FROM ACTOR
GROUP BY FIRST_NAME
HAVING COUNT(FIRST_NAME) > 1
)
ORDER BY FIRST_NAME DESC;
