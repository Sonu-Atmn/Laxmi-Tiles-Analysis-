create database master_db

--cusomers table scheme
CREATE TABLE customers (
    idx INT,
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    customer_type VARCHAR(50),
    segment VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    gst_number VARCHAR(20),
    registration_date DATE
);

--products table scheme 
CREATE TABLE products (
    product_id VARCHAR(10),
    product_name VARCHAR(150),
    category VARCHAR(50),
    sub_category VARCHAR(100),
    brand VARCHAR(50),
    material VARCHAR(50),
    size VARCHAR(30),
    finish VARCHAR(30),
    color VARCHAR(30),
    unit VARCHAR(20),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    stock_quantity INT,
    is_active VARCHAR(10)
);

--sales table scheme
CREATE TABLE sales (
    sales_id VARCHAR(10),
    order_id VARCHAR(10),
    order_date DATE,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct INT,
    discount_amount DECIMAL(10,2),
    net_amount DECIMAL(10,2),
    order_channel VARCHAR(30),
    payment_method VARCHAR(30),
    order_status VARCHAR(20)
);

SELECT COUNT(*) AS row_count
FROM customers;