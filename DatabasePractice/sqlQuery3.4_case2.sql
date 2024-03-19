/*Case 2
Consider you’ve one employee database system. Create table schema and add data according to the following queries.
*/
use sqlquery3_4;
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    title VARCHAR(100),
    department_name VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, first_name, last_name, title, department_name, hire_date, salary)
VALUES 
(1, 'John', 'Doe', 'Senior Manager', 'Sales', '1998-05-15', 70000.00),
(2, 'Jane', 'Smith', 'Marketing Manager', 'Marketing', '2005-10-20', 60000.00),
(3, 'Michael', 'Johnson', 'Sales Manager', 'Sales', '2008-03-12', 65000.00),
(4, 'Emily', 'Williams', 'HR Manager', 'HR', '2010-07-05', 55000.00),
(5, 'David', 'Brown', 'Senior Analyst', 'Finance', '2012-02-18', 50000.00),
(6, 'Sarah', 'Jones', 'Sales Associate', 'Sales', '2015-09-30', 45000.00),
(7, 'Robert', 'Taylor', 'Marketing Coordinator', 'Marketing', '2018-04-22', 48000.00),
(8, 'Jessica', 'Miller', 'Analyst', 'Finance', '2020-01-10', 52000.00),
(9, 'Daniel', 'Anderson', 'Senior Developer', 'IT', '2019-08-05', 75000.00),
(10, 'Amanda', 'Wilson', 'Junior Developer', 'IT', '2022-06-15', 60000.00),
(11, 'Christopher', 'Martinez', 'Sales Manager', 'Sales', '2011-11-08', 68000.00),
(12, 'Melissa', 'Thomas', 'Marketing Specialist', 'Marketing', '2017-03-25', 52000.00),
(13, 'Steven', 'Hernandez', 'Financial Analyst', 'Finance', '2014-05-30', 54000.00),
(14, 'Kimberly', 'Young', 'HR Coordinator', 'HR', '2016-08-12', 48000.00),
(15, 'John', 'Doe', 'Senior Manager', 'Sales', '1998-05-15', 70000.00);

/*1.	Write a query that returns the first and last name of all employees who have a title that contains the word "Manager".*/
select first_name,last_name 
from employees
 where title 
 like '%Manager%';

/*2.	Write a query that returns the department name and the average salary of all employees in each department.*/
 select avg(salary) as average_salary,department_name 
 from employees 
 group by department_name;
 
/*3.	Write a query that returns the number of employees who were hired in each year, sorted by year.*/
 select year(hire_date) as hire_year,count(year(hire_date)) 
 as count_Of_employees 
 from employees
 group by hire_year 
 order by hire_year;

/*4.	Write a query that returns the first name, last name, and salary of the top 10 highest-paid employees.*/
 select first_name,last_name,salary 
 from employees 
 order by Salary desc 
 limit 10;
 
/*5.	Write a query that updates the salary of all employees in the "Sales" department to be 10% higher than their current salary.*/
 update employees 
 set salary=Salary+(salary*0.10) 
 where department_name='Sales';
 
/*6.	Write a query that deletes all employees who were hired before the year 2000.*/
 delete from employees 
 where year(hire_date)<2000;
 
/*7.	Write a query that creates a new table called "employee_stats" that contains the following 
columns: "department_name", "total_employees", and "average_salary". The table should include one row for each department.*/
CREATE TABLE employee_stats (
    department_name VARCHAR(50),
    total_employees INT,
    average_salary DECIMAL(10, 2)
);
INSERT INTO employee_stats (department_name, total_employees, average_salary)
SELECT department_name, COUNT(*) AS total_employees, AVG(salary) AS average_salary
FROM employees
GROUP BY department_name;
select * from employee_stats;

/*8.	Write a query that returns the first and last name of all employees who have the same last name as their manager.*/
SELECT emp.first_name, emp.last_name
FROM employees emp
JOIN employees mgr ON SUBSTRING_INDEX(emp.title, ' ', -1) = 'Manager' 
                    AND emp.department_name = mgr.department_name
                    AND emp.last_name = SUBSTRING_INDEX(mgr.title, ' ', 1);

/*9.	Write a query that returns the top 5 departments with the highest average salary.*/
 select department_name from employees group by department_name order by avg(salary) desc limit 5;
 
/*10.	Write a query that returns the first and last name of all employees who have at least one dependent. Sort the results by last name.*/
select first_name, last_name from employees where department_name is not null order by last_name;