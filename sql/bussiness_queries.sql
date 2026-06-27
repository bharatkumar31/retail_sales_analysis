-- Section 1: Business KPIs
-- Total Revenue
SELECT ROUND(SUM(amount), 2) AS total_revenue
FROM payments;

--  Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- Average Order Value
SELECT ROUND(AVG(amount),2) AS average_order_value
FROM payments;


-- Section 2: Sales Analysis
-- Monthly Revenue Trend
SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS month,
ROUND(SUM(p.amount),2) AS revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY month
ORDER BY month;


-- Monthly Order Count
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month, 
COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- Daily Sales
SELECT order_date,
SUM(amount) AS revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY order_date
ORDER BY order_date;


-- Section 3: Customer Analysis
-- Top 10 Customers by Revenue
SELECT c.customer_id, 
SUM(p.amount) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY c.customer_id
ORDER BY revenue DESC
LIMIT 10;

-- Customers with Most Orders
SELECT customer_id,
COUNT(*) total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;


-- Average Spending Per Customer
SELECT ROUND(AVG(customer_revenue),2) average_customer_spending
FROM
(
SELECT
customer_id,
SUM(amount) customer_revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY customer_id
)t;

-- Section 4: Product Analysis
-- Top Selling Products
SELECT
    product_id,
    SUM(qty) total_quantity
FROM order_items
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 10;

-- Highest Revenue Products
SELECT
    product_id,
    ROUND(SUM(price*qty),2) revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

-- Category-wise Revenue
SELECT
    c.category_name,
    ROUND(SUM(oi.price*oi.qty),2) revenue
FROM order_items oi
JOIN products p
ON oi.product_id=p.product_id
JOIN categories c
ON p.category_id=c.category_id
GROUP BY c.category_name
ORDER BY revenue DESC;

-- Section 5: Store Analysis
-- Best Performing Stores
SELECT
    store_id,
    SUM(amount) revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY store_id
ORDER BY revenue DESC;

-- Orders Per Store
SELECT
store_id,
COUNT(*) orders
FROM orders
GROUP BY store_id
ORDER BY orders DESC;

-- Section 6: Shipping Analysis
-- Shipment Status Distribution
SELECT
status,
COUNT(*) total_shipments
FROM shipments
GROUP BY status;


-- Section 7: Window Functions 
-- Rank Customers by Revenue
SELECT
customer_id,
SUM(amount) revenue,
RANK() OVER(ORDER BY SUM(amount) DESC) customer_rank
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY customer_id;

-- Dense Rank Products
SELECT
product_id,
SUM(qty) quantity,
DENSE_RANK() OVER(ORDER BY SUM(qty) DESC) product_rank
FROM order_items
GROUP BY product_id;

-- Section 8: CTE ⭐
-- Top 5 Revenue Customers
WITH customer_sales AS
(
SELECT
customer_id,
SUM(amount) revenue
FROM orders o
JOIN payments p
ON o.order_id=p.order_id
GROUP BY customer_id
)

SELECT *
FROM customer_sales
ORDER BY revenue DESC
LIMIT 5;