
create database ecommerce_db;
use ecommerce_db;
Show Tables;
SELECT * FROM Customer LIMIT 5 ;
CREATE TABLE Customer (
    customer_id varchar(100),
    customer_name VARCHAR(255),
    segment VARCHAR(100),
    age INT,
    country VARCHAR(100), 
    region VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20)
);
SELECT * FROM Customer LIMIT 5;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customer.csv'
INTO TABLE Customer
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
SELECT COUNT(*) FROM Customer;
-- inner join
SELECT 
    c.customer_name,
    s.order_id,
    s.sales
FROM Customer c
INNER JOIN Sales s ON c.customer_id = s.customer_id;


drop table Sales;

CREATE TABLE Sales (
    Order_Line INT,
    Order_ID VARCHAR(50),
    Order_Date Varchar(100),
    Ship_Date Varchar(100),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Product_ID VARCHAR(50),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    PRIMARY KEY (Order_Line, Order_ID) 
    );

LOAD DATA INFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//Sales.csv' 
INTO TABLE Sales 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;


CREATE TABLE Product (
    Product_ID VARCHAR(50) PRIMARY KEY,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255)
);


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Product.csv"
INTO TABLE Product
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

select*from Sales;
SELECT * FROM Customer ;
SELECT * FROM Product ;




SELECT DISTINCT city FROM Customer WHERE region IN ('north', 'east');

SELECT * FROM sales WHERE sales BETWEEN 100 AND 500;

SELECT * FROM Customer WHERE customer_name LIKE '    ';




SELECT * FROM sales WHERE discount > 0 ORDER BY discount DESC;
SELECT product_id FROM sales WHERE quantity > 10;
SELECT * FROM sales WHERE discount > 0 ORDER BY discount DESC LIMIT 10;


-- Aggregate operators:-

SELECT SUM(sales) AS total_sales FROM sales;

SELECT COUNT(*) AS count_Customer FROM Customer WHERE region = 'north' AND age BETWEEN 20 AND 30;

SELECT AVG(age) AS average_age FROM customers WHERE region = 'east';

SELECT MIN(age) AS min_age, MAX(age) AS max_age FROM Customer WHERE city = 'Philadelphia';



SELECT 
    product_id, 
    SUM(sales) AS total_sales, 
    SUM(quantity) AS total_quantity, 
    COUNT(order_id) AS num_orders, 
    MAX(sales) AS max_sales, 
    MIN(sales) AS min_sales, 
    AVG(sales) AS avg_sales
FROM sales
GROUP BY product_id
ORDER BY total_sales DESC;


drop database ecommerce_db;



