-- Sales Summary View
CREATE VIEW vw_sales_summary AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_id,
    c.city AS customer_city,
    s.store_id,
    s.city AS store_city,
    p.amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN stores s
    ON o.store_id = s.store_id
JOIN payments p
    ON o.order_id = p.order_id;
    
    
-- Product Performance View
CREATE VIEW vw_product_performance AS
SELECT
    p.product_id,
    c.category_name,
    SUM(oi.qty) AS total_quantity,
    ROUND(SUM(oi.qty * oi.price),2) AS revenue
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    c.category_name;
    
    
-- Customer Performance View
CREATE VIEW vw_customer_performance AS
SELECT
    c.customer_id,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(pay.amount),2) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments pay
    ON o.order_id = pay.order_id
GROUP BY
    c.customer_id,
    c.city;
    
-- Store Performance View
CREATE VIEW vw_store_performance AS
SELECT
    s.store_id,
    s.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(pay.amount),2) AS revenue
FROM stores s
JOIN orders o
    ON s.store_id = o.store_id
JOIN payments pay
    ON o.order_id = pay.order_id
GROUP BY
    s.store_id,
    s.city;
    
-- Monthly Sales View
CREATE VIEW vw_monthly_sales AS
SELECT
    DATE_FORMAT(o.order_date,'%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(pay.amount),2) AS revenue
FROM orders o
JOIN payments pay
    ON o.order_id = pay.order_id
GROUP BY
    month;   
    
-- Verify the views
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
    
-- Preview them:
SELECT * FROM vw_sales_summary LIMIT 10;

SELECT * FROM vw_product_performance LIMIT 10;

SELECT * FROM vw_customer_performance LIMIT 10;

SELECT * FROM vw_store_performance LIMIT 10;

SELECT * FROM vw_monthly_sales LIMIT 10;




-- single view creation for tableau

USE retail_sales_analytics;

DROP VIEW IF EXISTS vw_dashboard_data;

CREATE VIEW vw_dashboard_data AS
SELECT
    -- Order Information
    o.order_id,
    o.order_date,
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    MONTHNAME(o.order_date) AS month_name,
    QUARTER(o.order_date) AS quarter,
    DAYNAME(o.order_date) AS weekday,

    -- Customer Information
    c.customer_id,
    c.city AS customer_city,
    c.signup_date,

    -- Store Information
    s.store_id,
    s.city AS store_city,

    -- Product Information
    p.product_id,
    p.category_id,
    cat.category_name,
    p.supplier_id,

    -- Order Item Information
    oi.order_item_id,
    oi.qty,
    oi.price AS selling_price,
    (oi.qty * oi.price) AS revenue,

    -- Payment Information
    pay.payment_id,
    pay.amount AS order_amount,

    -- Shipment Information
    sh.shipment_id,
    sh.status AS shipment_status

FROM orders o

INNER JOIN customers c
ON o.customer_id = c.customer_id

INNER JOIN stores s
ON o.store_id = s.store_id

INNER JOIN order_items oi
ON o.order_id = oi.order_id

INNER JOIN products p
ON oi.product_id = p.product_id

INNER JOIN categories cat
ON p.category_id = cat.category_id

INNER JOIN payments pay
ON o.order_id = pay.order_id

LEFT JOIN shipments sh
ON o.order_id = sh.order_id;

-- verify the view
SELECT *
FROM vw_dashboard_data
LIMIT 10;

-- check total rows    
SELECT COUNT(*) AS total_rows
FROM vw_dashboard_data;

-- check for null values
SELECT
    SUM(order_id IS NULL) AS order_id_nulls,
    SUM(customer_id IS NULL) AS customer_nulls,
    SUM(store_id IS NULL) AS store_nulls,
    SUM(product_id IS NULL) AS product_nulls,
    SUM(category_name IS NULL) AS category_nulls,
    SUM(supplier_id IS NULL) AS supplier_nulls,
    SUM(revenue IS NULL) AS revenue_nulls,
    SUM(order_amount IS NULL) AS payment_nulls,
    SUM(shipment_status IS NULL) AS shipment_nulls
FROM vw_dashboard_data;



-- exporting single dashboard content to csv
SELECT *
FROM vw_dashboard_data;