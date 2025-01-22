
--LEFT & RIGHT
--How many of each domain extensions are there?
SELECT RIGHT(website, 3) AS domain, COUNT(*) num_companies
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

--What percent of company names start with a number and what percent start with a letter?
Select vowel_start, vowel_start/351.0 as result, non_vowel_start, non_vowel_start/351.0 as result2
FROM (
SELECT SUM(vowel) vowel_start, SUM(non_vowel) non_vowel_start
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                          THEN 1 ELSE 0 END AS vowel, 
            CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                          THEN 0 ELSE 1 END AS non_vowel
         FROM accounts) t1)



--How many company names start with a vowel and how many do not start with a vowel?
SELECT SUM(vowel) vowel_start, SUM(non_vowel) non_vowel_start
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                          THEN 1 ELSE 0 END AS vowel, 
            CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U') 
                          THEN 0 ELSE 1 END AS non_vowel
         FROM accounts) t1;




--POSITION,STRINGPOS & SUBSTR
-- Separate the names in primary_poc into a first and last names column 
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) first_name, 
   RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name
FROM accounts;

-- Separate the names in name in the sales_reps table by first and last name
SELECT LEFT(name, STRPOS(name, ' ') -1 ) first_name, 
          RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) last_name
FROM sales_reps;

--create an email address for each primary_poc. The email address should be the first name of the primary_poc . last name 
--primary_poc @ company name .com.
WITH t1 AS (
	SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - 	STRPOS(primary_poc, ' ')) last_name, name
    	FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com')
FROM t1;

--Remove spaces in between company names
WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
    FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', REPLACE(name, ' ', ''), '.com')
FROM  t1;




--CONCAT
--Create initial passwords for each email. The passwords will be the first letter of the primary_poc's first name (lowercase), then the last letter of their first name (lowercase), the first letter of their last name (lowercase), the last letter of their last name (lowercase), the number of letters in their first name, the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.


WITH t1 AS (
    SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,  RIGHT(primary_poc, LENGTH(primary_poc) - 	STRPOS(primary_poc, ' ')) last_name, name
    	FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'), LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) || RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) || REPLACE(UPPER(name), ' ', '')
FROM t1;



--DATES

--How many orders were made each year?
select date_trunc('year', occurred_at),
count(*)
FROM orders
group by 1;

--Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. 
select DATE_TRUNC('year', occurred_at), 
sum(total_amt_usd)
from orders
group by 1
order by 1

--Which month did Parch & Posey have the greatest sales in terms of total dollars?
select DATE_PART('month', occurred_at), 
sum(total_amt_usd)
from orders
group by 1
order by 2 DESC;

--Which year did Parch & Posey have the greatest sales in terms of total number of orders?
select DATE_TRUNC('year', occurred_at), 
count(*)
from orders
group by 1
order by 2 DESC;

--Which month did Parch & Posey have the greatest sales in terms of total number of orders?
select DATE_PART('month', occurred_at), 
count(*)
from orders
group by 1
order by 2 DESC;


-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
select date_trunc('month', occurred_at),
sum(gloss_amt_usd)
FROM (
select *
from accounts a
JOIN orders o
ON a.id=o.account_id)
WHERE name = 'Walmart'
group by 1
order by 2 DESC;
