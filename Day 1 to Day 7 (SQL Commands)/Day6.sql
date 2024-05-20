-- Day 6, Assignment 1
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, FullName, Address, City, Region, PostalCode, Country, Phone)
VALUES 
    (1, 'A', 'Delhi', 'City1', 'Region1', '12345', 'USA', '555-1234'),
    (2, 'B', 'Mumbai', 'City2', 'Region2', '67890', 'Canada', '555-5678'),
    (3, 'C', 'Pune', 'City3', 'Region3', '13579', 'India', '555-9876'),
    (4, 'D', 'Noida', 'City4', 'Region4', '13578', 'Australia', '555-9872'),
    (5, 'E', 'Hyderabad', 'City5', 'Region5', '13574', 'Europe', '555-9870');

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, FullName, Address, City, Region, PostalCode, Country, Phone)
VALUES 
    (1, 'A1', 'Jaipur', 'City6', 'Region6', '24680', 'Algeria', '555-1111'),
    (2, 'B1', 'Bengaluru', 'city7', 'Region7', '36912', 'New Zealand', '555-2222'),
    (3, 'C1', 'Visakhapatnam', 'city8', 'Region8', '75319', 'Albania', '555-3333'),
    (4, 'D1', 'Bhopal', 'city9', 'Region9', '75311', 'Armenia', '555-4444'),
    (5, 'E1', 'Chennai', 'city10', 'Region10', '75315', 'Afghanistan', '555-5555');

-- Query to display unique customer's as well as employees' FullName, Address, City, Region, PostalCode, Country, and Phone whose names start with the character 'A'
SELECT FullName, Address, City, Region, PostalCode, Country, Phone
FROM (
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Customers
    WHERE FullName LIKE 'A%'
    UNION
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Employees
    WHERE FullName LIKE 'A%'
) AS CombinedResults;


-- Assignment 2
SELECT FullName, Address, City, Region, PostalCode, Country, Phone
FROM (
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Customers
    WHERE Country = 'India'
    UNION
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Employees
    WHERE Country = 'India'
) AS IndianResidents;
