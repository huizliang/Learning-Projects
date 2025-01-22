--1.Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales

--first CTE to sum total_amt_usd for each sales rep
WITH t1 AS (
SELECT s.name as srep_name, r.id as region_id, sum(o.total_amt_usd) as total_rep_sales
from region r
join sales_reps s
ON r.id = s.region_id
join accounts a
ON a.sales_rep_id = s.id
join orders o
ON o.account_id = a.id
GROUP BY s.name, r.id),

--2nd CTE to rank sales reps by their total_sales_amt
t2 AS(
SELECT srep_name, region_id, total_rep_sales, ROW_NUMBER()OVER(PARTITION BY region_id ORDER BY total_rep_sales DESC) AS sales_rank
FROM t1)

--JOIN both CTEs to filter the sales rep that is ranked 1st in total sales amt in each region
SELECT t2.srep_name, t2.region_id, t2.total_rep_sales, sales_rank
FROM t1
JOIN t2
ON t1.srep_name = t2.srep_name
GROUP BY t2.srep_name, t2.region_id, t2.total_rep_sales, sales_rank
HAVING sales_rank =1




--2.For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?
--CTE not neccessary

SELECT sum(o.total_amt_usd) as total_sale, r.name as region_name, count(o.total) as total_count_order
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 2
ORDER BY total_sale DESC
LIMIT 1;




--3.How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?

WITH t1 AS(
  SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total_qty
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1),

t2 AS (
      SELECT a.name act_name, SUM(o.total) total_qty
      FROM orders o
      JOIN accounts a
      ON a.id = o.account_id
      GROUP BY 1
      HAVING SUM(o.total) > (SELECT total_qty FROM t1))
  
SELECT COUNT(*)
FROM t2;

--4.For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?

WITH t1 AS (
SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                              FROM orders o
                              JOIN accounts a
                              ON a.id = o.account_id
                              GROUP BY a.id, a.name
                              ORDER BY 3 DESC
                              LIMIT 1)
SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id FROM t1)
GROUP BY 1, 2
ORDER BY 3 DESC;



--5. What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
WITH total_spent_CTE AS(
  SELECT a.name, sum(o.total_amt_usd) as total_spent
	FROM orders o
	JOIN accounts a
	ON a.id=o.account_id
	GROUP BY a.name
	ORDER BY 2 DESC
	LIMIT 10)

SELECT avg(total_spent) as avg_lifetime_amt
FROM total_spent_CTE


--6.What is the lifetime average amount spent in terms of **total_amt_usd**, including only the companies that spent more per order, on average, than the average of all orders.

WITH t1 AS(
  SELECT a.name, a.id, avg(o.total_amt_usd) as avg_order
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name, a.id
HAVING avg(o.total_amt_usd) > 
           (SELECT avg(total_amt_usd) as avg_all_orders
FROM orders))

SELECT avg(avg_order)
FROM t1


