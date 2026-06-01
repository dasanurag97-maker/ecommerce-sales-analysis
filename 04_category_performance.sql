-- ============================================================
-- Query 4: Category & Sub-Category Performance
-- Business Question: Which categories and sub-categories
-- are profitable vs. loss-making?
-- Stakeholder: Sales Manager, Marketing Head, Finance
-- ============================================================

SELECT
    Category,
    "Sub-Category",
    COUNT(DISTINCT "Order ID")              AS total_orders,
    ROUND(SUM(Sales), 2)                    AS total_sales,
    ROUND(SUM(Profit), 2)                   AS total_profit,
    ROUND(AVG(Discount) * 100, 1)           AS avg_discount_pct,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct,
    CASE
        WHEN SUM(Profit) / SUM(Sales) < 0       THEN 'Loss-Making'
        WHEN SUM(Profit) / SUM(Sales) < 0.10    THEN 'Low Margin'
        WHEN SUM(Profit) / SUM(Sales) < 0.25    THEN 'Healthy'
        ELSE                                          'High Margin'
    END AS margin_category
FROM superstore_sales
GROUP BY Category, "Sub-Category"
ORDER BY Category, total_profit DESC;

-- KEY FINDING: Tables and Bookcases in Furniture are loss-making.
-- Copiers show high sales but thin margins due to discount stacking.
