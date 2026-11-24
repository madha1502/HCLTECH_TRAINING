CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;
CREATE TABLE Students (
 student_id INT PRIMARY KEY,
 student_name VARCHAR(50) NOT NULL,
 department VARCHAR(30),
 age INT,
 marks DECIMAL(5,2),
 city VARCHAR(30)
);
INSERT INTO Students VALUES
(101,'Arun','CSE',20,85.50,'Chennai'),
(102,'Bala','IT',21,78.00,'Coimbatore'),
(103,'Anitha','AIDS',19,92.00,'Madurai'),
(104,'Kumar','CSE',22,68.50,'Salem'),
(105,'Divya','ECE',20,88.00,'Chennai'),
(106,'Ajay','IT',21,74.50,'Trichy'),
(107,'Ravi','AIDS',23,81.00,'Erode'),
(108,'Akash','CSE',20,95.00,'Karur'),
(109,'Meena','ECE',19,72.00,'Palani'),
(110,'Anand','IT',22,89.50,'Dindigul');
SELECT * FROM Students;
SELECT * FROM Students WHERE department='CSE';
SELECT * FROM Students WHERE marks BETWEEN 70 AND 90;
SELECT * FROM Students WHERE department IN ('CSE','IT','AIDS');
SELECT * FROM Students WHERE student_name LIKE 'A%';
UPDATE Students SET marks=90.00 WHERE student_id=102;
DELETE FROM Students WHERE student_id=109;
SELECT * FROM Students WHERE age>20;
