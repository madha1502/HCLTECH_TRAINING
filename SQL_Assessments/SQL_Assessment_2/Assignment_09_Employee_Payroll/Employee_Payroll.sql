CREATE DATABASE IF NOT EXISTS payroll_db;
USE payroll_db;
CREATE TABLE Departments (
 department_id INT PRIMARY KEY,
 department_name VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50) NOT NULL,
 department_id INT,
 salary DECIMAL(10,2) NOT NULL,
 email VARCHAR(100) UNIQUE,
 CHECK (salary>0),
 FOREIGN KEY (department_id) REFERENCES Departments(department_id)
 ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Departments VALUES
(1,'Engineering'),(2,'HR'),(3,'Finance'),(4,'Sales');
INSERT INTO Employees VALUES
(101,'Arun',1,50000,'arun@company.com'),
(102,'Bala',1,65000,'bala@company.com'),
(103,'Charan',2,35000,'charan@company.com'),
(104,'Divya',3,55000,'divya@company.com'),
(105,'Ezhil',4,40000,'ezhil@company.com'),
(106,'Farah',2,45000,'farah@company.com');
CREATE VIEW EmployeePayroll AS
SELECT e.employee_id,e.employee_name,d.department_name,e.salary,e.email
FROM Employees e JOIN Departments d ON e.department_id=d.department_id;
SELECT * FROM EmployeePayroll;
SELECT * FROM Employees
WHERE salary>(SELECT AVG(salary) FROM Employees);
UPDATE Departments SET department_id=10 WHERE department_id=1;
SELECT * FROM Employees WHERE department_id=10;
DELETE FROM Departments WHERE department_id=4;
SELECT * FROM Employees;
