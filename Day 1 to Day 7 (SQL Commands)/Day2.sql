-- Day 2
create database northwind;
use northwind;
-- Create employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    title VARCHAR(50),
    department VARCHAR(50)
);

-- Insert data into employee table
INSERT INTO employee VALUES (1, 'Riya', 'Khan', 'Sales Representative', 'Sales');
INSERT INTO employee VALUES (2, 'Mia', 'Singh', 'Sales Manager', 'Sales');
INSERT INTO employee VALUES (3, 'Sara', 'Sharma', 'Developer', 'IT');
INSERT INTO employee VALUES (4, 'Maya', 'Mishra', 'Developer', 'IT');

set @start_time = CURRENT_TIMESTAMP;

-- Place your query here
SELECT * FROM employees;

set @end_time = CURRENT_TIMESTAMP; 
select TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time);

select * from employee;

-- Create product table
CREATE TABLE product (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price DECIMAL(10, 2),
    units_in_stock INT
);

-- Insert data into products table
INSERT INTO product VALUES (1, 'Product 1', 10.00, 100);
INSERT INTO product VALUES (2, 'Product 2', 20.00, 200);
INSERT INTO product VALUES (3, 'Product 3', 30.00, 300);
INSERT INTO product VALUES (4, 'Product 4', 40.00, 400);

set @start_time = CURRENT_TIMESTAMP;

-- Place your query here
SELECT * FROM product;

set @end_time = CURRENT_TIMESTAMP; 
select TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time);

select * from product;

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    freight DECIMAL(10, 2),
    order_date DATE,
    ShipCountry VARCHAR(50)
);

-- Insert data into orders table
INSERT INTO orders VALUES (1, 10.00, '1996-07-04', 'USA');
INSERT INTO orders VALUES (2, 20.00, '1996-07-05', 'USA');
INSERT INTO orders VALUES (3, 30.00, '1996-07-06', 'USA');
INSERT INTO orders VALUES (4, 40.00, '1996-07-07', 'USA');

set @start_time = CURRENT_TIMESTAMP;

-- Place your query here
SELECT * FROM orders;

set @end_time = CURRENT_TIMESTAMP; 
select TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time);

select * from orders;

-- Assignment 1
SELECT * FROM employee ORDER BY first_name;

-- Assignment 2
SELECT * FROM employee ORDER BY first_name, last_name;

-- Assignment 3
SELECT product_name, unit_price FROM product ORDER BY unit_price DESC;

-- Assignment 4
SELECT product_name, unit_price, unit_price * 1.2 AS increased_price
FROM product
WHERE unit_price * 0.2 > 30
ORDER BY increased_price DESC;

-- Assignment 5
SELECT COUNT(*) FROM employee WHERE title = 'Sales Representative';

-- Assignment 6
SELECT COUNT(*) FROM employee;

-- Assignment 7
SELECT DISTINCT title FROM employee;

-- Assignment 8
SELECT COUNT(DISTINCT title) FROM employee;

-- Assignment 9
SELECT product_name, MAX(unit_price) AS max_price FROM product GROUP BY product_name ORDER BY max_price DESC LIMIT 1;

-- Assignment 10
SELECT product_name, MIN(units_in_stock) AS min_stock FROM product GROUP BY product_name ORDER BY min_stock ASC LIMIT 1;

-- Assignment 11
SELECT AVG(freight) FROM orders WHERE ShipCountry = 'USA';

-- Assignment 12
SELECT SUM(freight) FROM orders WHERE MONTH(order_date) = 7 AND YEAR(order_date) = 1996;