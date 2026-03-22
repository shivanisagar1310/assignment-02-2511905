USE retail_store;

-- Q1: List all customers from Mumbai along with their total order value

SELECT 
 cus.customer_name,
 cus.customer_city,
 SUM(ord.quantity * prd.unit_price) AS order_val
FROM customers AS cus
JOIN orders AS ord
ON cus.customer_id = ord.customer_id 
JOIN products AS prd 
ON ord.product_id = prd.product_id
WHERE cus.customer_city = 'Mumbai'
GROUP BY cus.customer_name, cus.customer_city;

-- Q2: Find the top 3 products by total quantity sold

SELECT prd.product_name, SUM(ord.quantity) as top_three_sold
from orders AS ord
JOIN products AS prd  
	ON ord.product_id = prd.product_id 
GROUP BY prd.product_name
ORDER BY top_three_sold DESC limit 3;

-- Q3: List all sales representatives and the number of unique customers they have handled

select 
reps.sales_rep_name, 
reps.sales_rep_email,
count(DISTINCT ord.customer_id) AS unique_customers
from orders as ord
JOIN sales_reps as reps on ord.sales_rep_id = reps.sales_rep_id
JOIN customers as cus on ord.customer_id = cus.customer_id
GROUP  by reps.sales_rep_name, reps.sales_rep_email

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending

SELECT 
ord.order_id,
cus.customer_name,
prd.product_name,
ord.quantity,
(ord.quantity * prd.unit_price) AS order_value,
ord.order_date
FROM orders AS ord
JOIN customers AS cus ON ord.customer_id = cus.customer_id
JOIN products AS prd ON ord.product_id = prd.product_id
WHERE (ord.quantity * prd.unit_price) > 10000
ORDER BY order_value DESC;


-- Q5: Identify any products that have never been ordered

SELECT 
 prd.product_id,
 prd.product_name,
 prd.category,
 prd.unit_price
FROM products AS prd
LEFT JOIN orders AS ord 
  ON prd.product_id = ord.product_id
WHERE ord.product_id IS NULL;
