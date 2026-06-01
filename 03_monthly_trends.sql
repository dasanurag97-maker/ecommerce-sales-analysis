-- ============================================================
-- Query 3: Monthly Sales & Profit Trends
-- Business Question: How do sales and profit trend over time?
-- Are there seasonal patterns to plan around?
-- Stakeholder: Sales Manager, Finance
-- ============================================================

SELECT
    strftime('%Y', "Order Date")        AS order_year,
    strftime('%m', "Order Date")        AS order_month,
    strftime('%Y-%m', "Order Date")     AS year_month,
    COUNT(DISTINCT "Order ID")          AS total_orders,
    ROUND(SUM(Sales), 2)                AS monthly_sales,
    ROUND(SUM(Profit), 2)               AS monthly_profit,
    ROUND(AVG(Sales), 2)                AS avg_order_value,
    -- Month-over-month growth using window function
    ROUND(
        (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY strftime('%Y-%m', "Order Date")))
        / LAG(SUM(Sales)) OVER (ORDER BY strftime('%Y-%m', "Order Date")) * 100
    , 2) AS mom_sales_growth_pct
FROM superstore_sales
GROUP BY year_month
ORDER BY year_month;

-- NOTE: Q4 (Oct-Dec) consistently shows the highest sales volume.
-- March and September show secondary peaks — align promotions accordingly.
