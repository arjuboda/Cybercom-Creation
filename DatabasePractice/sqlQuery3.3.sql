create database sqlQuery3_3;
/* Case 1
Consider a table called "books" with the following columns: "id", "title", "author", "publication_year". Write a SQL query to retrieve the title and author of the oldest book in the table.
*/

use sqlQuery3_3;

create table books(
	id int primary key,
    title varchar(256),
    author varchar(256),
    publish_year varchar(256)
);

INSERT INTO books 
(id, title, author, publish_year) 
VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', '1960'),
(2, '1984', 'George Orwell', '1949'),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', '1925'),
(4, 'Pride and Prejudice', 'Jane Austen', '1813'),
(5, 'Animal Farm', 'George Orwell', '1949'),
(6, 'Brave New World', 'Aldous Huxley', '1932'),
(7, 'Sense and Sensibility', 'Jane Austen', '1813');

select title,author from books where publish_year =(select min(publish_year) from books) ;


/*Case 2
Create a table called "employees" with the following columns: "id" (integer, primary key), "name" (text), "age" (integer), and "salary" (integer).  
Insert the following data into the "employees" table:
 
id	name	age	salary
1	John	35	60000
2	Mary	27	50000
3	Peter	42	75000
4	Olivia	29	55000
5	Michael	38	80000
*/

create table employees(
 id int primary key,
 name text,
 age int,
 salary int
);
insert into employees
values
(1,'John',35,60000),
(2,'Mary',27,50000),
(3,'Peter',42,75000),
(4,'Olivia',29,55000),
(5,'Michael',38,80000);

/*1.	Write a SQL query to select all employees from the "employees" table.*/
select * from employees;

/*2.	Write a SQL query to select the name and salary of all employees with a salary greater than 60000.*/
select name,salary from employees where salary>60000;

/* 3.	Write a SQL query to update Peter's age to 43.*/
UPDATE employees
SET age = '43'
WHERE name = 'Peter' and id>0;

/*4.	Write a SQL query to delete the employee with the id of 4.*/
delete from employees where id=4;
 
/*5.	Write a SQL query to calculate the average salary of all employees.*/
select avg(salary) as average_salary from employees;

/*6.	Write a SQL query to select the name and age of the oldest employee.*/
/*select name, age 
from employees 
where age=
(select max(age) from employees);*/

select name,age 
from employees 
order by age desc limit 1;

/*7.	Write a SQL query to select the name and age of the youngest employee.*/
select name, age
from employees
order by age limit 1;
 
/*8.	Write a SQL query to select the name of the employee with the highest salary.*/
select name, salary
from employees
order by salary desc limit 1;
