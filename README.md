# 🛒 E-Commerce SQL Project

## 📊 Project Overview
This project analyzes sales, customers, orders, and payments using SQL from a fictional e-commerce company. It answers real business questions using JOINs, aggregations, subqueries, and window functions.

# 🗂️ Dataset Structure
- `customers`: Basic customer info
- `products`: Product name, category, price
- `orders`: Order details with product/customer
- `payments`: Payment amount and type

# ✅ Business Questions Answered
- Which customer placed the most orders?
- What are the top-selling products?
- How much revenue was generated from delivered orders?
- Which customers never made a payment?
- What’s the total revenue over time?
- Rank customers by total spending

# 🧠 Skills Used
- SQL Joins
- GROUP BY and Aggregations
- Subqueries
- Window Functions (`RANK()`, `SUM() OVER`)
- Filtering and Conditions

# 📁 Folder Structure

✅ Key Learnings

Writing advanced SQL queries using JOIN, GROUP BY, ORDER BY, LIMIT
Applying business logic in analysis (like customer behavior or product trends)
Structuring a relational database
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# 🧑‍💼 HR Analytics SQL Project

## 📊 Project Overview

This SQL project analyzes employee, salary, department, and performance data for a fictional company. It provides insights to help HR professionals make data-driven decisions on workforce planning, compensation, and performance management.

The project focuses on solving real-world business questions using SQL joins, aggregations, window functions, and subqueries.

---

# 🗃️ Dataset Description

The project uses four relational tables:

| Table Name    | Description |
|---------------|-------------|
| `employees`   | Employee details such as name, age, hire date, manager, and department |
| `departments` | Department IDs and department names |
| `salaries`    | Base salary, bonus, and total compensation per employee |
| `performance` | Yearly performance scores (1 to 5) for each employee |

---

# ❓ Business Questions Answered

1. How many employees are in each department?
2. What is the average salary by department?
3. Who are the top earners in each department?
4. Which employees earn more than the average salary in their department?
5. Are there any employees earning more than their manager?
6. What is the average performance score by year?
7. Who were the top 5 performers in the most recent year?
8. Which employees have never scored below 4?
9. Who are the longest-serving employees?
10. What is each employee’s salary rank within their department?

---

# 🧠 Skills Demonstrated

- ✅ SQL Joins (INNER, LEFT, SELF)
- ✅ Aggregations (`AVG()`, `COUNT()`, `SUM()`)
- ✅ Subqueries (scalar & correlated)
- ✅ Window Functions (`RANK()`, `DENSE_RANK()`, `OVER`)
- ✅ Grouping and filtering (`GROUP BY`, `HAVING`)
- ✅ Sorting and ranking insights

---

# 💻 How to Use This Project

1. **Clone the repository** or download it as a ZIP
2. **Create the tables** using `create_tables.sql`
3. **Import the data** using the provided `.csv` files via MySQL Workbench or another tool
4. Run the SQL queries in `/queries/hr_analytics_questions.sql` to explore the insights

---

## 🧠 Key Learnings

Through this HR Analytics SQL project, I gained hands-on experience with:

- ✅ Designing the relational database for HR data
- ✅ Writing clean and efficient SQL queries across multiple tables
- ✅ Using `INNER JOIN`, `LEFT JOIN`, and `SELF JOIN` to combine employee, department, salary, and performance data
- ✅ Performing aggregations using `COUNT()`, `AVG()`, `SUM()`, and `MIN()` to generate business insights
- ✅ Creating subqueries to compare employee metrics against departmental averages
- ✅ Implementing `WINDOW FUNCTIONS` like `RANK()` and `DENSE_RANK()` to rank employees within groups
- ✅ Filtering and grouping data using `GROUP BY`, `HAVING`, and `WHERE` clauses
- ✅ Applying real-world business logic to identify top performers, longest-serving employees, and salary outliers






