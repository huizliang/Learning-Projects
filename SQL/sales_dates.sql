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
