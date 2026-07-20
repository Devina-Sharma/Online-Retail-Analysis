-- ==========================================================
-- Online Retail Analysis - SQL Analysis
-- Purpose: Business analysis of sales, customers and products
-- ==========================================================


USE ecommerce_analysis;


-- ==========================================================
-- 1. Dataset Exploration
-- ==========================================================

-- Preview sample records

SELECT *
FROM online_retail
LIMIT 10;


-- Check table structure

DESCRIBE online_retail;


-- Display available tables

SHOW TABLES;



-- ==========================================================
-- 2. Overall Business Performance KPIs
-- ==========================================================


-- Calculate total revenue

SELECT
    ROUND(SUM(Quantity * UnitPrice),2) AS Total_Revenue
FROM online_retail
WHERE Quantity > 0;



-- Calculate total number of orders

SELECT
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail;



-- Calculate average order value
-- Revenue divided by number of unique orders

SELECT
    ROUND(
        SUM(Quantity * UnitPrice) /
        COUNT(DISTINCT InvoiceNo),
        2
    ) AS Average_Order_Value
FROM online_retail
WHERE Quantity > 0;



-- Calculate total number of products

SELECT
    COUNT(DISTINCT StockCode) AS Total_Products
FROM online_retail;



-- Calculate total number of customers

SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail
WHERE CustomerID IS NOT NULL;




-- ==========================================================
-- 3. Monthly Revenue Analysis
-- ==========================================================


-- Analyse revenue trends over time

SELECT
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    ROUND(SUM(Quantity * UnitPrice),2) AS Monthly_Revenue
FROM online_retail
WHERE Quantity > 0
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    Year,
    Month;



-- ==========================================================
-- 4. Country Performance Analysis
-- ==========================================================


-- Identify highest revenue generating countries

SELECT
    Country,
    ROUND(SUM(Quantity * UnitPrice),2) AS Revenue
FROM online_retail
WHERE Quantity > 0
GROUP BY Country
ORDER BY Revenue DESC;



-- Calculate revenue contribution percentage by country

WITH Country_Revenue AS
(
    SELECT
        Country,
        ROUND(SUM(Quantity * UnitPrice),2) AS Revenue
    FROM online_retail
    WHERE Quantity > 0
    GROUP BY Country
)

SELECT
    Country,
    Revenue,
    ROUND(
        Revenue / SUM(Revenue) OVER() * 100,
        2
    ) AS Revenue_Percentage
FROM Country_Revenue
ORDER BY Revenue DESC;




-- ==========================================================
-- 5. Product Performance Analysis
-- ==========================================================


-- Find products with highest number of units sold

SELECT
    Description,
    SUM(Quantity) AS Units_Sold
FROM online_retail
WHERE Quantity > 0
GROUP BY Description
ORDER BY Units_Sold DESC
LIMIT 10;



-- Find products generating highest revenue

SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice),2) AS Revenue
FROM online_retail
WHERE Quantity > 0
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;



-- Rank products based on revenue contribution

SELECT
    Description,
    ROUND(SUM(Quantity * UnitPrice),2) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(Quantity * UnitPrice) DESC
    ) AS Product_Rank
FROM online_retail
WHERE Quantity > 0
GROUP BY Description;




-- ==========================================================
-- 6. Customer Analysis
-- ==========================================================


-- Identify customers with highest number of orders

SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Total_Orders DESC
LIMIT 10;



-- Identify highest spending customers

SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice),2) AS Total_Spending
FROM online_retail
WHERE CustomerID IS NOT NULL
AND Quantity > 0
GROUP BY CustomerID
ORDER BY Total_Spending DESC
LIMIT 10;



-- Analyse customer purchase history

SELECT
    CustomerID,
    MIN(InvoiceDate) AS First_Purchase,
    MAX(InvoiceDate) AS Last_Purchase
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
LIMIT 10;



-- Rank customers based on total spending

SELECT
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice),2) AS Total_Spending,
    RANK() OVER(
        ORDER BY SUM(Quantity * UnitPrice) DESC
    ) AS Customer_Rank
FROM online_retail
WHERE CustomerID IS NOT NULL
AND Quantity > 0
GROUP BY CustomerID;




-- ==========================================================
-- 7. Revenue Growth Analysis
-- ==========================================================


-- Calculate cumulative revenue over time

WITH Monthly_Revenue AS
(
    SELECT
        YEAR(InvoiceDate) AS Year,
        MONTH(InvoiceDate) AS Month,
        ROUND(SUM(Quantity * UnitPrice),2) AS Revenue
    FROM online_retail
    WHERE Quantity > 0
    GROUP BY
        YEAR(InvoiceDate),
        MONTH(InvoiceDate)
)

SELECT
    Year,
    Month,
    Revenue,
    SUM(Revenue) OVER(
        ORDER BY Year, Month
    ) AS Running_Revenue
FROM Monthly_Revenue;




-- ==========================================================
-- 8. Customer Value Segmentation
-- ==========================================================


-- Categorise customers based on spending behaviour

WITH Customer_Spending AS
(
    SELECT
        CustomerID,
        ROUND(SUM(Quantity * UnitPrice),2) AS Spending
    FROM online_retail
    WHERE CustomerID IS NOT NULL
    AND Quantity > 0
    GROUP BY CustomerID
)

SELECT
    CustomerID,
    Spending,
    CASE
        WHEN Spending >= 10000 THEN 'High Value'
        WHEN Spending >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Category
FROM Customer_Spending
ORDER BY Spending DESC;