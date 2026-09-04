-- show databases;
-- CREATE DATABASE pizza_sales_analysis;
 -- USE pizza_sales_analysis;

CREATE TABLE `order` (
    id INT,
    date DATE
);
desc `order`;

ALTER TABLE  `order`
ADD `time` time;
desc `order`;

desc `order`;

RENAME TABLE `order`to  `orders`;
desc `orders`;

ALTER TABLE orders
ADD PRIMARY KEY (id);
desc orders;
select * from orders;
ALTER TABLE orders
ADD customers INT  ;
desc orders;

CREATE TABLE CUSTOMERS (
    CustomerName VARCHAR(100),
    CustomerPhone BIGINT,
    CustomerLocation VARCHAR(100),
    Pin INT
 desc CUSTOMERS
);
INSERT INTO customers
(CustomerName, CustomerPhone, CustomerLocation, Pin)
VALUES
('Jiten Turankar', '9090909090', 'Mumbai', 400003);
SELECT * FROM CUSTOMERS;
 