create database customer_order;
use customer_order;

create table customer(
 id int primary key,
 name varchar(256)
);

insert into customer
values
(1,'Bob'),
(2,'john'),
(3,'paddy'),
(4,'marsel'),
(5,'jacky');


create table orderDetails(
 id int primary key,
 customerID int,
 FOREIGN KEY (customerID) REFERENCES customer(id)
);

insert into orderDetails
values
(1,1),
(2,2),
(3,1),
(4,3),
(5,2);

select name from customer where id not in(
select c.id from customer c right join orderDetails o on c.id=o.customerID)