LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/categories.csv'
INTO TABLE categories
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(category_id, category_name);


LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/stores.csv'
INTO TABLE stores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(store_id, city);


LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, city, signup_date);

LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, category_id, supplier_id, price);

LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, store_id, order_date, promotion_id);

LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(payment_id, order_id, amount);

LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/shipments.csv'
INTO TABLE shipments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(shipment_id, order_id, status);

LOAD DATA LOCAL INFILE '/Users/nares/Downloads/retail_sales_analytics/data/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_item_id, order_id, product_id, qty, price);