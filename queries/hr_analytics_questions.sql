                                                                                                  ( 10 HR Analytics SQL Questions )
                                                            
---QUERY 1) For each department, list the department name and total number of employees.
                                                             
SELECT DEPT_NAME, COUNT(EMPID) AS TOTAL_NUM_OF_EMP FROM DEPARTMENTS D
 JOIN EMPLOYEES E ON D.DEPT_ID = E.DEPARTMENT_ID 
 GROUP BY DEPT_NAME

-- QUERY 2. Average Salary by Department
-- Show the average total salary per department. Include department name and average total salary.

SELECT d.dept_name, ROUND(AVG(s.total_salary), 2) AS avg_total_salary
FROM employees e
JOIN departments d ON e.depT_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;


-- QUERY 3. Top Earners in Each Department
-- For each department, list the employee(s) with the highest total salary.

SELECT name, dept_name, total_salary
FROM (
    SELECT e.name, d.dept_name, s.total_salary,
           RANK() OVER (PARTITION BY d.dept_name ORDER BY s.total_salary DESC) AS salary_rank
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    JOIN salaries s ON e.emp_id = s.emp_id
) AS ranked
WHERE salary_rank = 1;             

-- query 4. Employees Earning Above Department Average
-- List all employees who earn more than the average total salary of their department.

SELECT e.name, d.dept_name, s.total_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE s.total_salary > (
    SELECT AVG(s.total_salary)
    FROM employees e
    JOIN salaries s ON e.emp_id = s.emp_id
    WHERE e.dept_id = e.dept_id
);

-- query 5. Manager vs. Employee Comparison
-- Find employees whose salary is higher than their manager.

SELECT e.name AS employee, s.total_salary AS employee_salary,
       m.name AS manager, sm.total_salary AS manager_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
JOIN employees m ON e.manager_id = m.emp_id
JOIN salaries sm ON m.emp_id = sm.emp_id
WHERE s.total_salary > sm.total_salary;

-- query 6) Yearly Performance Trend
-- For each year, show the average performance score across the entire company.

select year, round(avg(performance_score),2) from performance
group by year

-- query 7) Top 5 Overall Performers (Most Recent Year)
-- In the most recent year, rank employees by performance score and show the top 5.

SELECT emp_id, performance_score, year
FROM (
    SELECT emp_id, performance_score, year,
           RANK() OVER (ORDER BY performance_score DESC) AS rnk
    FROM performance
    WHERE year = (SELECT MAX(year) FROM performance)
) AS ranked
WHERE rnk <= 5;

-- query 8) Performance Consistency
-- Find employees whose performance score has never dropped below 4 in any year.

SELECT emp_id
FROM performance
GROUP BY emp_id
HAVING MIN(performance_score) >= 4;

-- query 9) Longest-Serving Employees
-- List the top 5 employees with the earliest hire dates.

SELECT emp_id, name, hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 5;

-- Query 10) Departmental Salary Rankings
-- Show all employees along with their department and a rank based on total salary within their department.

SELECT e.name, d.dept_name, s.total_salary,
       RANK() OVER (PARTITION BY d.dept_name ORDER BY s.total_salary DESC) AS salary_rank
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;
