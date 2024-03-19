/*
2.	Create a database structure for students and its college. One student can be on one college only. 
*/

create database college;
use college;

-- college table 
CREATE TABLE Colleges (
    college_id INT PRIMARY KEY AUTO_INCREMENT,
    college_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

insert into colleges
(college_name,location)
values
('Marwadi University','Rajkot'),
('GTU','Gandhinagar'),
('Darshan University', 'Rajkot');

select * from colleges;


-- student table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    college_id INT,
    FOREIGN KEY (college_id) REFERENCES Colleges(college_id)
);

insert into Students
(student_name,age,gender,college_id)
values
('Arju','21','Female','1'),
('Arjun','19','Male','2'),
('Khusi','20','Female','3'),
('joli','21','Female','2');
select * from Students;

-- finle result 
SELECT Students.student_id, Students.student_name, Students.age, Students.gender, Colleges.college_name, Colleges.location
FROM Students
INNER JOIN Colleges ON Students.college_id = Colleges.college_id;


