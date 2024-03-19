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
           END
WHERE sex IS NOT NULL AND id > 0;

select * from Salary;