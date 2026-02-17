CREATE DATABASE IF NOT EXISTS retail_sales;

use retail_sales;

-- Q1. What is the total revenue generated?
SELECT ROUND(SUM(sales),2) AS total_revenue
FROM retail;

-- Q2. What is the total profit earned?
SELECT ROUND(SUM(profit),2) AS total_profit
FROM retail;

-- Q3. What is the total number of orders?
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM retail;

-- Q4. What is the overall profit margin?
SELECT ROUND(SUM(profit)/SUM(sales),4) AS overall_profit_margin
FROM retail;

-- Q5. What is the total sales by category?
SELECT category,
       ROUND(SUM(sales),2) AS total_sales
FROM retail
GROUP BY category
ORDER BY total_sales DESC;


-- Q6. What is the total profit by category?
SELECT category,
       ROUND(SUM(profit),2) AS total_profit
FROM retail
GROUP BY category
ORDER BY total_profit DESC;

-- Q7. Which sub-categories are generating losses?
SELECT sub_category,
       ROUND(SUM(profit),2) AS total_profit
FROM retail
GROUP BY sub_category
HAVING total_profit < 0
ORDER BY total_profit;

-- Q8. What is the total sales by region?
SELECT region,
       ROUND(SUM(sales),2) AS total_sales
FROM retail
GROUP BY region
ORDER BY total_sales DESC;

-- Q9. What is the total profit by region?
SELECT region,
       ROUND(SUM(profit),2) AS total_profit
FROM retail
GROUP BY region
ORDER BY total_profit DESC;

-- Q10. Who are the top 10 customers by sales?
SELECT customer_name,
       ROUND(SUM(sales),2) AS total_sales
FROM retail
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Q11. What is the yearly sales trend?
SELECT year,
       ROUND(SUM(sales),2) AS yearly_sales
FROM retail
GROUP BY year
ORDER BY year;

-- Q12. What is the monthly sales trend?
SELECT month_name,
       ROUND(SUM(sales),2) AS monthly_sales
FROM retail
GROUP BY month_name
ORDER BY monthly_sales DESC;

-- Q13. What is the average discount by category?
SELECT category,
       ROUND(AVG(discount),2) AS avg_discount
FROM retail
GROUP BY category
ORDER BY avg_discount DESC;

-- Q14. Which products have high discount and negative profit?
SELECT product_name,
       discount,
       profit
FROM retail
WHERE discount > 0.5
AND profit < 0
ORDER BY discount DESC;

-- Q15. What is the average shipping time?
SELECT ROUND(AVG(shipping_days),2) AS avg_shipping_days
FROM retail;