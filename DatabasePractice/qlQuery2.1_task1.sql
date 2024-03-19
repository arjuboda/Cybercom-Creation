/*1.	Create a database structure for employee leave application. It should include all the employee's information as well as their leave information. */

create database companyInformation;
use companyInformation;

CREATE TABLE Employes (
    employeeID INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(100)
    );
    
    insert into Employes (employee_name,email,department)
    values('Arju','arju@gmail.com','developement'),
    ('Riya','riya@gmail.com','HR'),
    ('David Lee', 'david@example.com', 'Finance'),
   ('Alice', 'alice@example.com', 'Marketing');
select * from employes;


-- leave record table

CREATE TABLE LeaveRecords (
	leaveID INT PRIMARY KEY AUTO_INCREMENT,
     employeID INT,
     date DATE NOT NULL,
     numberOfDays int NOT NULL,
     reason VARCHAR(255),
     FOREIGN KEY (employeID) REFERENCES Employes(employeeID)
 );

 INSERT INTO LeaveRecords (employeID, date, numberOfDays, reason)
 VALUES 
 (1, '2024-03-10', '2', 'Vacation'),
 (2, '2024-03-15', '4', 'Sick Leave'), 
 (3, '2024-03-20', '1', 'Family Emergency');

select * from LeaveRecords;
 
 -- display employes data who has taken leave 
SELECT E.employeeID, E.employee_name, E.email, E.department, L.leaveID, L.date, L.numberOfDays, L.reason
FROM Employes E
Right JOIN LeaveRecords L ON E.employeeID = L.employeID;
