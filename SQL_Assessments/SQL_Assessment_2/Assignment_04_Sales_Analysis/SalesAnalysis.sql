CREATE DATABASE IF NOT EXISTS retail_db;
USE retail_db;
CREATE TABLE Sales (
 sale_id INT PRIMARY KEY,
 product_name VARCHAR(50),
 category VARCHAR(30),
 quantity INT,
 price DECIMAL(10,2),
 sale_date DATE
);
INSERT INTO Sales VALUES
(1,'Laptop','Electronics',2,55000,'2026-01-05'),
(2,'Phone','Electronics',3,20000,'2026-01-08'),
(3,'Keyboard','Accessories',5,1200,'2026-01-12'),
(4,'Chair','Furniture',4,4500,'2026-01-15'),
(5,'Table','Furniture',2,8000,'2026-01-18'),
(6,'Monitor','Electronics',2,12000,'2026-02-02'),
(7,'Mouse','Accessories',8,600,'2026-02-05'),
(8,'Desk','Furniture',3,9000,'2026-02-10'),
(9,'Tablet','Electronics',2,18000,'2026-02-14'),
(10,'Headset','Accessories',6,2500,'2026-02-20'),
(11,'Sofa','Furniture',1,30000,'2026-03-01'),
(12,'Camera','Electronics',1,42000,'2026-03-04'),
(13,'USB Drive','Accessories',10,500,'2026-03-09'),
(14,'Bookshelf','Furniture',2,7000,'2026-03-15'),
(15,'Smart Watch','Electronics',3,9000,'2026-03-20');
SELECT COUNT(*) AS total_sales FROM Sales;
SELECT SUM(quantity*price) AS total_revenue FROM Sales;
SELECT AVG(price) AS average_price FROM Sales;
SELECT MAX(price) AS highest_price,MIN(price) AS lowest_price FROM Sales;
SELECT category,SUM(quantity*price) AS total_revenue
FROM Sales GROUP BY category;
SELECT category,SUM(quantity*price) AS total_revenue
FROM Sales GROUP BY category HAVING SUM(quantity*price)>50000;
SELECT category,SUM(quantity) AS products_sold
FROM Sales GROUP BY category;
SELECT category,AVG(price) AS average_price
FROM Sales GROUP BY category HAVING AVG(price)>5000;
