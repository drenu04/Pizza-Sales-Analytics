CREATE DATABASE PIZZA_DB;
USE PIZZA_DB;

CREATE TABLE pizza (
    pizza_id INT PRIMARY KEY,
    pizza_name_id VARCHAR(50),
    pizza_name VARCHAR(100),
    pizza_size VARCHAR(10),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT
);
CREATE TABLE date (
    date_id INT PRIMARY KEY,
    order_date DATE,
    day INT,
    day_name VARCHAR(15),
    month INT,
    month_name VARCHAR(15),
    year INT
);
CREATE TABLE sales (
    order_id INT,
    pizza_id INT,
    date_id INT,
    time_id INT,
    quantity INT,
    unit_price DOUBLE,
    total_price DOUBLE,
    FOREIGN KEY (pizza_id) REFERENCES pizza(pizza_id),
    FOREIGN KEY (date_id) REFERENCES date(date_id),
    FOREIGN KEY (time_id) REFERENCES time(time_id)
);
CREATE TABLE time (
    time_id INT PRIMARY KEY,
    order_time TIME,
    hour INT
);
CREATE TABLE sales (
    order_id INT,
    pizza_id INT,
    date_id INT,
    time_id INT,
    quantity INT,
    unit_price DOUBLE,
    total_price DOUBLE,
    FOREIGN KEY (pizza_id) REFERENCES pizza(pizza_id),
    FOREIGN KEY (date_id) REFERENCES date_dim(date_id),
    FOREIGN KEY (time_id) REFERENCES time_dim(time_id)
);

show tables;

RENAME TABLE date TO date_dim;
RENAME TABLE time TO time_dim;

select * from pizza
limit 5;

TRUNCATE TABLE date_dim;

SELECT COUNT(*) FROM pizza;
SELECT COUNT(*) FROM date_dim;
SELECT COUNT(*) FROM time_dim;
SELECT COUNT(*) FROM sales;

SELECT ROUND(SUM(total_price), 2) AS Total_Revenue
FROM sales;

SELECT 
ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS Avg_Order_Val
FROM sales;

SELECT 
    SUM(quantity) AS Total_Pizzas
FROM
    sales;

SELECT 
MIN(order_date) AS Min_Date,
MAX(order_date) AS Max_Date
FROM date_dim;

select date_format(order_date, '%d-%m-%Y') as order_date
from date_dim;

SELECT 
date_format(d.order_date, '%d-%m-%Y') as order_date,
COUNT(DISTINCT s.order_id) AS Total_Orders
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.order_date
ORDER BY d.order_date;

SELECT 
d.month,
COUNT(DISTINCT s.order_id) AS Order_Count
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

SELECT 
d.month,
ROUND(SUM(s.total_price), 2) AS Monthly_Revenue
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

SELECT 
p.pizza_name,
ROUND(SUM(s.total_price), 2) AS Revenue
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_name
ORDER BY Revenue DESC
LIMIT 5;

SELECT 
p.pizza_category,
ROUND(SUM(s.total_price), 2) AS Revenue
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_category
ORDER BY Revenue DESC;

SELECT 
p.pizza_name,
ROUND(SUM(s.total_price), 2) AS Revenue
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_name
ORDER BY Revenue ASC
LIMIT 5;

SELECT 
d.day_name AS Week,
ROUND(SUM(s.total_price), 2) AS Total_Revenue
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.day_name
ORDER BY FIELD(
    d.day_name,
    'Monday','Tuesday','Wednesday',
    'Thursday','Friday','Saturday','Sunday'
);

SELECT 
d.day_name AS Week,
ROUND(SUM(s.total_price), 2) AS Total_Revenue
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.day_name
ORDER BY Total_Revenue DESC
LIMIT 2;

SELECT 
d.day_name AS Order_Day,
COUNT(DISTINCT s.order_id) AS Total_Orders
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY d.day_name
ORDER BY Total_Orders DESC;

SELECT 
WEEK(d.order_date) AS Week_No,
ROUND(SUM(s.total_price), 2) AS Revenue
FROM sales s
JOIN date_dim d ON s.date_id = d.date_id
GROUP BY Week_No
ORDER BY Revenue DESC;

SELECT 
p.pizza_category,
ROUND(
    SUM(s.total_price) /
    (SELECT SUM(total_price) FROM sales) * 100, 2
) AS Rev_Percent
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_category
ORDER BY Rev_Percent DESC;

SELECT 
p.pizza_category,
ROUND(
    COUNT(DISTINCT s.order_id) * 100 /
    (SELECT COUNT(DISTINCT order_id) FROM sales), 2
) AS Orders_Percent
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_category
ORDER BY Orders_Percent DESC;

SELECT 
p.pizza_name,
ROUND(
    SUM(s.total_price) * 100 /
    (SELECT SUM(total_price) FROM sales), 2
) AS Pizza_Share
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_name
ORDER BY Pizza_Share DESC;

SELECT 
p.pizza_size,
ROUND(SUM(s.total_price), 2) AS Total_Sales,
ROUND(
    SUM(s.total_price) * 100 /
    (SELECT SUM(total_price) FROM sales), 2
) AS Pizza_Share
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_size
ORDER BY Pizza_Share DESC;

SELECT 
p.pizza_name,
ROUND(SUM(s.total_price), 2) AS Total_Revenue
FROM sales s
JOIN pizza p ON s.pizza_id = p.pizza_id
GROUP BY p.pizza_name
ORDER BY Total_Revenue DESC;
