create database sqlQuery3_1;

/*
Case 1
Create a table called "customers" with the following columns: id (integer, primary key), name (text), email (text), and created_at (timestamp).
 
Insert the following data into the "customers" table:
---------------------------------------------------------------
id	name	email	created_at
1	John Smith	johnsmith@gmail.com	2022-01-01 10:00:00
2	Jane Doe	janedoe@yahoo.com	2022-01-02 11:00:00
3	Bob Johnson	bobjohnson@hotmail.com	2022-01-03 12:00:00
4	Sarah Lee	sarahlee@gmail.com	2022-01-04 13:00:00
5	David Kim	davidkim@yahoo.com	2022-01-05 14:00:00
---------------------------------------------------------------
*/

use sqlQuery3_1;

create table customers(
	id int primary key,
    name varchar(256),
    email varchar(256),
    created_at timestamp
);

insert into customers
values
(1,'John Smith','johnsmith@gmail.com','2022-01-01 10:00:00'),
(2,'Jane Doe','janedoe@yahoo.com','2022-01-02 11:00:00'),
(3,'Bob Johnson','bobjohnson@hotmail.com','2022-01-03 12:00:00'),
(4,'Sarah Lee','sarahlee@gmail.com','2022-01-04 13:00:00'),
(5,'David Kim','davidkim@yahoo.com','2022-01-05 14:00:00');


/*  1. Write a query that selects all customers whose email address ends with "@gmail.com".*/
select * 
from customers 
where email like '%@gmail.com';

/* 2. Write a query that selects the customer with the earliest created_at date.*/
SELECT *
FROM customers
ORDER BY created_at
LIMIT 1;

/* 3. Write a query that selects the name and email of customers who were created on or after January 3, 2022.*/
select name,email
from customers
where created_at >= '2022-01-03';

/*4.	Write a query that updates the email address of the customer with id=5 to "davidkim@gmail.com".*/
 update customers
 SET email='davidkim@gmail.com'
 where id=5;

/*5.	Write a query that deletes the customer with id=2.*/
delete from customers
where id=2;

/*6.	Write a query that calculates the total number of customers in the "customers" table.*/
select count(id) as total_customer from customers;



/*
Case 2

Consider the following table structure for a store's inventory:

CREATE TABLE inventory (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    quantity INT,
    price DECIMAL(10,2),
    category VARCHAR(50)
);
Write a query to retrieve the name and price of all items in the inventory where the quantity is greater than 0 
and the category is 'electronics', sorted in descending order by price.
*/
use sqlQuery3_1;
CREATE TABLE inventory (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    quantity INT,
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO inventory (id, name, quantity, price, category)
VALUES 
    (1, 'Product A', 10, 25.99, 'Electronics'),
    (2, 'Product B', 20, 15.49, 'Clothing'),
    (3, 'Product C', 30, 5.99, 'Home'),
    (4, 'Product D', 40, 12.75, 'Electronics'),
    (5, 'Product E', 50, 8.99, 'Kitchen');

select name, price from inventory where quantity>0 and category='Electronics' order by price desc;

/*
																						Case : 3

Consider the following table structure for a sales database:

CREATE TABLE sales (
    id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2)
);
Write a query to retrieve the total sales for each month in the year 2021, sorted in ascending order by month.*/

use sqlQuery3_1;

CREATE TABLE sales (
    id INT PRIMARY KEY,
    date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2)
);
truncate sales;
INSERT INTO sales (id, date, customer_id, product_id, quantity, total_price) 
VALUES
    (1, '2021-01-05', 101, 201, 2, 50.00),
    (2, '2021-02-10', 102, 202, 1, 25.00),
    (3, '2021-03-15', 103, 203, 3, 75.00),
    (4, '2021-03-20', 104, 201, 2, 60.00),
    (5, '2021-04-25', 105, 202, 1, 30.00),
    (6, '2021-05-30', 106, 203, 3, 90.00),
    (7, '2021-06-10', 107, 201, 2, 70.00),
    (8, '2021-01-15', 108, 202, 1, 35.00),
    (9, '2021-02-20', 109, 203, 3, 105.00),
    (10, '2021-01-25', 110, 201, 2, 80.00),
    (11, '2021-05-28', 111, 202, 1, 40.00),
    (12, '2021-03-05', 112, 203, 3, 120.00),
    (13, '2021-04-10', 113, 201, 2, 90.00);
    
    select month(date) as Month,count(month(date)) as No_Of_Order from sales group by month(date) order by month(date);