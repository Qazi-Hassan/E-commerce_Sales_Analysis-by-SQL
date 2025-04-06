
# 📊 E-commerce Sales Analysis by SQL: Sales Data Exploration

## 🗂️ Dataset: `sales_data` from `ecommerce_sales`

This SQL project analyzes e-commerce sales transactions to generate business insights related to product performance, customer behavior, and revenue trends. It involves querying a structured `sales_data` table to uncover meaningful patterns and actionable insights.

---

## 🏗️ Table Schema

```sql
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
```

---

## 📌 Key Objectives

- Identify top-performing products and categories.
- Understand customer demographics and preferences.
- Track revenue and discount trends.
- Analyze membership and regional impacts on sales.

---

## ✅ SQL Queries and Insights

### 1. Most Profitable Product Categories
```sql
SELECT category, SUM(price * quantity_sold) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC;
```

### 2. Month with the Highest Sales
```sql
SELECT EXTRACT(MONTH FROM transcation_date) AS sales_month, SUM(price * quantity_sold) AS total_sales
FROM sales_data
GROUP BY sales_month
ORDER BY total_sales DESC;
```

### 3. Products with the Highest Return Rate
```sql
SELECT product_name, SUM(quantity_sold) AS total_sold,
       SUM(CASE WHEN quantity_sold < 0 THEN 1 ELSE 0 END) AS total_returns
FROM sales_data
GROUP BY product_name
ORDER BY total_returns / total_sold DESC;
```

### 4. Average Order Value Per Region
```sql
SELECT region, AVG(price * quantity_sold) AS avg_order_value
FROM sales_data
GROUP BY region
ORDER BY avg_order_value DESC;
```

### 5. Best-Selling Products
```sql
SELECT product_name, SUM(quantity_sold) AS total_sold
FROM sales_data
GROUP BY product_name
ORDER BY total_sold DESC;
```

### 6. Customer Demographics (Age and Gender)
```sql
SELECT customer_age, customer_gender, COUNT(DISTINCT transcation_id) AS num_transactions
FROM sales_data
GROUP BY customer_age, customer_gender
ORDER BY num_transactions DESC;
```

### 7. Payment Method Distribution
```sql
SELECT payment_method, COUNT(DISTINCT transcation_id) AS num_transactions
FROM sales_data
GROUP BY payment_method
ORDER BY num_transactions DESC;
```

### 8. Membership Status Impact on Sales
```sql
SELECT membership_status, SUM(price * quantity_sold) AS total_sales
FROM sales_data
GROUP BY membership_status
ORDER BY total_sales DESC;
```

---

## 🌟 Additional Advanced Insights

### 9. Average Discount Offered Per Category
```sql
SELECT category, AVG(discount) AS avg_discount
FROM sales_data
GROUP BY category
ORDER BY avg_discount DESC;
```

### 10. Revenue Contribution by Gender
```sql
SELECT customer_gender, SUM(price * quantity_sold) AS total_revenue
FROM sales_data
GROUP BY customer_gender
ORDER BY total_revenue DESC;
```

### 11. Monthly Revenue Trend
```sql
SELECT DATE_FORMAT(transcation_date, '%Y-%m') AS month, SUM(price * quantity_sold) AS total_revenue
FROM sales_data
GROUP BY month
ORDER BY month ASC;
```

### 12. Most Popular Products by Age Group
```sql
SELECT FLOOR(customer_age / 10) * 10 AS age_group, product_name, COUNT(*) AS purchases
FROM sales_data
GROUP BY age_group, product_name
ORDER BY age_group, purchases DESC;
```

### 13. Top Regions by Units Sold
```sql
SELECT region, SUM(quantity_sold) AS total_units_sold
FROM sales_data
GROUP BY region
ORDER BY total_units_sold DESC;
```

### 14. High Discount + High Volume Products
```sql
SELECT product_name, AVG(discount) AS avg_discount, SUM(quantity_sold) AS total_quantity
FROM sales_data
GROUP BY product_name
HAVING avg_discount > 10 AND total_quantity > 100
ORDER BY total_quantity DESC;
```

### 15. Gender-Wise Product Preference
```sql
SELECT customer_gender, product_name, COUNT(*) AS total_purchases
FROM sales_data
GROUP BY customer_gender, product_name
ORDER BY customer_gender, total_purchases DESC;
```

### 16. Average Transaction Value by Membership
```sql
SELECT membership_status, AVG(price * quantity_sold) AS avg_transaction_value
FROM sales_data
GROUP BY membership_status
ORDER BY avg_transaction_value DESC;
```

### 17. Product Category Performance by Region
```sql
SELECT region, category, SUM(price * quantity_sold) AS total_revenue
FROM sales_data
GROUP BY region, category
ORDER BY region, total_revenue DESC;
```

### 18. Unsold or Underperforming Products
```sql
SELECT product_name, SUM(quantity_sold) AS total_sold
FROM sales_data
GROUP BY product_name
HAVING total_sold = 0 OR total_sold IS NULL
ORDER BY total_sold ASC;
```

---

## 💡 How to Use

1. Run `USE ecommerce_sales;` in your SQL environment.
2. Make sure the `sales_data` table is populated with meaningful data.
3. Execute each query to generate visual reports, insights, or dashboards.

---

## 📁 File Structure

```
ecommerce_sales/
│
├── sales_data_schema.sql         
├── sample_queries.sql    
|   dataset (CSV)
---

## 🧠 Future Improvements

- Integrate with a dashboard tool (Power BI, Tableau, Metabase)
- Add stored procedures for automated insights
- Add sample CSV data + data import scripts
