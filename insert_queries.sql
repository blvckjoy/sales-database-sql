INSERT INTO customers
VALUES
    ('C001', ' Alice Smith', 'New York'),
    ('C002', 'Bob Johnson', 'Los Angeles'),
    ('C003', 'Carol Lee', 'Chicago'),
    ('C004', 'David Kim', 'San Francisco')

INSERT INTO products
VALUES
    ('P01', 'Apple', 0.50),
    ('P02', 'Banana', 0.30),
    ('P03', 'Orange', 0.60),
    ('P04', 'Pear', 0.70)

INSERT INTO orders
VALUES
    ('1001', '2024-06-01', 'C001', 'P01', 10),
    ('1002', '2024-06-02', 'C002', 'P02', 5),
    ('1003', '2024-06-03', 'C003', 'P01', 7),
    ('1004', '2024-06-04', 'C001', 'P03' , 8),
    ('1005', '2024-06-05', 'C004', 'P02', 12),
    ('1006', '2024-06-05', 'C003', 'P04', 6),
    ('1007', '2024-06-06', 'C002', 'P01', 15)

UPDATE customers SET customer_name = 'Alice Smith'
WHERE customer_id = 'C001';