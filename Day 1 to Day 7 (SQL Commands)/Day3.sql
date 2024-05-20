-- Day 1, Assignment 1-------------------------------------------------------------------
create database northwind;
use northwind;

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50)
);

-- Insert values into Employees table
INSERT INTO Employees (EmployeeID, FirstName) VALUES
(1, 'Nancy'),
(2, 'Andrew'),
(3, 'Janet'),
(4, 'Margaret'),
(5, 'Steven'),
(6, 'Michael'),
(7, 'Robert'),
(8, 'Laura'),
(9, 'Anne');

select * from employees;

SELECT Employees.EmployeeID, Employees.FirstName, Orders.NumberOfOrders
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;


-- Assignment 2-------------------------------------------------------------------
--  Create Orderd Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(5),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight DECIMAL(10, 2),
    ShipName VARCHAR(100),
    ShipAddress VARCHAR(100),
    ShipCity VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID)
);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity)
VALUES (10643, 'ALFKI', 6, '25/08/1997', '22/09/1997', '02/09/1997', 1, 29.46, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin'),
       (10702, 'ALFKI', 4, '13/10/1997', '24/11/1997', '21/10/1997', 1, 23.94, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin'),
       (10952, 'ALFKI', 1, '16/03/1998', '27/04/1998', '24/03/1998', 1, 40.42, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin'),
       (11011, 'ALFKI', 3, '09/04/1998', '07/05/1998', '13/04/1998', 1, 1.21, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin');

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(100),
    City VARCHAR(50)
);

-- Insert values into Customers Table
INSERT INTO Customers (CustomerID, CompanyName, City)
VALUES ('ALFKI', 'Alfreds Futterkiste', 'Berlin');

-- Create Shippers Table
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

-- Insert values into Shippers Table
INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (1, 'Speedy Express');

-- Execution
SELECT 
    O.OrderID,
    O.CustomerID,
    O.EmployeeID,
    O.OrderDate, 
    O.RequiredDate, 
    O.ShippedDate, 
    O.ShipVia, 
    O.Freight, 
    O.ShipName, 
    O.ShipAddress, 
    O.ShipCity
FROM 
    Orders O
INNER JOIN 
    Customers C ON O.CustomerID = C.CustomerID
INNER JOIN 
    Shippers S ON O.ShipVia = S.ShipperID
WHERE 
    S.CompanyName = 'Speedy Express' AND C.City = 'Berlin';
    
    
-- Assignment 3--------------------------------------------------------------------------------------
-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Insert values into Suppliers Table
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'P&G'),
(2, 'Nord-Ost-Fisch Handelsgesellschaft'),
(3, 'Refrescos Americanas LTDA'),
(4, 'Escargots Nouveaux'),
(5, 'Cooperativa de Quesos Las Cabras'),
(6, 'Aux joyeux ecclesiastiques'),
(7, 'Forets d\'erables'),
(8, 'Gai paturage'),
(9, 'Lyngbysild'),
(10, 'Ma Maison'),
(11, 'Zaanse Snoepfabriek'),
(12, 'New England Seafood Cannery'),
(13, 'Pasta Buttini s.r.l.'),
(14, 'PB Knackebrod AB'),
(15, 'Norske Meierier'),
(16, 'Tokyo Traders'),
(17, 'Svensk Sjofoda AB'),
(18, 'Mayumi\'s'),
(19, 'Leka Trading'),
(20, 'G\'day, Mate'),
(21, 'Grandma Kelly\'s Homestead'),
(22, 'Heli Suswaren GmbH & Co. KG'),
(23, 'Karkki Oy'),
(24, 'Formaggi Fortini s.r.l.'),
(25, 'Exotic Liquids'),
(26, 'Bigfoot Breweries'),
(27, 'Specialty Biscuits, Ltd.'),
(28, 'New Orleans Cajun Delights Pavlova, Ltd.'),
(29, 'Plutzer Lebensmittelgrosmarkte AG');

-- Insert Values into Products Table
INSERT INTO Products (ProductID, SupplierID) VALUES
(1, 2), -- Nord-Ost-Fisch Handelsgesellschaft has 1 product
(2, 3), -- Refrescos Americanas LTDA has 1 product
(3, 4), -- Escargots Nouveaux has 1 product
(4, 5), (5, 5), -- Cooperativa de Quesos Las Cabras has 2 products
(6, 6), (7, 6), -- Aux joyeux ecclesiastiques has 2 products
(8, 7), (9, 7), -- Forets d'erables has 2 products
(10, 8), (11, 8), -- Gai paturage has 2 products
(12, 9), (13, 9), -- Lyngbysild has 2 products
(14, 10), (15, 10), -- Ma Maison has 2 products
(16, 11), (17, 11), -- Zaanse Snoepfabriek has 2 products
(18, 12), (19, 12), -- New England Seafood Cannery has 2 products
(20, 13), (21, 13), -- Pasta Buttini s.r.l. has 2 products
(22, 14), (23, 14), -- PB Knackebrod AB has 2 products
(24, 15), (25, 15), (26, 15), -- Norske Meierier has 3 products
(27, 16), (28, 16), (29, 16), -- Tokyo Traders has 3 products
(30, 17), (31, 17), (32, 17), -- Svensk Sjofoda AB has 3 products
(33, 18), (34, 18), (35, 18), -- Mayumi's has 3 products
(36, 19), (37, 19), (38, 19), -- Leka Trading has 3 products
(39, 20), (40, 20), (41, 20), -- G'day, Mate has 3 products
(42, 21), (43, 21), (44, 21), -- Grandma Kelly's Homestead has 3 products
(45, 22), (46, 22), (47, 22), -- Heli Suswaren GmbH & Co. KG has 3 products
(48, 23), (49, 23), (50, 23), -- Karkki Oy has 3 products
(51, 24), (52, 24), (53, 24), -- Formaggi Fortini s.r.l. has 3 products
(54, 25), (55, 25), (56, 25), -- Exotic Liquids has 3 products
(57, 26), (58, 26), (59, 26), (60, 26), -- Bigfoot Breweries has 4 products
(61, 27), (62, 27), (63, 27), (64, 27), -- Specialty Biscuits, Ltd. has 4 products
(65, 28), (66, 28), (67, 28), (68, 28), (69, 28), -- New Orleans Cajun Delights Pavlova, Ltd. has 5 products
(70, 29), (71, 29), (72, 29), (73, 29), (74, 29); -- Plutzer Lebensmittelgrosmarkte AG has 5 products
    

SELECT COUNT(Products.ProductID) AS ProductCount, Suppliers.SupplierName
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.SupplierName;


-- Assignment 4----------------------------------------------------------------------------------
-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    ReportsTo INT,
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, FirstName, ReportsTo) VALUES
(1, 'Nancy Davolio', 2),
(2, 'Andrew Fuller', NULL),
(3, 'Janet Leverling', 2),
(4, 'Margaret Peacock', 2),
(5, 'Steven Buchanan', 2),
(6, 'Michael Suyama', 5),
(7, 'Robert King', 5),
(8, 'Laura Callahan', 2),
(9, 'Anne Dodsworth', 5),
(10, 'Aamir Khan', 2);
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS=0;

SELECT E1.FirstName AS EmployeeName, E2.FirstName AS BossName
FROM Employees E1
JOIN Employees E2 ON E1.ReportsTo = E2.EmployeeID;