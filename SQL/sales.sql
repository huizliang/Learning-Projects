select *
from prework.sales
limit 10;

--Warm up 1
--1.What is the earliest year of purchase?
SELECT min(year) as minyear
from prework.sales;

--2.What is the average customer age per year? Order the years in ascending order.
SELECT avg(Customer_Age) as avg_age, year
FROM prework.sales
GROUP BY 2
ORDER BY 2 ASC;

--3.Return all clothing purchases from September 2015 where the cost was at least $70.
SELECT *
FROM prework.sales
WHERE year = 2015 AND month = 'September'AND cost >= 70;

--4.What are all the different types of product categories that were sold from 2014 to 2016 in France?
SELECT distinct product_category, year
FROM prework.sales
WHERE year BETWEEN 2014 AND 2016 AND country = 'France';

--5.Within each product category and age group (combined), what is the average order quantity and total profit?
SELECT Age_Group, Product_Category, avg(order_quantity) as avg_order_qty, sum(profit) as total_profit
FROM prework.sales
GROUP BY 1,2;

--Warm up 2
--1.Which product category has the highest number of orders among 31-year olds? Return only the top product category.
SELECT sum(Order_quantity) as highest_order, Product_Category, Customer_Age
FROM prework.sales
GROUP BY Product_Category, customer_age
HAVING Customer_Age = 31
ORDER BY highest_order DESC;

--2.Of female customers in the U.S. who purchased bike-related products in 2015, what was the average revenue?
select distinct Product_Category
from prework.sales
limit 10;

select distinct country
from prework.sales
limit 10;

SELECT avg(revenue) as avg_revenue
FROM prework.sales
WHERE customer_gender = 'F' AND year = 2015 AND product_category = 'Bikes' AND Country = 'United States';;

-- 3.Categorize all purchases into bike vs. non-bike related purchases. How many purchases were there in each group among male customers in 2016?
SELECT 
  CASE WHEN product_category = 'Bikes' THEN 'bike-related purchases'
  ELSE 'non-bike related purchase' END AS purchase_category,
count(*) as bike_purchase_count
FROM prework.sales
WHERE Customer_gender = 'M' AND year = 2016
GROUP BY purchase_category;

--4.Among people who purchased socks or caps (use sub_category), what was the average profit earned per country per year, ordered by highest average profit to lowest average profit?
SELECT distinct Sub_Category
FROM prework.sales;

SELECT country, year, avg(profit) as avg_profit
FROM prework.sales
WHERE Sub_Category IN ('Caps', 'Socks')
GROUP BY 1,2
ORDER BY 3 DESC;

--5.For male customers who purchased the AWC Logo Cap (use product), use a window function to order the purchase dates from oldest to most recent within each gender.
SELECT ROW_NUMBER()OVER(PARTITION BY customer_gender ORDER BY date ASC) AS purchase_date_rank,date, customer_gender
FROM prework.sales
WHERE product = 'AWC Logo Cap' AND Customer_Gender = 'M';
