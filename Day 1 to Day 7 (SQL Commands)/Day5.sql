-- Day 5, Assignment 1
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);

INSERT INTO products (product_id, product_name)
VALUES (1, 'Product 1'), (2, 'Product 2'), (3, 'Product 3');

SELECT ucase(product_name) AS product_name_uppercase FROM products;


-- Assignment 2
SELECT RIGHT(product_name, 3) AS last_three_chars
FROM products;


-- Assignment 3
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    postal_code VARCHAR(9)
);

INSERT INTO customers (customer_id, customer_name, postal_code)
VALUES (1, 'Customer 1', '123456789'),
       (2, 'Customer 2', '67890'),
       (3, 'Customer 3', '23456');
       
SELECT LPAD(postal_code, 9, '0') AS padded_postal_code
FROM customers;


-- Assignment 4
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unitprice DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, unitprice)
VALUES (1, 'Product 1', 12.34),
       (2, 'Product 2', 56.78),
       (3, 'Product 3', 90.12);
       
SELECT FLOOR(unitprice) AS unitprice_without_decimal
FROM products;


-- Assignment 5
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    price DECIMAL(10, 2)
);

INSERT INTO orders (product_id, price) VALUES
(1, 10.50),
(1, 15.75),
(2, 20.00),
(2, 25.25),
(3, 30.75);

SELECT order_id, FLOOR(SUM(price)) AS final_order_price
FROM orders
GROUP BY order_id;


-- Assignment 6
SELECT order_id, CEIL(SUM(price)) AS final_order_price
FROM orders
GROUP BY order_id;


-- Assignment 7
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    price DECIMAL(10, 2)
);

INSERT INTO orders (order_date, price) VALUES
('2024-04-23', 10.50),
('2024-04-23', 15.75),
('2024-04-24', 20.00),
('2024-04-24', 25.25),
('2024-04-25', 30.75);

SELECT order_id, DATE_FORMAT(order_date, '%Y/%m/%d') AS formatted_order_date
FROM orders;


-- Assignment 8
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;