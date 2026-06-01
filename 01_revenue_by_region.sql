-- ============================================================
-- Query 1: Revenue & Profit by Region
-- Business Question: Which regions generate the most revenue
-- and which are most profitable?
-- Stakeholder: Sales Manager, Finance
-- ============================================================

SELECT
    Region,
    COUNT(DISTINCT "Order ID")          AS total_orders,
    ROUND(SUM(Sales), 2)                AS total_sales,
    ROUND(SUM(Profit), 2)               AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct,
    ROUND(SUM(Sales) / SUM(SUM(Sales)) OVER () * 100, 2) AS sales_share_pct,
    ROUND(SUM(Profit) / SUM(SUM(Profit)) OVER () * 100, 2) AS profit_share_pct
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- KEY FINDING: West region contributes ~32% of sales but only ~18% of profit
-- due to aggressive Technology discounting — see Query 6 for discount analysis.
