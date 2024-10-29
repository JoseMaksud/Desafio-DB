CREATE DATABASE Production;

USE Production;

CREATE TABLE ProductCategory (
	ProductCategoryId				INT NOT NULL AUTO_INCREMENT,
	Name							VARCHAR(100) NOT NULL,
	PRIMARY KEY(ProductCategoryId)
);

CREATE TABLE Product (
	ProductId						INT NOT NULL AUTO_INCREMENT,
	ProductCategoryId				INT NOT NULL,
	Name							VARCHAR(100) NOT NULL,
	DefaultCost						DECIMAL(6,2) NOT NULL,
	ListPrice						DECIMAL(6,2) NOT NULL,
	PRIMARY KEY(ProductId)
);

CREATE TABLE ProductInventory (
	ProductInventoryId				INT NOT NULL AUTO_INCREMENT,
	Quantity						INT NOT NULL,
	ProductId						INT NOT NULL,
	PRIMARY KEY(ProductInventoryId)
);

CREATE TABLE Customer (
    CustomerId      INT NOT NULL AUTO_INCREMENT,
    Title           VARCHAR(10),
    FirstName       VARCHAR(50) NOT NULL,
    MiddleInitial   CHAR(1),
    LastName        VARCHAR(50) NOT NULL,
    PRIMARY KEY(CustomerId)
);


INSERT INTO ProductCategory (Name)
VALUES	('Electronics'),
		('Clothing'),
		('Beverages'),
		('Food');
        
INSERT INTO Product (Name, ProductCategoryId, DefaultCost, ListPrice)
VALUES	('Smartphone', 1, 200, 400),
		('Mountain Bike Socks', 2, 8.99, 12.99),
		('PlayStation 5', 1, 499, 699),
		('Laptop', 1, 800, 1300),
		('Wireless Earbuds', 1, 50, 100),
		('Smart Watch', 1, 150, 250),
		('Action Camera', 1, 200, 350),
		('Running Shoes', 2, 60, 100),
		('Yoga Mat', 2, 20, 40),
		('Coffee Maker', 3, 40, 80),
		('Protein Powder', 4, 30, 50);

INSERT INTO ProductInventory (ProductId, Quantity)
VALUES	(1, 50),
		(2, 200),
		(3, 15),
		(4, 25),
		(5, 40),
		(6, 30),
		(7, 20),
		(8, 60),
		(9, 100),
		(10, 50),
		(11, 75);


-- 1
SELECT 
		p.Name AS ProductName, 
		pc.Name AS CategoryName, 
		pi.Quantity AS QuantityInStock
FROM Product p
INNER JOIN ProductCategory pc ON p.ProductCategoryId = pc.ProductCategoryId
INNER JOIN ProductInventory pi ON p.ProductId = pi.ProductId;

-- 2
DELETE FROM Product 
WHERE ProductCategoryId = (
    SELECT ProductCategoryId 
    FROM ProductCategory 
    WHERE Name = 'Clothing'
);

-- 3 
INSERT INTO Customer (Title, FirstName, MiddleInitial, LastName)
VALUES ('Mr.', 'José', 'F', 'Santos'),
	   ('Mr.', 'Wellis', NULL , 'Junior'),
       (NULL, 'José', 'A', 'Gallo');

SELECT
    CONCAT(
        CASE 
            WHEN Title IS NOT NULL THEN CONCAT(Title, ' ') 
            ELSE '' 
        END,
        COALESCE(FirstName, ''),
        CASE 
            WHEN MiddleInitial IS NOT NULL THEN CONCAT(' ', MiddleInitial, '.') 
            ELSE '' 
        END,
        CASE 
            WHEN LastName IS NOT NULL THEN CONCAT(' ', LastName) 
            ELSE '' 
        END
    ) AS NomeCompleto
FROM Customer;
