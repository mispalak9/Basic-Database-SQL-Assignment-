-- Day4, Assignment1
CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(255),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight DECIMAL(5,2),
    ShipName VARCHAR(255)
);

INSERT INTO orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName)
VALUES (11077, 'RATTC', 1, '1998-06-05', '1998-06-03', NULL, 2, 8.53, 'Rattlesnake Car'),
(11076, 'BONAP', 4, '1998-06-05', '1998-06-03', NULL, 2, 38.28, 'Bon app'),
(11075, 'RICSU', 8, '1998-06-05', '1998-06-03', NULL, 2, 6.19, 'Richter Superm'),
(11074, 'SIMOB', 7, '1998-06-05', '1998-06-03', NULL, 2, 18.44, 'Simons bistro');

SELECT *
FROM orders
WHERE OrderDate = (SELECT MAX(OrderDate) FROM orders);


-- Assignment 2
-- Create suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    contact_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    postal_code VARCHAR(255),
    country VARCHAR(255),
    phone VARCHAR(255)
);

INSERT INTO suppliers (supplier_id, supplier_name, contact_name, address, city, postal_code, country, phone)
VALUES (1, 'Palak', 'Mishra', 'AP', 'KKD', '533437', 'India', '809-246-6408'),
(2, 'Miya', 'Jiya', 'MP', 'Punjab', '123456', 'USA', '171-555-2222'),
(3, 'Tiya', 'Niya', 'London', 'USA', '987654', 'UK', '1-504-555-4822');

-- Create orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(255),
    supplier_id INT,
    order_date DATE,
    ship_date DATE,
    freight DECIMAL(5,2),
    ship_name VARCHAR(255)
);

INSERT INTO orders (order_id, customer_id, supplier_id, order_date, ship_date, freight, ship_name)
VALUES (1, 'Riya', 1, '1996-07-04', '1996-07-16', 32.38, 'ABC'),
(2, 'Riya', 4, '1997-08-05', '1996-07-10', 11.61, 'DEF'),
(3, 'Riya', 3, '1998-09-06', '1996-07-12', 65.83, 'GHI');

SELECT *
FROM suppliers s
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.supplier_id = s.supplier_id
);


-- Assignment 3
SELECT *
FROM suppliers s
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.supplier_id = s.supplier_id
);

-- Assignment 4
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Inserting data into Customers table
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'A1'),
(2, 'B1'),
(3, 'C1');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting data into Orders table
INSERT INTO Orders (OrderID, CustomerID) VALUES
(101, 1),
(102, 1),
(103, 2),
(104, 3);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(4, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, UnitPrice, Quantity, Discount) VALUES
(201, 101, 10.00, 2, 0.05),
(202, 101, 20.00, 1, 0.00),
(203, 102, 15.00, 3, 0.10),
(204, 103, 25.00, 1, 0.00),
(205, 104, 30.00, 2, 0.15),
(206, 104, 12.00, 4, 0.00);

SELECT
    c.CustomerID,
    c.CustomerName,
    MAX(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS MostExpensivePurchase
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID, c.CustomerName;
    
    
    -- Assignment 5
    -- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255)
);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, firstname, lastname)
VALUES 
(1, 'A', 'A1'), 
(2, 'B', 'B1');

-- Create Employee_Temp table
CREATE TABLE Employee_Temp (
    firstname VARCHAR(255),
    lastname VARCHAR(255)
);

-- Insert data from Employees table into Employee_Temp table
INSERT INTO Employee_Temp (firstname, lastname)
SELECT firstname, lastname FROM Employees;

-- Execute a query to confirm the data transfer
SELECT * FROM Employee_Temp;
