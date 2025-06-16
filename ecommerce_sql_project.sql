                                                               (# 🔟 SQL Practice Queries from Basic ➝ Advanced)
-- List all customers and their total number of orders.
                                                           
SELECT C.NAME, COUNT(O.ORDER_ID) AS TOTAL_NO_OF_ORDERS FROM CUSTOMERS C 
    JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
    GROUP BY C.CUSTOMER_ID, C.NAME

-- Show all orders with product names and order status.
                                                           
SELECT o.order_id, c.name AS customer, p.product_name, o.status FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id 
    JOIN products p ON o.product_id = p.product_id;

-- List customers who have placed more than 1 order.
    
SELECT c.name, COUNT(o.order_id) AS total_orders FROM customers c 
    JOIN orders o ON c.customer_id = o.customer_id 
    GROUP BY c.name HAVING COUNT(o.order_id) > 1;

-- Find the total revenue generated (only from delivered orders)
    
SELECT SUM(s.amount) AS total_revenue, O.STATUS FROM payments s 
    JOIN orders o ON s.order_id = o.order_id  WHERE o.status = 'Delivered';

-- Show each product and how many times it was ordered.
    
SELECT P.PRODUCT_NAME, COUNT(O.ORDER_ID) AS TIMES_ORDERS FROM PRODUCTS P
    LEFT JOIN ORDERS O ON P.PRODUCT_ID = O.PRODUCT_ID GROUP BY PRODUCT_NAME 

-- List the top 2 highest-paying customers (by total amount spent).
    
SELECT C.NAME, SUM(P.AMOUNT) AS tOTAL_SPEND FROM CUSTOMERS C 
    JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
    JOIN PAYMENTS P ON O.ORDER_ID = P.ORDER_ID GROUP BY C.NAME
 ORDER BY TOTAL_SPEND DESC LIMIT 2
 
-- Show the running total of revenue (by payment date).
    
SELECT PAYMENT_DATE, AMOUNT, SUM(AMOUNT) OVER (ORDER BY PAYMENT_DATE) AS RUNNING_TOTAL FROM PAYMENTS 

-- Find customers who have never made a payment
SELECT c.name, O.STATUS FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id WHERE p.payment_id IS NULL;

-- Rank customers by total amount spent (include ties).
    
select name, total_spent,
rank() over (order by total_spent desc) from (select c.name, sum(p.amount) as total_spent
from customers c join orders o on c.customer_id = o.customer_id 
    join payments p on o.order_id = p.order_id group by c.name) as spending
 
-- Find products that have been ordered but never delivered.
    
SELECT DISTINCT p.product_name, O.STATUS FROM products p
    JOIN orders o ON p.product_id = o.product_id
 WHERE p.product_id NOT IN (
    SELECT product_id FROM orders 
    WHERE status = 'delivered')
 ===================================================================================================================================================================================================================================







