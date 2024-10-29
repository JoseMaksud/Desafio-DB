CREATE DATABASE Production;

USE Production;

CREATE TABLE Product (
	ProductId						INT NOT NULL AUTO_INCREMENT,
	Name							VARCHAR(100) NOT NULL,
	DefaultCost						DECIMAL(6,2) NOT NULL,
	ListPrice						DECIMAL(6,2) NOT NULL,
	PRIMARY KEY(ProductId)
);

SET SQL_SAFE_UPDATES = 0;

-- 1
INSERT INTO Product (Name, DefaultCost, ListPrice)
VALUES ('Smartphone', 200.00, 400.00),
	   ('Mountain Bike Socks', 10.00, 20.00);

-- 2
UPDATE Product
SET ListPrice = 15.00
WHERE Name = 'Mountain Bike Socks';

-- 3
SELECT Name, ListPrice
FROM Product
ORDER BY ListPrice DESC
LIMIT 5;