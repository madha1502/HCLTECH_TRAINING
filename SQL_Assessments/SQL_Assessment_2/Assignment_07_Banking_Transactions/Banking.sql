CREATE DATABASE IF NOT EXISTS bank_db;
USE bank_db;
CREATE TABLE Accounts (
 account_id INT PRIMARY KEY,
 account_holder VARCHAR(50) NOT NULL,
 balance DECIMAL(12,2) NOT NULL CHECK (balance>=0)
);
INSERT INTO Accounts VALUES
(101,'Arun',25000),(102,'Bala',18000),(103,'Charan',32000),
(104,'Divya',45000),(105,'Ezhil',15000);
SELECT * FROM Accounts;
START TRANSACTION;
UPDATE Accounts SET balance=balance-5000
WHERE account_id=101 AND balance>=5000;
UPDATE Accounts SET balance=balance+5000 WHERE account_id=102;
COMMIT;
SELECT * FROM Accounts;
START TRANSACTION;
UPDATE Accounts SET balance=balance-2000 WHERE account_id=103;
UPDATE Accounts SET balance=balance+2000 WHERE account_id=104;
ROLLBACK;
SELECT * FROM Accounts;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT * FROM Accounts WHERE account_id=101 FOR UPDATE;
COMMIT;
