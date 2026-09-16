USE master_db;
GO

-- ==========================================
-- PRIMARY KEYS
-- ==========================================

ALTER TABLE customers
ALTER COLUMN customer_id VARCHAR(10) NOT NULL;

ALTER TABLE products
ALTER COLUMN product_id VARCHAR(10) NOT NULL;

ALTER TABLE sales
ALTER COLUMN sales_id VARCHAR(10) NOT NULL;


ALTER TABLE customers
ADD CONSTRAINT PK_customers
PRIMARY KEY (customer_id);

ALTER TABLE products
ADD CONSTRAINT PK_products
PRIMARY KEY (product_id);

ALTER TABLE sales
ADD CONSTRAINT PK_sales
PRIMARY KEY (sales_id);


-- ==========================================
-- FOREIGN KEYS
-- ==========================================

ALTER TABLE sales
ADD CONSTRAINT FK_sales_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE sales
ADD CONSTRAINT FK_sales_products
FOREIGN KEY (product_id)
REFERENCES products(product_id);

GO