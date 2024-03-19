create database sqlQuery4_1;
/*Case 1
Assume that you are working with a database containing information about a bookstore. The database has several tables:
books table containing information about all books in the bookstore. The table has the following columns:
id: unique identifier for each book
title: title of the book
author_id: foreign key pointing to the authors table
publication_date: publication date of the book

authors table containing information about all authors of the 
books in the bookstore. The table has the following columns:
id: unique identifier for each author
name: name of the author

book_categories table containing information about all categories of books in the bookstore. The table has the following columns:
id: unique identifier for each category
name: name of the category

book_category_mappings table containing information about which books belong to which categories. The table has the following columns:
id: unique identifier for each mapping
book_id: foreign key pointing to the books table
category_id: foreign key pointing to the book_categories table
-

*/

CREATE TABLE authors (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO authors 
(id, name) 
VALUES
(1, 'Author 1'),
(2, 'Author 2'),
(3, 'Author 3'),
(4, 'Author 4'),
(5,'Author 5'),
(6,'Author 6');

CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books (id, title, author_id, publication_date) VALUES
(1, 'Book 1', 1, '2020-01-01'),
(2, 'Book 2', 1, '2020-02-01'),
(3, 'Book 3', 2, '2021-01-01'),
(4, 'Book 4', 3, '2020-03-01'),
(5, 'Book 5', 2, '2019-01-01'),
(6, 'Book 6', 4, '2020-01-01'),
(7, 'Book 7', 5, '2021-01-01'),
(8, 'Book 8', 3, '2022-01-01'),
(9, 'Book 9', 5, '2021-01-01'),
(10, 'Book 10', 2, '2022-01-01');

CREATE TABLE book_categories (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO book_categories (id, name) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science Fiction');

CREATE TABLE book_category_mappings (
    id INT PRIMARY KEY,
    book_id INT,
    category_id INT,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (category_id) REFERENCES book_categories(id)
);
INSERT INTO book_category_mappings (id, book_id, category_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 3),
(6,6,2),
(7,7,2),
(8, 8, 3),
(9,9,1),
(10,10,3);

CREATE TABLE book_borrowings (
    id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    borrow_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id)
    -- Assuming customers table exists, but not defined here for simplicity
    -- FOREIGN KEY (customer_id) REFERENCES customers(id)
);
INSERT INTO book_borrowings (id, book_id, customer_id, borrow_date) VALUES
(1, 1, 1, '2020-01-15'),
(2, 1, 2, '2020-02-20'),
(3, 2, 3, '2020-03-25'),
(4, 3, 1, '2021-02-10'),
(5, 4, 2, '2020-05-15'),
(6, 4, 3, '2020-06-20'),
(7, 8, 2, '2020-07-25'),
(8, 7, 3, '2020-08-10'),
(9, 5, 1, '2019-02-15'),
(10, 5, 2, '2019-03-20'),
(11, 9, 2, '2020-07-25'),
(12, 7, 3, '2021-08-10'),
(13, 8, 1, '2022-02-15'),
(14, 10, 2, '2023-03-20');


-- 1. Query to find all books published in the year 2020
select * from books where year(publication_date)=2020;

-- 2. Query to find the name of the author who has written the most number of books
select a.name, count(b.author_id) as book_count
from authors a join books b on a.id=b.author_id group by b.author_id order by book_count desc limit 1;
/*
SELECT a.name, COUNT(b.author_id) AS book_count
FROM authors a 
JOIN books b ON a.id = b.author_id 
GROUP BY b.author_id
HAVING COUNT(b.author_id) = (
    SELECT MAX(book_count)
    FROM (
        SELECT COUNT(b2.author_id) AS book_count
        FROM books b2
        GROUP BY b2.author_id
    ) AS subquery
);
*/

-- 3. Query to find the name of the category with the most number of books
select bc.name,count(bcm.book_id) as book_count
from book_categories bc 
left join book_category_mappings bcm on bc.id=bcm.category_id 
group by bc.name
order by book_count desc
limit 1;

-- 4. Query to find the name of the author who has written the most number of books in the category "fiction"
SELECT authors.name, COUNT(*) AS book_count
FROM authors
JOIN books ON authors.id = books.author_id
JOIN book_category_mappings ON books.id = book_category_mappings.book_id
JOIN book_categories ON book_category_mappings.category_id = book_categories.id
WHERE book_categories.name = 'Fiction'
GROUP BY authors.id
ORDER BY book_count DESC
LIMIT 1;

-- 5. Query to find the titles of the top 5 most popular books
SELECT books.title, COUNT(*) AS borrow_count
FROM books
JOIN book_borrowings ON books.id = book_borrowings.book_id
GROUP BY books.id
ORDER BY borrow_count DESC
LIMIT 5;