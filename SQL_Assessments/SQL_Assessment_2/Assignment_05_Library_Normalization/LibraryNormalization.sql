CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;
CREATE TABLE Members (
 member_id INT PRIMARY KEY,
 member_name VARCHAR(50) NOT NULL
);
CREATE TABLE Books (
 book_id VARCHAR(10) PRIMARY KEY,
 book_name VARCHAR(100) NOT NULL,
 author VARCHAR(50) NOT NULL
);
CREATE TABLE BorrowRecords (
 borrow_id INT PRIMARY KEY,
 member_id INT NOT NULL,
 book_id VARCHAR(10) NOT NULL,
 borrow_date DATE,
 FOREIGN KEY (member_id) REFERENCES Members(member_id),
 FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Members VALUES (101,'Arun'),(102,'Kumar'),(103,'Ravi');
INSERT INTO Books VALUES
('B01','Java','James'),('B02','SQL','David'),('B03','Python','John');
INSERT INTO BorrowRecords VALUES
(1,101,'B01','2026-01-05'),(2,101,'B02','2026-01-08'),
(3,102,'B02','2026-01-10'),(4,102,'B03','2026-01-15'),
(5,103,'B01','2026-01-20');
SELECT m.member_name,b.book_name,b.author,br.borrow_date
FROM BorrowRecords br
JOIN Members m ON br.member_id=m.member_id
JOIN Books b ON br.book_id=b.book_id;
SELECT '1NF: Store atomic values and remove repeating groups.' AS explanation;
SELECT '2NF: Be in 1NF and remove partial dependency on a composite key.' AS explanation;
SELECT '3NF: Be in 2NF and remove transitive dependency between non-key columns.' AS explanation;
