CREATE DATABASE IF NOT EXISTS ai_sql_db;
USE ai_sql_db;
CREATE TABLE Departments (
 department_id INT PRIMARY KEY,
 department_name VARCHAR(50) NOT NULL
);
CREATE TABLE Employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50) NOT NULL,
 department_id INT,
 salary DECIMAL(10,2),
 FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
INSERT INTO Departments VALUES
(1,'Engineering'),(2,'HR'),(3,'Finance'),(4,'Sales');
INSERT INTO Employees VALUES
(101,'Arun',1,50000),(102,'Bala',1,60000),(103,'Charan',1,55000),
(104,'Divya',2,40000),(105,'Ezhil',2,42000),(106,'Farah',3,65000),
(107,'Gokul',3,70000),(108,'Hari',4,35000);
SELECT e.employee_name,d.department_name
FROM Employees e JOIN Departments d
ON e.department_id=d.department_id;
SELECT d.department_name,AVG(e.salary) AS average_salary
FROM Departments d JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name;
SELECT d.department_name,COUNT(e.employee_id) AS employee_count
FROM Departments d LEFT JOIN Employees e
ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name
HAVING COUNT(e.employee_id)>3;
SELECT employee_id,employee_name,salary
FROM Employees
WHERE salary>(SELECT AVG(salary) FROM Employees);
SELECT e.employee_name,d.department_name
FROM Employees e JOIN Departments d
ON e.employee_id=d.department_id;
SELECT e.employee_name,d.department_name
FROM Employees e JOIN Departments d
ON e.department_id=d.department_id;
