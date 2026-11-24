CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;
CREATE TABLE Departments (
 department_id INT PRIMARY KEY,
 department_name VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50) NOT NULL,
 salary DECIMAL(10,2),
 department_id INT,
 email VARCHAR(100) UNIQUE,
 age INT,
 FOREIGN KEY (department_id) REFERENCES Departments(department_id),
 CHECK (salary>0)
);
INSERT INTO Departments VALUES
(1,'Engineering'),(2,'Human Resources'),(3,'Finance'),(4,'Sales'),(5,'Marketing');
INSERT INTO Employees VALUES
(101,'Arun',45000,1,'arun@mail.com',24),
(102,'Bala',38000,2,'bala@mail.com',26),
(103,'Charan',52000,1,'charan@mail.com',28),
(104,'Divya',41000,3,'divya@mail.com',25),
(105,'Ezhil',35000,4,'ezhil@mail.com',23),
(106,'Farah',48000,5,'farah@mail.com',27),
(107,'Gokul',60000,1,'gokul@mail.com',30),
(108,'Hari',39000,2,'hari@mail.com',24),
(109,'Indhu',43000,3,'indhu@mail.com',26),
(110,'Jeeva',37000,4,'jeeva@mail.com',25);
SELECT e.employee_id,e.employee_name,d.department_name
FROM Employees e JOIN Departments d ON e.department_id=d.department_id;
UPDATE Employees SET department_id=5 WHERE employee_id=105;
SELECT * FROM Employees WHERE employee_id=105;
