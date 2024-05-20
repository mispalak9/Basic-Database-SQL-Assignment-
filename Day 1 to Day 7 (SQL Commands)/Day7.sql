-- Day 7
-- Create suppliers table
CREATE TABLE suppliers (
    supplierID INT PRIMARY KEY,
    supplierName VARCHAR(255)
);

-- Create products table
CREATE TABLE products (
    productID INT PRIMARY KEY,
    productName VARCHAR(255),
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES suppliers(supplierID)
);

-- Create orders table
CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    supplierID INT,
    employeeID INT,
    orderDate DATE,
    discount DECIMAL(5,2),
    FOREIGN KEY (supplierID) REFERENCES suppliers(supplierID)
);


-- Assignment 1
-- Insert two suppliers in suppliers table
INSERT INTO suppliers (supplierID, supplierName) VALUES (1, 'Supplier 1'), (2, 'Supplier 2');

SELECT * FROM suppliers;


-- Assignment 2
-- Insert product in products table for specific suppliers
INSERT INTO products (productID, productName, supplierID) VALUES (1, 'Product 1', 1), (2, 'Product 2', 2);

SELECT * FROM products;


-- Assignment 3
-- Place orders for one supplier's products
INSERT INTO orders (orderID, supplierID, employeeID, orderDate, discount) VALUES (1, 1, 1, '2022-01-01', 0.00), (2, 2, 2, '1997-07-07', 0.00);

SELECT * FROM orders;


-- Assignment 4
-- Update employeeID of orders table for specific supplier's one product
UPDATE orders SET employeeID = 2 WHERE supplierID = 1 AND orderID = 1;

SELECT * FROM orders WHERE supplierID = 1 AND orderID = 1;


-- -- Assignment 5
-- Update discount in order for specific supplier's one product who placed order in July, 1997
UPDATE orders SET discount = 0.10 WHERE supplierID = 1 AND MONTH(orderDate) = 7 AND YEAR(orderDate) = 1997;

SELECT * FROM orders WHERE supplierID = 1 AND MONTH(orderDate) = 7 AND YEAR(orderDate) = 1997;


-- -- Assignment 6
-- Remove order and its details for specific supplier's one product
DELETE FROM orders WHERE supplierID = 1 AND orderID = 1;

SELECT * FROM orders;
