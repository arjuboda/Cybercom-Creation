create database SmartCart_project;
use SmartCart_project;

create table customers(
	customer_id int auto_increment primary key,
    customer_name varchar(256) not null,
    password varchar(256) not null,
    email varchar(256) not null,
    address varchar(256) not null,
    contact_no varchar(20) not null
);
ALTER TABLE customers
CHANGE COLUMN username customer_name VARCHAR(255);


DELIMITER //

CREATE TRIGGER hash_password_trigger BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    DECLARE fixed_salt VARCHAR(255);
    SET fixed_salt = 'sMarTcartVirTuAlgroCerYsToRe@2024';  -- Replace with your desired fixed salt
    SET NEW.password = SHA2(CONCAT(NEW.Password, fixed_salt), 256);
END;
//

DELIMITER ;
insert into customers(customer_name,password,email,address,contact_no) values('Dipali','dipu1212','dipali12parmar@gmail.com','Rajkot,Gujarat','7808765345');
select * from customers;