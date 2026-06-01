-- ============================================================
-- Query 2: Top 10 Products by Sales & Profit
-- Business Question: Which products drive the most revenue?
-- Are high-selling products also high-profit?
-- Stakeholder: Sales Manager, Marketing Head
-- ============================================================

SELECT
    "Product Name",
    Category,
    "Sub-Category",
    COUNT(DISTINCT "Order ID")   AS times_ordered,
    SUM(Quantity)                AS total_units_sold,
    ROUND(SUM(Sales), 2)         AS total_sales,
    ROUND(SUM(Profit), 2)        AS total_profit,
    ROUND(AVG(Discount) * 100, 1) AS avg_discount_pct,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore_sales
GROUP BY "Product Name", Category, "Sub-Category"
ORDER BY total_sales DESC
LIMIT 10;

-- NOTE: Some high-revenue products (especially Phones & Copiers) show
-- low or negative profit margins due to high discount rates.
