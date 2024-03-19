use sqlquery4_2;

CREATE TABLE orders5_4 (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    total_amount DECIMAL(10, 2),
    order_date DATE,
    product_id int,
    foreign key (product_id) references products5_4(product_id) 
);
CREATE TABLE returns5_4 (
    return_id INT PRIMARY KEY,
    order_id INT,
    returned_items INT,
    return_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders5_4(order_id)
);
CREATE TABLE products5_4 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

INSERT INTO orders5_4 (order_id, customer_name, total_amount, order_date,product_id)
VALUES 
    (1, 'John', 50.00, '2024-01-01',1),
    (2, 'Alice', 120.00, '2024-01-05',2),
    (3, 'Bob', 80.00, '2024-01-10',5),
    (4, 'Alice', 30.00, '2024-01-15',3),
    (5, 'Dolly', 86.00, '2022-02-10',4),
    (6, 'Joy', 39.00, '2023-012-15',6),
    (7, 'joy', 169.00, '2024-01-25',4),
    (8, 'Alice', 199.00, '2024-01-20',4);

INSERT INTO returns5_4 (return_id, order_id, returned_items, return_date)
VALUES
    (1, 2, 1, '2024-01-08'),
    (2, 4, 2, '2024-01-20'),
    (3, 5, 3, '2022-02-15');
    
INSERT INTO products5_4 (product_id, product_name, category)
VALUES
    (1, 'Product A', 'Category 1'),
    (2, 'Product B', 'Category 1'),
    (3, 'Product C', 'Category 2'),
    (4, 'Product D', 'Category 3'),
    (5, 'Product E', 'Category 1'),
    (6, 'Product F', 'Category 2');    

/*1.	Write a SQL query to retrieve the names of all customers who have made at least one order in the "orders" table 
and have not made any orders in the "returns" table.*/

 
/*2.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and 
have returned at least one item in the "returns" table.*/
 select customer_name from orders5_4 where order_id  IN (select order_id from returns5_4);

/* 3.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have not returned any items in the "returns" table.*/
  select customer_name from orders5_4 where order_id not in (select order_id from returns5_4);
 
/* 4.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have returned more items than they have ordered.*/
select distinct o.customer_name
from orders5_4 o
join returns5_4 r on o.order_id=r.order_id
where r.returned_items >(
	select count(*)
    from orders5_4 o2
    where o2.customer_name=o.customer_name
    group by o2.customer_name
);

/* 5.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table and 
have not returned more items than they have ordered.*/

 select distinct customer_name 
 from orders5_4 
 where order_id not in (
	select o.order_id
	from orders5_4 o
	join returns5_4 r on o.order_id=r.order_id
	where r.returned_items >(
		select count(*)
		from orders5_4 o2
		where o2.customer_name=o.customer_name
		group by o2.customer_name
	)
);

/* 6.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have spent more than $100 in total on all orders.*/
select customer_name ,sum(total_amount) as total_amount
from orders5_4 
group by customer_name
having total_amount>100;
 
/* 7.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have spent more than $100 in total on all orders, sorted by the total amount spent in descending order.*/

select customer_name ,sum(total_amount) as total_amount
from orders5_4 
group by customer_name
having total_amount>100
order by total_amount desc;
 
/*8.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have ordered products in all categories.*/
 SELECT o.customer_name
FROM orders5_4 o
JOIN products5_4 p ON o.product_id = p.product_id
GROUP BY o.customer_name
HAVING COUNT(DISTINCT p.category) = (SELECT COUNT(DISTINCT category) FROM products5_4);

/*9.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have not ordered products in all categories.*/
 select distinct customer_name from orders5_4
 where customer_name not in
 (
	SELECT o.customer_name
	FROM orders5_4 o
	JOIN products5_4 p ON o.product_id = p.product_id
	GROUP BY o.customer_name
	HAVING COUNT(DISTINCT p.category) = (SELECT COUNT(DISTINCT category) FROM products5_4)
 );
/*10.	Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table 
and have ordered products in at least two different categories.*/
SELECT o.customer_name, COUNT(DISTINCT p.category) as categories_count
FROM orders5_4 o
JOIN products5_4 p ON o.product_id = p.product_id
GROUP BY o.customer_name
HAVING COUNT(DISTINCT p.category) >1;





select * from orders5_4;
alter table orders5_4
add product_id int,
add constraint fk_pId_from_products5_4
FOREIGN KEY (product_id) REFERENCES products5_4(product_id) ;

update orders5_4 set product_id=4 where order_id=7;