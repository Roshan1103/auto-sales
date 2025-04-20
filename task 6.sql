use supermart_db;
-- Monthly Revenue and Order Volume Analysis

Show Tables;
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
SELECT
    EXTRACT(YEAR FROM STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS order_year,
    EXTRACT(MONTH FROM STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS order_month,
    SUM(Sales) AS total_revenue,
    COUNT(DISTINCT Order_ID) AS order_volume
FROM
    Sales-- Replace with your actual table name
    WHERE
    STR_TO_DATE(Order_Date, '%d-%m-%Y') BETWEEN '2015-01-01' AND '2016-12-31'
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

select*from Sales;
