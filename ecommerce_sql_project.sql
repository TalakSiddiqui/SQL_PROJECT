CREATE DATABASE SQLPROJECT

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    registered_date DATE
);

INSERT INTO customers (customer_id, name, email, country, registered_date) VALUES
(1, 'Alice', 'alice@example.com', 'USA', '2021-01-10'),
(2, 'Bob', 'bob@example.com', 'Canada', '2021-03-15'),
(3, 'Charlie', 'charlie@example.com', 'USA', '2021-06-20'),
(4, 'Diana', 'diana@example.com', 'UK', '2021-09-01'),
(5, 'Evan', 'evan@example.com', 'Germany', '2022-01-05');

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Headphones', 'Electronics', 150.00),
(103, 'Smartphone', 'Electronics', 800.00),
(104, 'Monitor', 'Electronics', 300.00),
(105, 'Keyboard', 'Accessories', 100.00);

-- Create orders table--
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, status) VALUES
(1001, 1, 101, '2022-02-10', 1, 'Delivered'),
(1002, 2, 102, '2022-03-12', 2, 'Delivered'),
(1003, 3, 103, '2022-03-15', 1, 'Cancelled'),
(1004, 1, 104, '2022-04-10', 1, 'Delivered'),
(1005, 4, 105, '2022-04-12', 3, 'Returned'),
(1006, 5, 101, '2022-05-01', 1, 'Delivered');

-- Create payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_type VARCHAR(50),
    amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (payment_id, order_id, payment_type, amount, payment_date) VALUES
(501, 1001, 'Credit Card', 1200.00, '2022-02-10'),
(502, 1002, 'PayPal', 300.00, '2022-03-12'),
(503, 1004, 'Credit Card', 300.00, '2022-04-10'),
(504, 1005, 'Debit Card', 300.00, '2022-04-12'),
(505, 1006, 'Net Banking', 1200.00, '2022-05-01');

                                                       (# 🔟 SQL Practice Queries from Basic ➝ Advanced)
SELECT * FROM sqlproject.customers;
1. List all customers and their total number of orders.
SELECT C.NAME, COUNT(O.ORDER_ID) AS TOTAL_NO_OF_ORDERS FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID GROUP BY C.CUSTOMER_ID, C.NAME

2) Show all orders with product names and order status.
SELECT o.order_id, c.name AS customer, p.product_name, o.status FROM orders o JOIN customers c ON o.customer_id = c.customer_id JOIN products p ON o.product_id = p.product_id;

3) List customers who have placed more than 1 order.”
SELECT c.name, COUNT(o.order_id) AS total_orders FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.name HAVING COUNT(o.order_id) > 1;

4) Find the total revenue generated (only from delivered orders)
SELECT SUM(s.amount) AS total_revenue, O.STATUS FROM payments s JOIN orders o ON s.order_id = o.order_id  WHERE o.status = 'Delivered';

5) Show each product and how many times it was ordered.
SELECT P.PRODUCT_NAME, COUNT(O.ORDER_ID) AS TIMES_ORDERS FROM PRODUCTS P LEFT JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID GROUP BY PRODUCT_NAME 

6) List the top 2 highest-paying customers (by total amount spent).
SELECT C.NAME, SUM(P.AMOUNT) AS tOTAL_SPEND FROM CUSTOMERS C JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID GROUP BY C.NAME
 ORDER BY TOTAL_SPEND DESC LIMIT 2
 
7) Show the running total of revenue (by payment date).
SELECT PAYMENT_DATE, AMOUNT, SUM(AMOUNT) OVER (ORDER BY PAYMENT_DATE) AS RUNNING_TOTAL FROM PAYMENTS 

8) Find customers who have never made a payment
SELECT c.name, O.STATUS FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id WHERE p.payment_id IS NULL;

9) Rank customers by total amount spent (include ties).
select name, total_spent,
rank() over (order by total_spent desc) from (select c.name, sum(p.amount) as total_spent
from customers c join orders o on c.customer_id = o.customer_id join payments p on o.order_id = p.order_id group by c.name) as spending
 
10) Find products that have been ordered but never delivered.
select distinct p.product_name from products p join orders o on p.product_id = o.product_id  where o.status <> 'RETURNED'

SELECT DISTINCT p.product_name, O.STATUS FROM products p JOIN orders o ON p.product_id = o.product_id
 WHERE p.product_id NOT IN (SELECT product_id FROM orders WHERE status = 'CANCELLED')
 ======================================================================================================================================================================================







