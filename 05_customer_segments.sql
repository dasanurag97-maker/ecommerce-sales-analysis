-- ============================================================
-- Query 5: Customer Segment Analysis
-- Business Question: Which customer segments (Consumer,
-- Corporate, Home Office) are most valuable?
-- Stakeholder: Marketing Head, Sales Manager
-- ============================================================

SELECT
    Segment,
    COUNT(DISTINCT "Customer ID")           AS unique_customers,
    COUNT(DISTINCT "Order ID")              AS total_orders,
    ROUND(SUM(Sales), 2)                    AS total_sales,
    ROUND(SUM(Profit), 2)                   AS total_profit,
    ROUND(SUM(Sales) / COUNT(DISTINCT "Customer ID"), 2) AS sales_per_customer,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct,
    -- Rank segments by profit
    RANK() OVER (ORDER BY SUM(Profit) DESC) AS profit_rank
FROM superstore_sales
GROUP BY Segment
ORDER BY total_profit DESC;

-- KEY FINDING: Corporate segment has higher average order value.
-- Home Office has the best profit margin % despite lower volume.
-- Consumer segment drives bulk volume but at lower margin.
