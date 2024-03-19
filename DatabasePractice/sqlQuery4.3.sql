/*
Assume you are given access to a database with two tables: users and orders. The users table contains the following columns:
id (integer)
name (text)
email (text)
password (text)
created_at (timestamp)
updated_at (timestamp)

The orders table contains the following columns:
id (integer)
user_id (integer)
amount (float)
created_at (timestamp)
updated_at (timestamp)
*/

use sqlquery4_2;

CREATE TABLE users4_3 (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users4_3 (name, email, password) VALUES
('Alice shah', 'alice123.johnson@example.com', 'ali123'),
('Bob Williams', 'bob.williams@example.com', 'abc456'),
('Emily Brown', 'emily.brown@example.com', 'nnbv789'),
('Michael Davis', 'michael.davis@example.com', '523abc'),
('Sophia Wilson', 'sophia.wilson@example.com', '786def');


CREATE TABLE orders4_3 (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    amount FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO orders4_3 (user_id, amount) VALUES
(1, 50.00),
(1, 75.00),
(2, 100.00),
(2, 150.00),
(3, 25.00),
(5, 60.00),
(5, 80.00),
(5, 90.00),
(6, 120.00),
(6, 70.00);

/*1.	Create a new user with the following information:
name: John Doe
email: john.doe@example.com
password: 123456
created_at: current timestamp
updated_at: current timestamp
*/

insert into users4_3 
(name,email,password,created_at,updated_at) 
values 
('John Doe','john.doe@example.com',' 123456', current_timestamp,current_timestamp);


/*2.	Retrieve the names and email addresses of all users who have placed at least one order.*/
 select u.name, u.email 
 from users4_3 u
 right join orders4_3 o on u.id=o.user_id
 group by o.user_id;

/*3.	Retrieve the total amount of orders placed by each user, sorted in descending order of total amount.*/
select u.name,COALESCE(SUM(o.amount), 0) as total_amount
from users4_3 u
left join orders4_3 o on u.id=o.user_id
group by o.user_id
order by total_amount desc;
 
/*4.	Retrieve the email address of the user who has placed the most orders.*/
 select u.id,u.email
from users4_3 u 
right join orders4_3 o on u.id=o.user_id
group by o.user_id
order by count(o.user_id) desc
limit 1;

/*5.	Retrieve the user IDs and the total amount of orders placed by users who have placed at least one order and whose total amount of orders exceeds $100.*/
 select u.id,SUM(o.amount) as total_amount
from users4_3 u
right join orders4_3 o on u.id=o.user_id
group by o.user_id
having total_amount>100;

/*6.	Retrieve the number of users who have not placed any orders.*/
select count(u.id) as no_of_customers
from users4_3 u
left join orders4_3 o on u.id=o.user_id where o.user_id is null;

/*7.	Update the user with ID 1 to change their email address to "jane.doe@example.com".*/
update users4_3 set email='jane.doe@example.com' where id=1;

/* 8.	Delete all orders placed by users whose email address contains the string "test".*/
/*INSERT INTO users4_3 (name, email, password) VALUES
('Alice shah', 'alicetest.johnson@example.com', 'ali123')*/
delete from users4_3 where email like '%test%';


/*9.	Retrieve the total amount of orders placed on each day of the current week, grouped by day.*/
-- select YEARWEEK(CURRENT_DATE);
SELECT DATE(created_at) AS order_date, SUM(amount) AS total_amount
FROM orders4_3
WHERE YEARWEEK(created_at) = YEARWEEK(CURRENT_DATE)
GROUP BY order_date;

/*10.	Retrieve the IDs and email addresses of users who have placed an order in the current year and whose email address is in the format "example.com".
*/ 
-- select year(now());
select u.id,u.email 
from users4_3 u
join orders4_3 o on u.id=o.user_id
where YEAR(o.created_at) = year(now()) 
AND u.email like '%example.com'