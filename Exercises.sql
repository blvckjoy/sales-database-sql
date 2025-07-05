-- List all customers and their cities.
SELECT
    customer_id,
    customer_name
    city
FROM customers;

-- Show all products and their unit prices.
SELECT
    product_id,
    product_name,
    unit_price
FROM products;

-- Display all orders with their order dates and quantities.
SELECT
    order_id,
    order_date,
    quantity
FROM orders;

-- Find all orders placed after June 3, 2024.
SELECT *
FROM orders
WHERE order_date > '2024-06-03';

-- List the names of customers who have placed at least one order.
SELECT
    DISTINCT cus.customer_name
FROM customers cus
    JOIN orders ord
    ON cus.customer_id = ord.customer_id;

-- Show each order with the customer’s name and the product ordered.
SELECT
    customer_name,
    order_id,
    product_name
FROM customers AS cus
    JOIN orders AS ord
    ON cus.customer_id = ord.customer_id
    JOIN products pro
    ON ord.product_id = pro.product_id

-- Display the total quantity ordered for each product.
SELECT
    product_name,
    SUM(quantity) AS total_quantity
FROM products pro
    JOIN orders ord
    ON pro.product_id = ord.product_id
GROUP BY product_name;

-- Find the total amount spent by each customer (hint: use quantity × unit price).
SELECT cus.customer_name, SUM((ord.quantity * pro.unit_price)) AS total_spent
FROM customers cus
    JOIN orders ord
    ON cus.customer_id = ord.customer_id
    JOIN products pro
    ON ord.product_id = pro.product_id
GROUP BY cus.customer_name;

-- List customers who have ordered ‘Apple’.
SELECT customer_name, product_name
FROM customers cus
    JOIN orders ord
    ON ord.customer_id = cus.customer_id
    JOIN products pro
    ON pro.product_id = ord.product_id
WHERE product_name = 'Apple'
ORDER BY 1;

-- Show the number of orders placed by each customer.
SELECT
    cus.customer_name,
    COUNT(ord.order_id) AS num_of_orders
FROM customers cus
    JOIN orders ord
    ON cus.customer_id = ord.customer_id
GROUP BY cus.customer_name;

-- Find the product with the highest total sales (quantity × unit price).
SELECT
    product_name,
    SUM(ord.quantity * pro.unit_price) AS total_sales
FROM products pro
    JOIN orders ord
    ON pro.product_id = ord.product_id
GROUP BY product_name
ORDER BY SUM(ord.quantity * pro.unit_price) DESC;

-- List customers who have not placed any orders.
SELECT
    customer_name
FROM customers cus
    LEFT JOIN orders ord
    ON cus.customer_id = ord.customer_id
WHERE ord.order_id IS NULL;

-- Display the most popular product (the one ordered the most times).
SELECT TOP 1
    pro.product_name,
    SUM(ord.quantity) AS total_ordered
FROM products pro
    JOIN orders ord
    ON pro.product_id = ord.product_id
GROUP BY pro.product_name
ORDER BY 2 DESC;

-- For each city, show the total number of orders made by customers from that city.
SELECT cus.city, SUM(ord.quantity) AS total_ordered
FROM customers cus
    JOIN orders ord
    ON cus.customer_id = ord.customer_id
GROUP BY cus.city;

--Using PARTITION BY
SELECT
    DISTINCT cus.city,
    SUM(ord.quantity) OVER (PARTITION BY cus.city) AS total_ordered
FROM customers cus
    JOIN orders ord
    ON cus.customer_id = ord.customer_id

-- List all orders where more than 10 units were ordered.
SELECT order_id, SUM(quantity) AS total_orders
FROM orders
GROUP BY order_id
HAVING SUM(quantity) > 10;