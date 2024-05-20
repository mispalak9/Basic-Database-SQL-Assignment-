-- Day 1 , Assignment 1
create database Employee;
use Employee;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    city VARCHAR(50),
    region VARCHAR(50),
    TitleOfCourtesy VARCHAR(50),
    birthdate DATE
);
drop table employees;
INSERT INTO employees (id, first_name, last_name, job_title, city, region, TitleOfCourtesy, birthdate)
VALUES 
(1, 'John', 'Doe', 'Sales Representative', 'London', 'WA', 'Mr.', '1955-01-01'),
(2, 'Jane', 'Doe', 'Sales Manager', 'London', 'WA', 'Mrs.', '1956-01-01'),
(3, 'Sam', 'Smith', 'Sales Representative', 'New York', 'NY', 'Mr.', '1957-01-01'),
(4, 'Sara', 'Johnson', 'Sales Manager', 'New York', 'NY', 'Ms.', '1958-01-01');

select * from employees;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2),
    discontinued BOOLEAN
);
INSERT INTO products (product_id, product_name, unit_price, discontinued) 
VALUES 
(1, 'Product 1', 10.99, FALSE),
(2, 'Product 2', 20.99, FALSE),
(3, 'Product 3', 30.99, TRUE),
(4, 'Product 4', 40.99, FALSE);

select * from products;

-- Assignment 2
SELECT product_id, product_name, unit_price FROM products;

-- Assignment 3
SELECT product_id AS id, product_name AS name, unit_price AS price FROM products;

-- Assignment 4
SELECT * FROM employees WHERE region = 'WA';

-- Assignment 5
SELECT * FROM products WHERE discontinued IS FALSE;

-- Assignment 6
SELECT * FROM employees WHERE city <> 'London';
SELECT * FROM employees WHERE city != 'London';

-- Assignment 7
SELECT * FROM employees WHERE job_title IN ('Sales Representative', 'Sales Manager');

-- Assignment 8
SELECT * FROM employees WHERE job_title IN ('Sales Representative', 'Sales Manager') AND city = 'London';

-- Assignment 9
SELECT * FROM employees WHERE TitleOfCourtesy NOT LIKE 'Mr.';

-- Assignment 10
SELECT * FROM employees WHERE first_name LIKE 'S%';

-- Assignment 11
SELECT * FROM employees WHERE first_name LIKE '_a%';

-- Assignment 12
SELECT * FROM employees WHERE YEAR(birthdate) BETWEEN 1953 AND 1958;

-- Assignment 13
SELECT * FROM employees WHERE job_title IN ('Sales Representative', 'Sales Manager');

-- Assignment 14
SELECT last_name, first_name,
CASE 
    WHEN TitleOfCourtesy IN ('Ms.', 'Mrs.') THEN 'Female'
    WHEN TitleOfCourtesy IN ('Dr.', 'Mr.') THEN 'Male'
END AS Gender
FROM Employees;