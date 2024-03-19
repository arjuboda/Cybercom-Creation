create database practice;
use  practice;
create table practicetable(
	id int primary key,
    name varchar(256),
    email varchar(256) unique
);
insert into practicetable(id ,name,email)values (1,'abc','anc@gmail.com');
select * from practicetable;customer