-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    city VARCHAR(100),
    signup_date DATE
);

-- Stores
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    city VARCHAR(100)
);

-- Categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    order_date DATE,
    promotion_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- Order Items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    qty INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Shipments
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);