/*4.	Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Return the result table in any order.*/

create database data;
use data;

create table information(
	id int primary key,
    email varchar(256)
);

describe information;

insert into information
values
(1,'arju@gmail.com'),
(2,'mansi12@gmail.com'),
(3,'arju01@gmail.com'),
(4,'mansi12@gmail.com'),
(5,'bob258@gmail.com');

DELETE FROM information 
WHERE id NOT IN (
    SELECT MIN(id) 
    FROM information 
    GROUP BY email 
    ORDER BY id ASC
) AND id > 0;
select i1.email
FROM information i1
JOIN information i2 ON i1.email = i2.email AND i1.id > i2.id;
select * from information;