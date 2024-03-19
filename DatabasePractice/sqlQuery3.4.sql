create database sqlQuery3_4;
/*																		Case 1
Assume you are working on a database for a car dealership. The database contains the following tables:
 
Table: Cars
 
CarID (int, PK)
Brand (varchar(50))
Model (varchar(50))
Year (int)
Mileage (int)
Price (decimal(10,2))
Available (bit)

Table: Customers
CustomerID (int, PK)
FirstName (varchar(50))
LastName (varchar(50))
Email (varchar(100))
PhoneNumber (varchar(20))

Table: Sales 
SaleID (int, PK)
CarID (int, FK to Cars.CarID)
CustomerID (int, FK to Customers.CustomerID)
SaleDate (date)
SalePrice (decimal(10,2))

*/

use sqlQuery3_4;
create table Cars(
	carID int primary key,
    brand varchar(50),
    model varchar(50),
    year int,
    mileage int,
    price decimal(10,2),
    available bit
);
INSERT INTO Cars (CarID, Brand, Model, Year, Mileage, Price, Available) VALUES
(1, 'Toyota', 'Corolla', 2018, 25000, 15000.00, 1),
(2, 'Honda', 'Civic', 2019, 20000, 18000.00, 1),
(3, 'Ford', 'Mustang', 2017, 15000, 25000.00, 1),
(4, 'Chevrolet', 'Camaro', 2020, 10000, 30000.00, 0),
(5, 'Tesla', 'Model S', 2021, 5000, 80000.00, 1),
(6, 'Toyota', 'Camry', 2019, 18000, 20000.00, 1),
(7, 'Honda', 'Accord', 2020, 15000, 22000.00, 1),
(8, 'Ford', 'Fusion', 2018, 20000, 18000.00, 0),
(9, 'Chevrolet', 'Malibu', 2021, 12000, 25000.00, 1),
(10, 'Tesla', 'Model 3', 2022, 8000, 45000.00, 1),
(11, 'BMW', '3 Series', 2020, 10000, 40000.00, 1),
(12, 'Audi', 'A4', 2021, 9000, 42000.00, 1),
(13, 'Mercedes-Benz', 'C-Class', 2019, 15000, 38000.00, 0),
(14, 'Lexus', 'ES', 2020, 12000, 35000.00, 1),
(15, 'Hyundai', 'Sonata', 2017, 25000, 15000.00, 1);


CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    PhoneNumber varchar(20)
);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES

(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '555-123-4567'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', '444-567-8901'),
(5, 'David', 'Lee', 'david.lee@example.com', '222-333-4444'),
(6, 'Bob', 'Lee', 'bob.lee@example.com', '888-333-4444');

CREATE TABLE Sales (
    SaleID int PRIMARY KEY,
    CarID int,
    CustomerID int,
    SaleDate date,
    SalePrice decimal(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Sales 
(SaleID, CarID, CustomerID, SaleDate, SalePrice)
VALUES
(1, 1, 1, '2023-01-15', 14000.00),
(2, 2, 2, '2023-02-20', 16000.00),
(3, 3, 3, '2023-03-25', 23000.00),
(4, 4, 4, '2023-04-10', 28000.00),
(5, 5, 5, '2023-05-12', 75000.00),
(6, 6, 1, '2023-06-01', 18000.00),
(7, 7, 2, '2023-06-05', 22000.00),
(8, 8, 3, '2023-06-10', 18000.00),
(9, 9, 4, '2023-06-15', 25000.00),
(10, 10, 5, '2023-06-20', 45000.00),
(11,15,6,'2021-10-31',15000);


/*1.	Retrieve the top 10 most expensive cars from the Cars table.*/
select * from Cars 
order by price desc 
limit 10;

/*2.	Retrieve the average price of all available cars from the Cars table.*/
SELECT AVG(Price) AS AveragePrice
FROM Cars
WHERE Available = 1;

/*3.	Retrieve the list of customers who have purchased a car, along with the total number of cars each customer has purchased.*/
select c.FirstName,c.LastName,count(s.saleId) as total_Count
 from Customers c 
 right join sales s on c.CustomerID=s.CustomerID 
 group by s.CustomerID;
 
/*4.	Retrieve the list of customers who have not yet made a purchase.*/
select * 
from Customers 
where CustomerId not in 
(select CustomerID
 from sales );
 /*SELECT c.* FROM Customers c LEFT JOIN Sales s ON c.CustomerID = s.CustomerID WHERE s.CustomerID IS NULL;*/

/*5.	Insert a new car into the Cars table with the following information: Brand='Toyota', Model='Corolla', Year=2022, Mileage=0, Price=20000, Available=1.*/
INSERT INTO Cars (CarID,Brand, Model, Year, Mileage, Price, Available) 
VALUES (16,'Toyota', 'Corolla', 2022, 0, 20000, 1);

/*7.	Delete all sales from the Sales table that occurred before January 1, 2022.*/
DELETE FROM Sales WHERE SaleDate < '2022-01-01' AND SaleID <> 0;


