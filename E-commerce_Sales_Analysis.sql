use ecommerce_sales;
CREATE TABLE sales_data (
    Transcation_id INT PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(100),
    price DECIMAL(10 , 2 ),
    quantity_sold INT,
    customer_age INT,
    customer_gender TEXT,
    Transcation_date DATE,
    payment_method VARCHAR(50),
    discount DECIMAL(10 , 2 ),
    region VARCHAR(100),
    membership_status VARCHAR(50)
);

select * from sales_data;

-- 1. Most Profitable Product Categories

SELECT category, SUM(price * quantity_sold) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;

-- 2. Month with the Highest Sales

SELECT 
    EXTRACT(MONTH FROM transcation_date) AS sales_month,
    SUM(price * quantity_sold) AS total_sales
FROM
    sales_data
GROUP BY sales_month
ORDER BY total_sales DESC;


-- 3. Products with the Highest Return Rate

SELECT 
    product_name,
    SUM(quantity_sold) AS total_sold,
    SUM(CASE
        WHEN quantity_sold < 0 THEN 1
        ELSE 0
    END) AS total_returns
FROM
    sales_data
GROUP BY product_name
ORDER BY total_returns / total_sold DESC;

-- 4. Analyze Average Order Value Per Country (Assuming region represents country)

SELECT 
    region, AVG(price * quantity_sold) AS avg_order_value
FROM
    sales_data
GROUP BY region
ORDER BY avg_order_value DESC;


-- 5. Best-Selling Products

SELECT 
    product_name, SUM(quantity_sold) AS total_sold
FROM
    sales_data
GROUP BY product_name
ORDER BY total_sold DESC;

-- 6. Customer Demographics (Age and Gender)

SELECT 
    customer_age,
    customer_gender,
    COUNT(DISTINCT transcation_id) AS num_transactions
FROM
    sales_data
GROUP BY customer_age , customer_gender
ORDER BY num_transactions DESC;

-- 7. Payment Method Distribution

SELECT 
    payment_method,
    COUNT(DISTINCT transcation_id) AS num_transactions
FROM
    sales_data
GROUP BY payment_method
ORDER BY num_transactions DESC;

-- 8. Membership Status Impact on Sales

SELECT 
    membership_status, SUM(price * quantity_sold) AS total_sales
FROM
    sales_data
GROUP BY membership_status
ORDER BY total_sales DESC;

-- 9. Average Discount Offered Per Category

SELECT 
    category,
    AVG(discount) AS avg_discount
FROM 
    sales_data
GROUP BY 
    category
ORDER BY 
    avg_discount DESC;
    
-- Insight: Helps identify which product categories often get discounted more.



-- 10. Revenue Contribution by Gender

SELECT 
    customer_gender,
    SUM(price * quantity_sold) AS total_revenue
FROM 
    sales_data
GROUP BY 
    customer_gender
ORDER BY 
    total_revenue DESC;

-- Insight: Understand which gender contributes more to revenue.


-- 11. Sales Trend Over Time (Monthly Revenue)

SELECT 
    DATE_FORMAT(transcation_date, '%Y-%m') AS month,
    SUM(price * quantity_sold) AS total_revenue
FROM 
    sales_data
GROUP BY 
    month
ORDER BY 
    month ASC;
    
-- Insight: Track revenue trends over time.

-- 12. Most Popular Product by Age Group (Bucketed Age)

SELECT 
    FLOOR(customer_age / 10) * 10 AS age_group,
    product_name,
    COUNT(*) AS purchases
FROM 
    sales_data
GROUP BY 
    age_group, product_name
ORDER BY 
    age_group, purchases DESC;
-- Insight: Shows which products are most liked by different age groups.

-- 13. Top Regions by Sales Volume

SELECT 
    region,
    SUM(quantity_sold) AS total_units_sold
FROM 
    sales_data
GROUP BY 
    region
ORDER BY 
    total_units_sold DESC;
    
-- Insight: Highlights high-performing geographic markets.

-- 14. High Discount, High Volume Sales

SELECT 
    product_name,
    AVG(discount) AS avg_discount,
    SUM(quantity_sold) AS total_quantity
FROM 
    sales_data
GROUP BY 
    product_name
HAVING 
    avg_discount > 10 AND total_quantity > 100
ORDER BY 
    total_quantity DESC;
    
-- Insight: Identify products with both high discount and high volume.


-- 15. Gender-Wise Product Preference

SELECT 
    customer_gender,
    product_name,
    COUNT(*) AS total_purchases
FROM 
    sales_data
GROUP BY 
    customer_gender, product_name
ORDER BY 
    customer_gender, total_purchases DESC;
-- Insight: See which products are favored by males or females.

-- 16.  Average Transaction Value by Membership
SELECT 
    membership_status,
    AVG(price * quantity_sold) AS avg_transaction_value
FROM 
    sales_data
GROUP BY 
    membership_status
ORDER BY 
    avg_transaction_value DESC;
-- Insight: Compare transaction value between members and non-members.

-- 17. Product Category Performance by Region
SELECT 
    region,
    category,
    SUM(price * quantity_sold) AS total_revenue
FROM 
    sales_data
GROUP BY 
    region, category
ORDER BY 
    region, total_revenue DESC;
-- Insight: Which product categories sell best in different regions.


       -- the end project--

