-- Verify row counts

SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'stores', COUNT(*) FROM stores
UNION ALL
SELECT 'categories', COUNT(*) FROM categories
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'shipments', COUNT(*) FROM shipments;


-- Check duplicate Primary Keys
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT store_id, COUNT(*)
FROM stores
GROUP BY store_id
HAVING COUNT(*) > 1;

SELECT category_id, COUNT(*)
FROM categories
GROUP BY category_id
HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT order_item_id, COUNT(*)
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;

SELECT payment_id, COUNT(*)
FROM payments
GROUP BY payment_id
HAVING COUNT(*) > 1;

SELECT shipment_id, COUNT(*)
FROM shipments
GROUP BY shipment_id
HAVING COUNT(*) > 1;

-- Check Missing Values

SELECT
COUNT(*) AS total_rows,
COUNT(customer_id) customer_id,
COUNT(city) city,
COUNT(signup_date) signup_date
FROM customers;

SELECT
COUNT(*) total_rows,
COUNT(store_id) store_id,
COUNT(city) city
FROM stores;

SELECT
COUNT(*) total_rows,
COUNT(category_id) category_id,
COUNT(category_name) category_name
FROM categories;

SELECT
COUNT(*) total_rows,
COUNT(product_id) product_id,
COUNT(category_id) category_id,
COUNT(supplier_id) supplier_id,
COUNT(price) price
FROM products;

SELECT
COUNT(*) total_rows,
COUNT(order_id) order_id,
COUNT(customer_id) customer_id,
COUNT(store_id) store_id,
COUNT(order_date) order_date,
COUNT(promotion_id) promotion_id
FROM orders;

SELECT
COUNT(*) total_rows,
COUNT(order_item_id) order_item_id,
COUNT(order_id) order_id,
COUNT(product_id) product_id,
COUNT(qty) qty,
COUNT(price) price
FROM order_items;

SELECT
COUNT(*) total_rows,
COUNT(payment_id) payment_id,
COUNT(order_id) order_id,
COUNT(amount) amount
FROM payments;

SELECT
COUNT(*) total_rows,
COUNT(shipment_id) shipment_id,
COUNT(order_id) order_id,
COUNT(status) status
FROM shipments;

-- Foreign Key Validation

SELECT COUNT(*) AS orphan_orders
FROM orders o
LEFT JOIN customers c
ON o.customer_id=c.customer_id
WHERE c.customer_id IS NULL;

SELECT COUNT(*) AS orphan_products
FROM products p
LEFT JOIN categories c
ON p.category_id=c.category_id
WHERE c.category_id IS NULL;

SELECT COUNT(*) AS orphan_order_items
FROM order_items oi
LEFT JOIN orders o
ON oi.order_id=o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS orphan_products
FROM order_items oi
LEFT JOIN products p
ON oi.product_id=p.product_id
WHERE p.product_id IS NULL;

SELECT COUNT(*) AS orphan_payments
FROM payments p
LEFT JOIN orders o
ON p.order_id=o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS orphan_shipments
FROM shipments s
LEFT JOIN orders o
ON s.order_id=o.order_id
WHERE o.order_id IS NULL;


-- Invalid Values

SELECT *
FROM products
WHERE price<0;

SELECT *
FROM order_items
WHERE price<0;

SELECT *
FROM order_items
WHERE qty<=0;

SELECT *
FROM payments
WHERE amount<=0;

-- Date Validation

SELECT *
FROM customers
WHERE signup_date>CURDATE();

SELECT *
FROM orders
WHERE order_date>CURDATE();

-- Text Cleaning Check

SELECT *
FROM customers
WHERE city<>TRIM(city);

SELECT *
FROM stores
WHERE city<>TRIM(city);

SELECT *
FROM categories
WHERE category_name<>TRIM(category_name);

-- till now no data was found impure


