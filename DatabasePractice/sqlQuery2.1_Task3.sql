/*3.	Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and 
no intermediate temporary tables.Note that you must write a single update statement, do not write any select statement for this problem.*/

create database salaryInfo;
use salaryInfo;

create table Salary(
	id int primary key ,
    name varchar(256),
    sex enum('m','f','o'),
    salary int 
);

insert into Salary 
values
('1','A','f','2500'),
('2','B','m','1500'),
('3','C','f','5500'),
('4','D','m','500');

UPDATE Salary
SET sex = CASE 
              WHEN sex = 'f' THEN 'm'
              WHEN sex = 'm' THEN 'f'
              else 'o'
           END
WHERE sex IS NOT NULL AND id > 0;

select * from Salary;