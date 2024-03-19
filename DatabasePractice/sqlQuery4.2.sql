create database sqlQuery4_2;

/*
Case 1
Assume you are working with a company that has a database containing information about employees and their departments. The database has three tables:
Employees table, which includes columns for employee ID, name, department ID, and salary.
Departments table, which includes columns for department ID and department name.
Salaries table, which includes columns for employee ID, salary, and date.
Please write SQL queries to solve the following problems:

1.	Write a query to return the names of all employees who work in the 'Sales' department.
2.	Write a query to return the total number of employees in each department, ordered by department name.
3.	Write a query to return the average salary for each department, ordered by department name.
4.	Write a query to return the top 10% of highest paid employees, ordered by salary.
5.	Write a query to return the salary of each employee for their latest salary entry.
*/
use sqlQuery4_2;
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE Salaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    date DATE
);

-- Insert sample data into Employees table
INSERT INTO Employees (employee_id, name, department_id, salary)
VALUES
    (1, 'John Doe', 1, 50000.00),
    (2, 'Jane Smith', 1, 60000.00),
    (3, 'Alice Johnson', 2, 55000.00),
    (4, 'Bob Williams', 3, 70000.00),
    (5, 'Emily Brown', 2, 62000.00),
    (6, 'Michael Davis', 3, 75000.00),
    (7, 'BOB', 1, 56000.00),
    (8, 'Mark', 1, 62000.00),
    (9, 'Johnson', 1, 70000.00),
    (10, 'Denny Williams', 3, 70000.00),
    (11, 'Emily', 2, 62000.00),
    (12, 'Davis', 3, 75000.00);

INSERT INTO Departments (department_id, department_name)
VALUES
    (1, 'Sales'),
    (2, 'Marketing'),
    (3, 'Finance');

INSERT INTO Salaries (employee_id, salary, date)
VALUES
    (1, 50000.00, '2024-01-01'),
    (1, 55000.00, '2024-02-01'),
    (2, 60000.00, '2024-01-01'),
    (2, 65000.00, '2024-02-01'),
    (3, 55000.00, '2024-01-01'),
    (3, 60000.00, '2024-02-01'),
    (4, 70000.00, '2024-01-01'),
    (4, 75000.00, '2024-02-01'),
    (5, 62000.00, '2024-01-01'),
    (5, 65000.00, '2024-02-01'),
    (6, 75000.00, '2024-01-01'),
    (6, 80000.00, '2024-02-01');
    
-- 1 Write a query to return the names of all employees who work in the 'Sales' department.
 select e.name 
 from Employees e 
 join Departments d 
 on e.department_id=d.department_id 
 where d.department_name='Sales';
 
 
-- 2.	Write a query to return the total number of employees in each department, ordered by department name.
 select d.department_name as departtment_name, count(e.employee_id) as no_of_employes
 from Employees e 
 right join Departments d on e.department_id=d.department_id 
 group by d.department_name 
 order by d.department_name;
 
 -- 3. Write a query to return the average salary for each department, ordered by department name.
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY d.department_name;


-- 4.	Write a query to return the top 10% of highest paid employees, ordered by salary.
SELECT name,salary
FROM (SELECT name, salary, ntile(10) OVER (ORDER BY salary DESC) AS s_percentage FROM Employees) as sub_query
WHERE s_percentage = 1
ORDER BY salary DESC;
/*
SELECT name, salary
FROM (
    SELECT name, salary, PERCENT_RANK() OVER (ORDER BY salary DESC) AS salary_percent_rank
    FROM Employees
) AS percentage_query
WHERE salary_percent_rank >= 0.9
ORDER BY salary DESC; */

/*
DELIMITER //
CREATE PROCEDURE GetTopPaidEmployees()
BEGIN
    DECLARE total_rows INT;
    DECLARE rows_to_return INT;
    -- Get the total number of employees
    SELECT COUNT(*) INTO total_rows FROM Employees;
    -- Calculate the number of rows to return for the top 10%
    SET rows_to_return = CEIL(total_rows * 0.1);
    -- Fetch the top paid employees
    SELECT name, salary
    FROM Employees
    ORDER BY salary DESC
    LIMIT rows_to_return;
END//
DELIMITER ;
CALL GetTopPaidEmployees();
*/

-- 5.	Write a query to return the salary of each employee for their latest salary entry.
select a.employee_id, a.salary 
from Salaries a 
join Salaries b  on a.employee_id=b.employee_id 
where a.date>b.date  
group by a.employee_id ;

/*SELECT a.employee_id, a.salary
FROM Salaries a
JOIN (
    SELECT employee_id, MAX(date) AS max_date
    FROM Salaries
    GROUP BY employee_id
) b ON a.employee_id = b.employee_id AND a.date = b.max_date;*/
