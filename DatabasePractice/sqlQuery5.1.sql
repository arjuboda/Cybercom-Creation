/*  1.	Write a SQL query to retrieve the top 10 customers who have made the most orders in the "orders" table, along with the total number of orders they have made.*/

use sqlquery4_2;

select user_id,count(user_id) as total_order 
from orders4_3 
group by user_id 
order by total_order desc 
limit 10;


/*2.	Write a SQL query to retrieve the names of all employees who have sold more than $100,000 worth of products in the "order_details" table, 
sorted by the amount sold in descending order.*/
use sqlquery4_2;
CREATE TABLE employees5_1 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE orders5_1 (
    order_id INT PRIMARY KEY,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees5_1(employee_id)
);

CREATE TABLE order_details5_1 (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders5_1(order_id)
);

-- Insert sample data for demonstration
INSERT INTO employees5_1 (employee_id, name) VALUES
(1, 'John'),
(2, 'Jane'),
(3, 'Alice');

INSERT INTO orders5_1 (order_id, employee_id) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 1);

INSERT INTO order_details5_1 (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
(1, 101, 1, 10, 1500.50),
(2, 101, 2, 5, 2000.00),
(3, 102, 3, 8, 6120.75),
(4, 103, 1, 15, 51800.00),
(5, 104, 2, 20, 10000.50),
(6, 104, 3, 12, 2002.00);

select  e.name, sum(od.quantity*od.unit_price) as total_amount
from employees5_1 e 
join orders5_1 o on e.employee_id=o.employee_id
join order_details5_1 od on o.order_id=od.order_id
group by o.employee_id
having total_amount>100000
order by total_amount desc;
/*3.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, 
along with the total amount they have spent on all orders and the total amount they have spent on orders made in the last 30 days.*/
use sqlQuery4_2;
select u.name,sum(o.amount) as total_amount 
from users4_3 u right join
orders4_3 o on o.user_id=u.id
where o.created_at > DATE_SUB(CURDATE(), INTERVAL 30 DAY)
group by u.id;

/*4.	Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the average salary of 
all employees in the "employees" table, sorted by salary in descending order.*/
use sqlQuery4_2;
SELECT name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees) 
ORDER BY salary DESC;

/*5.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not made any orders in the last 90 days.*/
use sqlQuery3_5_Sales;
SELECT c.first_name, c.last_name 
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT o.customer_id
    FROM orders o
    WHERE o.order_date >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
    group by o.customer_id
);

/*6.	Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the minimum salary 
of their department in the "employees" table, sorted by department ID and then by salary in descending order.*/

USE sqlQuery4_2;
SELECT e.name AS empl_name, e.salary, d.department_name 
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT MIN(salary)
    FROM Employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id, e.salary DESC;

/* 7. Write a SQL query to retrieve the names and salaries of the five highest paid employees in each department of the "employees"
 table, sorted by department ID and then by salary in descending order.*/
SELECT e.name AS empl_name, e.salary as salary, d.department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE (
    SELECT COUNT(*)
    FROM Employees e2
    WHERE e2.department_id = e.department_id AND e2.salary >= e.salary
) <= 5
ORDER BY e.department_id, e.salary DESC;

/*8.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, 
but have not made any orders for products in the "products" table with a price greater than $100. */
SELECT DISTINCT c.customer_name
FROM customers5_1_10 c
JOIN orders5_1_10 o ON c.customer_id = o.customer_id
LEFT JOIN products5_1_10 p ON o.product_id = p.product_id AND p.price > 100
WHERE p.product_id IS NULL;

/*9.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, 
along with the total amount they have spent on all orders and the average amount they have spent per order.*/

use sqlQuery4_2;
SELECT u.name, sum(o.amount) ,avg(o.amount)
FROM users4_3 u
join orders4_3 o on u.id=o.user_id
group by o.user_id;

/* 10.	Write a SQL query to retrieve the names of all products in the "products" table that have been ordered by 
customers in more than one country, along with the names of the countries where the products have been ordered.*/
use sqlquery4_2;
CREATE TABLE products5_1_10 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price int
);

CREATE TABLE customers5_1_10 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders5_1_10 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    country VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products5_1_10 (product_id, product_name,price) VALUES
(1, 'Product A',100),
(2, 'Product B',69),
(3, 'Product C',159);

INSERT INTO customers5_1_10 (customer_id, customer_name) VALUES
(1, 'Customer X'),
(2, 'Customer Y'),
(3, 'Customer Z');

INSERT INTO orders5_1_10 (order_id, customer_id, product_id, country) VALUES
(1, 1, 1, 'USA'),
(2, 1, 2, 'Canada'),
(3, 2, 1, 'UK'),
(4, 2, 2, 'UK'),
(5, 3, 3, 'France'),
(6, 3, 3, 'Germany'),
(7, 3, 3, 'Italy');

SELECT p.product_name,
       GROUP_CONCAT(o.country SEPARATOR ', ') AS countries
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT o.country) > 1
ORDER BY p.product_name;

