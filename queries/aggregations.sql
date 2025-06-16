customers Table
INSERT INTO customers (customer_id, name, email, country, registered_date) VALUES
(1, 'Alice', 'alice@example.com', 'USA', '2021-01-10'),
(2, 'Bob', 'bob@example.com', 'Canada', '2021-03-15'),
(3, 'Charlie', 'charlie@example.com', 'USA', '2021-06-20'),
(4, 'Diana', 'diana@example.com', 'UK', '2021-09-01'),
(5, 'Evan', 'evan@example.com', 'Germany', '2022-01-05');

🟨 products Table
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Headphones', 'Electronics', 150.00),
(103, 'Smartphone', 'Electronics', 800.00),
(104, 'Monitor', 'Electronics', 300.00),
(105, 'Keyboard', 'Accessories', 100.00);

🟦 orders Table
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, status) VALUES
(1001, 1, 101, '2022-02-10', 1, 'Delivered'),
(1002, 2, 102, '2022-03-12', 2, 'Delivered'),
(1003, 3, 103, '2022-03-15', 1, 'Cancelled'),
(1004, 1, 104, '2022-04-10', 1, 'Delivered'),
(1005, 4, 105, '2022-04-12', 3, 'Returned'),
(1006, 5, 101, '2022-05-01', 1, 'Delivered');

🟥 payments Table
INSERT INTO payments (payment_id, order_id, payment_type, amount, payment_date) VALUES
(501, 1001, 'Credit Card', 1200.00, '2022-02-10'),
(502, 1002, 'PayPal', 300.00, '2022-03-12'),
(503, 1004, 'Credit Card', 300.00, '2022-04-10'),
(504, 1005, 'Debit Card', 300.00, '2022-04-12'),
(505, 1006, 'Net Banking', 1200.00, '2022-05-01');
