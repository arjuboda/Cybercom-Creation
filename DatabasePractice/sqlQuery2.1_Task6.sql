create database indexExmpl;
use indexExmpl;

create table indexExample(
	id int primary key,
    email varchar(256)
);

alter table indexExample  
add index index_no(id,email);

insert into indexExample 
values
(1,'arju@gmail.com'),
(2,'bob12@gmail.com');

select * from indexExample;