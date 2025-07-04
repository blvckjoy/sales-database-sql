--CREATE THE SCHEMAS

DROP TABLE IF EXISTS customers
GO
DROP TABLE IF EXISTS products
GO
DROP TABLE IF EXISTS orders
GO

CREATE TABLE products
(
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(20),
    unit_price FLOAT
)

CREATE TABLE customers
(
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
)

CREATE TABLE orders
(
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
)