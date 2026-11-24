CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;
CREATE TABLE Customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50) NOT NULL,
 city VARCHAR(30)
);
CREATE TABLE Orders (
 order_id INT PRIMARY KEY,
 customer_id INT,
 order_date DATE,
 total_amount DECIMAL(10,2),
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
INSERT INTO Customers VALUES
(1,'Arun','Chennai'),(2,'Bala','Coimbatore'),(3,'Charan','Madurai'),
(4,'Divya','Salem'),(5,'Ezhil','Trichy');
INSERT INTO Orders VALUES
(201,1,'2026-01-10',2500),(202,1,'2026-01-15',1800),
(203,2,'2026-02-02',3200),(204,3,'2026-02-10',1500),
(205,3,'2026-02-18',4500),(206,4,'2026-03-01',2100),
(207,2,'2026-03-05',900),(208,4,'2026-03-12',1700);
SELECT c.customer_name,o.order_id,o.total_amount
FROM Customers c INNER JOIN Orders o ON c.customer_id=o.customer_id;
SELECT c.customer_name,o.order_id,o.total_amount
FROM Customers c LEFT JOIN Orders o ON c.customer_id=o.customer_id;
SELECT c.customer_name,o.order_id,o.total_amount
FROM Customers c RIGHT JOIN Orders o ON c.customer_id=o.customer_id;
SELECT c.customer_name,o.order_id,o.total_amount
FROM Customers c LEFT JOIN Orders o ON c.customer_id=o.customer_id
UNION
SELECT c.customer_name,o.order_id,o.total_amount
FROM Customers c RIGHT JOIN Orders o ON c.customer_id=o.customer_id;
SELECT c.customer_name FROM Customers c
LEFT JOIN Orders o ON c.customer_id=o.customer_id
WHERE o.order_id IS NULL;
SELECT c.customer_name,COALESCE(SUM(o.total_amount),0) AS total_orders
FROM Customers c LEFT JOIN Orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.customer_name;
