-- Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales

SELECT name, region_id, total_rep_sale, top_rep_sale
FROM
(SELECT total_rep_sale, region_id, name, ROW_NUMBER()OVER(PARTITION BY region_id ORDER BY total_rep_sale DESC) AS top_rep_sale
FROM
(SELECT name, region_id, sum(total_amt_usd) as total_rep_sale
FROM (
SELECT s.id as sales_rep_idd, s.name, r.id as region_id, a.id as accounts_id1, o.total_amt_usd
from region r
inner join sales_reps s
ON r.id = s.region_id
inner join accounts a
ON a.sales_rep_id = s.id
inner join orders o
ON o.account_id = a.id) sub
GROUP BY name, region_id) sub2) sub3
WHERE top_rep_sale =1



--For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?

SELECT sum(total_amt_usd) as total_sale, region_name, count(total) as total_sale_count
FROM
(SELECT o.total_amt_usd, r.name as region_name, o.total
from region r
inner join sales_reps s
ON r.id = s.region_id
inner join accounts a
ON a.sales_rep_id = s.id
inner join orders o
ON o.account_id = a.id) sub
GROUP BY region_name
ORDER BY sum(total_amt_usd) DESC;



--How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?

SELECT a.name
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY name
HAVING SUM(o.total) > (SELECT total 
                      FROM (SELECT a.name act_name, SUM(o.standard_qty) tot_std, SUM(o.total) total
                            FROM accounts a
                            JOIN orders o
                            ON o.account_id = a.id
                            GROUP BY 1
                            ORDER BY 2 DESC
                            LIMIT 1) sub);




-- For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?

SELECT a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id AND a.id =  (SELECT id
                        FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) tot_spent
                              FROM orders o
                              JOIN accounts a
                              ON a.id = o.account_id
                              GROUP BY a.id, a.name
                              ORDER BY 3 DESC
                              LIMIT 1) inner_table)
GROUP BY 1, 2
ORDER BY 3 DESC;




--What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?

SELECT avg(total_spent) as avg_lifetime_amt
FROM(
SELECT a.name, sum(o.total_amt_usd) as total_spent
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name
ORDER BY 2 DESC
LIMIT 10)



--What is the lifetime average amount spent in terms of **total_amt_usd**, including only the companies that spent more per order, on average, than the average of all orders.

SELECT avg(avg_company_order)
FROM(
SELECT a.name, avg(total_amt_usd) as avg_company_order
FROM orders o
JOIN accounts a
ON a.id=o.account_id
GROUP BY a.name
HAVING avg(total_amt_usd) > 
(SELECT avg(total_amt_usd) as avg_all_orders
FROM orders)
  )
