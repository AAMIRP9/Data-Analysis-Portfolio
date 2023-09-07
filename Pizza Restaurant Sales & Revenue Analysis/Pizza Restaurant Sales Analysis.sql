-- PIZZA SALES SQL QUERIES 

--KEY PERFORMANCE INDICATORS (KPIs)

--Total Revenue

SELECT SUM(total_price) AS Total_Revenue from pizza_sales_excel_file

-- Average Order Value 

SELECT SUM(Total_Price) / COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales_excel_file

-- Total Pizzas Sold 

SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales_excel_file 

-- Total Orders 

SELECT COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales_excel_file

-- Average Pizzas Per Order 

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order from pizza_sales_excel_file

-- Trends and Insights

-- Daily Trend of Total Orders 

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders
from pizza_sales_excel_file
GROUP BY DATENAME(DW, order_date)

-- Monthly Trend for Total orders 

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales_excel_file
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC

-- Percentage of Sales by Pizza Category

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_excel_file) AS Sales 
FROM pizza_sales_excel_file
GROUP BY pizza_category 

-- Percentage of Sales by Pizza Size 

SELECT pizza_size, SUM(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales_excel_file) AS Size 
FROM pizza_sales_excel_file
GROUP BY pizza_size
ORDER BY Size DESC

-- Top 5 Best Sellers by Price

SELECT  TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- 5 Worst Sellers by Price

SELECT  TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Top 5 Best Sellers by Quantity

SELECT  TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Quantity DESC 

-- 5 Worst Sellers by Quantity

SELECT  TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Quantity ASC 

-- Top 5 Best Sellers by Orders 

SELECT  TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders DESC 

-- 5 Worst Sellers by Orders

SELECT  TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders ASC
