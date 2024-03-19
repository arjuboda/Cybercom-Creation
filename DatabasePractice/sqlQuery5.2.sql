use sqlquery4_2;
-- Create tables
CREATE TABLE customers5_2 (
    customerID INT PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    ShippingAddressCity VARCHAR(50) NOT NULL
);
INSERT INTO customers5_2 VALUES 
(1, 'Customer1','New York'),
(2, 'Customer2','Los Angeles'),
(3, 'Customer3','Chicago');

CREATE TABLE products5_2 (
    productID INT PRIMARY KEY,
    productName VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL
);

INSERT INTO products5_2 VALUES 
(1, 'Product1', 'Electronics'),
(2, 'Product2', 'Electronics'),
(3, 'Product3', 'Clothing'),
(4, 'Product4', 'Clothing'),
(5,'Product5','Electronics'),
(6,'Product6','Electronics'),
(7,'Product7','Electronics'),
(8,'Product8','Decoration');

CREATE TABLE orders5_2 (
    orderID INT PRIMARY KEY,
    customerID INT,
    productID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (customerID) REFERENCES customers5_2(customerID),
    FOREIGN KEY (productID) REFERENCES products5_2(productID)
);
INSERT INTO orders5_2 VALUES 
(1, 1, 1, 2, 100.00),
(2, 1, 2, 1, 50.00),
(3, 2, 3, 3, 75.00),
(4, 3, 4, 1, 80.00),
(5, 2, 1, 3, 100.00),
(6, 2, 2, 2, 100.00) ,
(7, 3, 3, 5, 100.00),
(8, 1, 7, 3, 135.20),
(9, 1, 5, 6, 15.20),
(10, 1, 6, 1, 125.99),
(11, 1, 8, 9, 165.20) ;

CREATE TABLE employees5_2 (
    employeeID INT PRIMARY KEY,
    employeeName VARCHAR(50) NOT NULL,
    EmployeeCity VARCHAR(50) NOT NULL
);
INSERT INTO employees5_2 VALUES
(1, 'Employee1','New York'),
(2, 'Employee2','Los Angeles'),
(3,'Employee3','Ahemdabad'),
(4,'Employee4','Jaipur') ;

CREATE TABLE sales5_2 (
    saleID INT PRIMARY KEY,
    employeeID INT,
    orderID INT,
    FOREIGN KEY (employeeID) REFERENCES employees5_2(employeeID),
    FOREIGN KEY (orderID) REFERENCES orders5_2(orderID)
);
INSERT INTO sales5_2 VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5,3,10),
(6,3,9),
(7,4,8);

/* 1.	Write a SQL query to retrieve the names of all customers who have placed orders for products in the "Electronics" category, 
along with the total amount they have spent on all orders. The output should be sorted by the total amount spent in descending order.*/

SELECT c.customerName, SUM(o.quantity * o.price) AS TotalAmountSpent
FROM customers5_2 c
JOIN orders5_2 o ON c.CustomerID = o.CustomerID
JOIN Products5_2 p ON o.ProductID = p.ProductID
WHERE p.category = 'Electronics'
GROUP BY c.customerID, c.customerName
ORDER BY totalAmountSpent DESC;

/*2.	Write a SQL query to retrieve the names of all employees who have sold at least one product in the "Clothing" category, 
along with the total revenue they have generated from those sales. The output should be sorted by total revenue generated in descending order.*/

select e.employeeName, sum(o.quantity*o.price) as revenue
from employees5_2 e
join sales5_2 s on e.employeeID=s.employeeID
join orders5_2 o on o.orderID=s.orderID
JOIN products5_2 p ON o.productID = p.productID
where p.category = 'Clothing'
group by e.employeeID
order by revenue ;

/* 3.	Write a SQL query to retrieve the names of all customers who have placed orders for products in both the "Electronics" 
and "Clothing" categories. The output should only include customers who have ordered products in both categories.*/
SELECT c.customerName,c.*,p.*
FROM customers5_2 c
JOIN orders5_2 o ON c.CustomerID = o.CustomerID
JOIN Products5_2 p ON o.ProductID = p.ProductID
WHERE p.category in ('Electronics' ,'clothing')
GROUP BY c.customerID, c.customerName
HAVING count(distinct p.category) = 2
ORDER BY c.customerID;

/*4.	Write a SQL query to retrieve the names of all employees who have sold at least one product to a customer who has a 
shipping address in the same city as the employee. The output should only include employees who have made at least one such sale. */ 
SELECT DISTINCT e.EmployeeName
FROM employees5_2 e
JOIN sales5_2 s ON e.EmployeeID = s.EmployeeID
JOIN orders5_2 o ON s.OrderID = o.OrderID
JOIN customers5_2 c ON o.CustomerID = c.CustomerID
WHERE c.ShippingAddressCity = e.EmployeeCity;

/*5.	Write a SQL query to retrieve the names of all customers who have placed orders for products in the "Electronics" category,
 but have never placed an order for products in the "Clothing" category.*/
 SELECT c.customerName
FROM customers5_2 c
JOIN orders5_2 o ON c.customerID = o.customerID
JOIN products5_2 p ON o.productID = p.productID
GROUP BY c.customerID, c.customerName
HAVING SUM(CASE WHEN p.category = 'Electronics' THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN p.category = 'Clothing' THEN 1 ELSE 0 END) = 0;

 
/*6.	Write a SQL query to retrieve the names of all employees who have sold at least one product to customers 
who have placed orders for products in the "Electronics" category, but have never placed an order for products in 
the "Clothing" category. The output should only include employees who have made at least one such sale. */
SELECT DISTINCT e.employeeName
FROM employees5_2 e
JOIN sales5_2 s ON e.employeeID = s.employeeID
JOIN orders5_2 o ON s.orderID = o.orderID
JOIN customers5_2 c ON o.customerID = c.customerID
WHERE c.customerID IN (
    SELECT o.customerID
    FROM orders5_2 o
    JOIN products5_2 p ON o.productID = p.productID
    WHERE p.category = 'Electronics'
)
AND c.customerID NOT IN (
    SELECT o.customerID
    FROM orders5_2 o
    JOIN products5_2 p ON o.productID = p.productID
    WHERE p.category = 'Clothing'
);

 /* 7.	Write a SQL query to retrieve the names of all customers who have placed orders for more than five different products 
 in the "Electronics" category. */
SELECT c.customerName
FROM customers5_2 c
JOIN orders5_2 o ON c.customerID = o.customerID
JOIN products5_2 p ON o.productID = p.productID
WHERE p.category = 'Electronics'
GROUP BY c.customerID, c.customerName
HAVING COUNT(DISTINCT o.productID) > 4;

/*8.	Write a SQL query to retrieve the names of all employees who have sold products to customers who have placed orders for more than 
five different products in the "Electronics" category. The output should only include employees who have made at least one such sale.*/

SELECT DISTINCT e.employeeName
FROM employees5_2 e
JOIN sales5_2 s ON e.employeeID = s.employeeID
JOIN orders5_2 o ON s.orderID = o.orderID
WHERE o.customerID IN (
    SELECT o.customerID
    FROM orders5_2 o
    JOIN products5_2 p ON o.productID = p.productID
    WHERE p.category = 'Electronics'
    GROUP BY o.customerID
    HAVING COUNT(DISTINCT o.productID) > 4
);
