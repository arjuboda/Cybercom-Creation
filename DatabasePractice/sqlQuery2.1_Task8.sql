create database person;
use person;

create table Person(
	personID int primary key,
    firstName varchar(256),
    lastName varchar(256)
);

insert into Person values
(1,'Arju','Boda'),
(2,'Het','Patel'),
(3,'Jenny','Shah'),
(4,'Tathy','Shukla');

create table Address(
 addressId int primary key,
 personId int,
 city varchar(256),
 State varchar(256)
);
insert into Address 
values
(1,2,'Pune','Maharastra'),
(2,3,'Rajkot','Gujarat'),
(3,4,'Leetcode','California ');

select p.firstName, p.lastName,a.city,a.State
from Person p left join Address a on p.personId=a.personID