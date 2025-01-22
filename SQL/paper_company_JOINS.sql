# 1.Return the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

select r.name as region_name, sr.name as sales_rep_name, a.name as account_name
from region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id=a.sales_rep_id
WHERE r.name = 'Midwest'
ORDER BY account_name ASC

# 2. Provide the same table as above but this time only for accounts where the sales rep has a first name starting with S and in the Midwest region.

select r.name as region_name, sr.name as sales_rep_name, a.name as account_name
from region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id=a.sales_rep_id
WHERE r.name = 'Midwest' AND sr.name LiKE 'S%'
ORDER BY account_name ASC

#3. Provide the same table as above but this time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 

select r.name as region_name, sr.name as sales_rep_name, a.name as account_name
from region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id=a.sales_rep_id
WHERE r.name = 'Midwest' AND sr.name LiKE '% K%'
ORDER BY account_name ASC

#4.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).


select r.name as region_name, a.name as account_name, o.total_amt_usd/(o.total+0.01) as unit_price
from region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id=a.sales_rep_id
JOIN orders o
ON o.account_id=a.id
WHERE o.standard_qty >100


#5.Same as previous question but this time you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Sort for the smallest unit price first.


select r.name as region_name, a.name as account_name, o.total as total_qty, o.poster_qty, o.total_amt_usd/(o.total+0.01) as unit_price
from region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id=a.sales_rep_id
JOIN orders o
ON o.account_id=a.id
WHERE o.standard_qty>100 AND poster_qty >50
ORDER BY unit_price ASC

#6. Same as previous question but this time dort for the largest unit price first.


select r.name as region_name, a.name as account_name, o.total as total_qty, o.poster_qty, o.total_amt_usd/(o.total+0.01) as unit_price
from region r
JOIN sales_reps sr
ON r.id = sr.region_id
JOIN accounts a
ON sr.id=a.sales_rep_id
JOIN orders o
ON o.account_id=a.id
WHERE o.standard_qty>100 AND poster_qty >50
ORDER BY unit_price DESC;

#7.What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.

select distinct a.name as account_name, we.channel 
from accounts a
JOIN web_events we
ON a.id = we.account_id
WHERE we.account_id = 1001;

#8.Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON a.id =o.account_id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at ASC;
