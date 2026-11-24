CREATE DATABASE IF NOT EXISTS shopping_db;
USE shopping_db;
CREATE TABLE Customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(50) NOT NULL,
 city VARCHAR(30)
);
CREATE TABLE Products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50) NOT NULL,
 price DECIMAL(10,2) NOT NULL
);
CREATE TABLE Orders (
 order_id INT PRIMARY KEY,
 customer_id INT NOT NULL,
 order_date DATE,
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE OrderDetails (
 detail_id INT PRIMARY KEY,
 order_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 FOREIGN KEY (order_id) REFERENCES Orders(order_id),
 FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Customers VALUES
(1,'Arun','Chennai'),(2,'Bala','Coimbatore'),(3,'Charan','Madurai'),
(4,'Divya','Salem'),(5,'Ezhil','Trichy'),(6,'Farah','Chennai'),
(7,'Gokul','Karur'),(8,'Hari','Erode'),(9,'Indhu','Chennai'),(10,'Jeeva','Dindigul');
INSERT INTO Products VALUES
(1,'Laptop',55000),(2,'Phone',20000),(3,'Keyboard',1200),(4,'Mouse',600),
(5,'Monitor',12000),(6,'Tablet',18000),(7,'Headset',2500),(8,'Printer',9000),
(9,'Webcam',3500),(10,'USB Drive',500);
INSERT INTO Orders VALUES
(201,1,'2026-01-05'),(202,2,'2026-01-10'),(203,3,'2026-01-15'),
(204,4,'2026-02-02'),(205,5,'2026-02-08'),(206,1,'2026-02-12'),
(207,6,'2026-02-18'),(208,7,'2026-03-01'),(209,8,'2026-03-05'),
(210,9,'2026-03-12'),(211,10,'2026-03-18'),(212,2,'2026-03-20'),
(213,3,'2026-04-01'),(214,4,'2026-04-05'),(215,5,'2026-04-10');
INSERT INTO OrderDetails VALUES
(1,201,1,1),(2,201,3,2),(3,202,2,1),(4,203,5,1),
(5,204,6,1),(6,205,7,2),(7,206,2,1),(8,207,8,1),
(9,208,4,3),(10,209,1,1),(11,210,9,2),(12,211,3,4),
(13,212,5,2),(14,213,2,1),(15,214,7,1),(16,215,6,1);
SELECT c.customer_name,o.order_id,o.order_date
FROM Customers c JOIN Orders o ON c.customer_id=o.customer_id;
SELECT p.product_name,SUM(od.quantity) AS quantity_sold
FROM Products p JOIN OrderDetails od ON p.product_id=od.product_id
GROUP BY p.product_id,p.product_name;
SELECT c.customer_name,SUM(od.quantity*p.price) AS total_spending
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
JOIN OrderDetails od ON o.order_id=od.order_id
JOIN Products p ON od.product_id=p.product_id
GROUP BY c.customer_id,c.customer_name;
SELECT c.customer_name,SUM(od.quantity*p.price) AS total_spending
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
JOIN OrderDetails od ON o.order_id=od.order_id
JOIN Products p ON od.product_id=p.product_id
GROUP BY c.customer_id,c.customer_name
ORDER BY total_spending DESC LIMIT 1;
SELECT p.product_id,p.product_name
FROM Products p LEFT JOIN OrderDetails od ON p.product_id=od.product_id
WHERE od.product_id IS NULL;
SELECT c.customer_name,SUM(od.quantity*p.price) AS total_spending
FROM Customers c
JOIN Orders o ON c.customer_id=o.customer_id
JOIN OrderDetails od ON o.order_id=od.order_id
JOIN Products p ON od.product_id=p.product_id
GROUP BY c.customer_id,c.customer_name
HAVING SUM(od.quantity*p.price)>10000;
SELECT p.product_name,SUM(od.quantity) AS quantity_ordered
FROM Products p JOIN OrderDetails od ON p.product_id=od.product_id
GROUP BY p.product_id,p.product_name
ORDER BY quantity_ordered DESC LIMIT 1;
SELECT DATE_FORMAT(o.order_date,'%Y-%m') AS sales_month,
SUM(od.quantity*p.price) AS monthly_sales
FROM Orders o
JOIN OrderDetails od ON o.order_id=od.order_id
JOIN Products p ON od.product_id=p.product_id
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m')
ORDER BY sales_month;
