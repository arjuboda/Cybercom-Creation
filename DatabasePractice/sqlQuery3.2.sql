create database sqlQuery3_2;
/*
Case 1
Consider the following table structure for a blog:

CREATE TABLE blog_posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    author_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
CREATE TABLE blog_comments (
    id INT PRIMARY KEY,
    post_id INT,
    body TEXT,
    author_id INT,
    created_at TIMESTAMP
);

*/

use sqlQuery3_2;
CREATE TABLE blog_posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    author_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO blog_posts (id, title, body, author_id, created_at, updated_at)
VALUES
    (1, 'Introduction to Machine Learning', 'This post covers the basics of machine learning.', 101, '2024-03-06 12:00:00', '2024-03-06 12:00:00'),
    (2, 'Exploring Data Visualization Techniques', 'Learn different ways to visualize data effectively.', 102, '2024-03-06 12:15:00', '2024-03-06 12:15:00'),
    (3, 'Tips for Remote Work Productivity', 'Discover strategies to enhance productivity while working remotely.', 103, '2024-03-06 12:30:00', '2024-03-06 12:30:00'),
    (4, 'The Art of Storytelling in Marketing', 'Explore how storytelling can elevate your marketing efforts.', 104, '2024-03-06 12:45:00', '2024-03-06 12:45:00'),
    (5, 'Mastering the Basics of Python', 'This post provides a comprehensive guide to Python fundamentals.', 105, '2024-03-06 13:00:00', '2024-03-06 13:00:00'),
    (6, 'Understanding Blockchain Technology', 'Explore the fundamentals and applications of blockchain.', 106, '2024-03-06 13:15:00', '2024-03-06 13:15:00'),
    (7, 'Effective Time Management Strategies', 'Learn how to manage your time efficiently and improve productivity.', 107, '2024-03-06 13:30:00', '2024-03-06 13:30:00');

CREATE TABLE blog_comments (
    id INT PRIMARY KEY,
    post_id INT,
    body TEXT,
    author_id INT,
    created_at TIMESTAMP
);
INSERT INTO blog_comments (id, post_id, body, author_id, created_at)
VALUES
    (1, 1, 'Great post! Looking forward to more content.', 201, '2024-03-06 12:05:00'),
    (2, 1, 'Interesting read. Keep up the good work!', 202, '2024-03-06 12:10:00'),
    (3, 2, 'I have some questions regarding this topic.', 203, '2024-03-06 12:20:00'),
    (4, 2, 'Thanks for sharing your insights.', 204, '2024-03-06 12:25:00'),
    (5, 3, 'Thanks for sharing your insights.', 204, '2024-03-06 12:25:00'),
    (6, 4, 'thank you for sharing this information.', 204, '2024-04-07 11:30:00');

/* Write a query to retrieve the title and body of the five most recent blog posts, along with the number of comments each post has.*/

SELECT p.title, p.body, COUNT(c.id) AS num_comments
FROM blog_posts p
LEFT JOIN blog_comments c ON p.id = c.post_id
GROUP BY p.id
ORDER BY MAX(c.created_at) DESC
LIMIT 5;




/*
																		Case 2
Consider the following table structure for a social media platform:
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP
);
CREATE TABLE posts (
    id INT PRIMARY KEY,
    user_id INT,
    body TEXT,
    created_at TIMESTAMP
);
CREATE TABLE likes (
    id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    created_at TIMESTAMP
);
Write a query to retrieve the name and number of posts for each user who joined the platform in the year 2022, along with the total number of likes received for each user's posts.
*/

use sqlQuery3_2;
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_at TIMESTAMP
);

INSERT INTO users (id, name, created_at)
VALUES
    (1, 'Alice', '2022-01-15 08:00:00'),
    (2, 'Bob', '2022-02-20 09:30:00'),
    (3, 'Charlie', '2023-05-10 11:45:00'),
    (4, 'David', '2022-03-25 14:20:00');

CREATE TABLE posts (
    id INT PRIMARY KEY,
    user_id INT,
    body TEXT,
    created_at TIMESTAMP
);

INSERT INTO posts (id, user_id, body, created_at)
VALUES
    (1, 1, 'This is Alice''s first post.', '2022-01-16 08:10:00'),
    (2, 2, 'Bob shares his thoughts on the latest news.', '2022-02-20 10:00:00'),
    (3, 2, "Bob's second post", '2022-02-25 11:20:00'),
    (4, 4, "David's post", '2022-03-25 14:30:00');

    
CREATE TABLE likes (
    id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    created_at TIMESTAMP
);

INSERT INTO likes (id, user_id, post_id, created_at)
VALUES
    (1, 3, 1, '2022-01-17 08:20:00'),
    (2, 2, 1, '2022-01-18 09:00:00'),
    (3, 1, 2, '2022-02-21 10:30:00'),
    (4, 3, 2, '2022-02-22 12:00:00');
    
SELECT 
    u.name,
    COUNT(DISTINCT p.id) AS num_posts,
    COALESCE(SUM(l.id IS NOT NULL), 0) AS total_likes
FROM 
    users u
LEFT JOIN 
    posts p ON u.id = p.user_id
LEFT JOIN 
    likes l ON p.id = l.post_id
WHERE 
    YEAR(u.created_at) = 2022
GROUP BY 
    u.id, u.name;

/*																		Case : 3
Consider a table called "employees" with the following columns: "id", "name", "department", "salary". 
Write a SQL query to retrieve the names and salaries of all employees in the "sales" department 
who earn more than $50,000 per year.
*/
create table employees(
	id int primary key,
    name varchar(256),
    department varchar(256),
    salary int
);

insert into employees
values
(1,'john','sales',30000),
(2,'Alice','Marketing',51000),
(3,'Charlie','Development',30000),
(4,'Devid','HR',30000),
(5,'mark','sales',53000),
(6,'jenny','sales',68000);

select name,salary 
from employees 
where department='sales' 
having salary>50000;


/*Case 4
Consider a table called "orders" with the following columns: "id", "customer_id", "order_date", "total_amount". 
Write a SQL query to calculate the total amount of orders for each customer, sorted in descending order by total amount.
*/
use sqlQuery3_2;
create table orders(
	id int primary key,
    customer_id int,
    order_date date,
    total_amount int
);

insert into orders
values
(1,1,'2024-03-03',550),
(2,2,'2024-03-03',650),
(3,1,'2024-03-04',1550),
(4,3,'2024-03-04',620),
(5,4,'2024-03-05',5220);

select customer_id,sum(total_amount) 
from orders 
group by customer_id 
order by sum(total_amount) desc;
