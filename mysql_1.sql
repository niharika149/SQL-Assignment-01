CREATE database Niharika;
SHOW databases;
USE Niharika;
SHOW tables;
CREATE TABLE `Niharika`.`salespeople` (
  `Snum` INT NOT NULL,
  `Sname` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Comm` VARCHAR(45) NULL,
  PRIMARY KEY (`Snum`),
  UNIQUE INDEX `Sname_UNIQUE` (`Sname`));
  INSERT INTO salesPeople (Snum, Sname, City, Comm)
VALUES(1001, 'Peel', 'London', 12);
SELECT * from salespeople;
INSERT INTO salesPeople (Snum, Sname, City, Comm)
VALUES(1002, 'Serres', 'Sanjose', 13),
(1004, 'Motika', 'London', 11),
(1007, 'Rifkin', 'Barcelona', 15),
(1003, 'Axelrod', 'Newyork', 10);
SELECT * from salespeople;
CREATE TABLE `Niharika`.`customers` (
  `Cnum` INT NOT NULL,
  `Cname` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Snum` INT NULL);
  INSERT INTO customers (Cnum, Cname, City, Snum)
VALUES (2001, 'Hoffman', 'London', 1001),
(2002, 'Giovanni', 'Rome', 1003),
(2003, 'Liu', 'Sanjose', 1002),
(2004,  'Grass', 'Berlin', 1002),
(2006, 'Clemens', 'London', 1001),
(2008, 'Cisneros', 'Sanjose', 1007),
(2007, 'Pereira', 'Rome', 1004);
SELECT * from customers;
CREATE TABLE `Niharika`.`orders` (
  `Onum` INT NOT NULL,
  `Amt` INT NULL,
  `Odate` DATE NULL,
  `Cnum` INT NULL,
  `Snum` INT NULL);
  INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum)
VALUES (3001, 18.69, '1990-10-03', 2008, 1007),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4273.00, '1990-10-05', 2006, 1001),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);
SELECT * from orders;
SELECT COUNT(*) FROM salespeople
WHERE Sname LIKE 'a%' OR Sname LIKE 'A%';
SELECT COUNT(*) FROM salespeople
WHERE City = 'Newyork';
SELECT * FROM salespeople
WHERE City = 'Newyork' OR 'Paris';
SELECT Sname, COUNT(Onum), GROUP_CONCAT(DATE(Odate)) FROM SalesPeople
JOIN Orders ON SalesPeople.Snum = Orders.Snum
GROUP BY Sname;
SELECT s.Sname, o.Amt 
from Salespeople AS s 
INNER JOIN orders AS o ON s.Snum = o.Snum 
Where o.Amt > 2000;
