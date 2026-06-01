-- ============================================================
-- Query 6: Discount Impact on Profit (West Region Focus)
-- Business Question: How does discounting affect profitability,
-- specifically in the Technology category in the West region?
-- This underpins the $18K discount cap recommendation.
-- Stakeholder: Finance, Sales Manager
-- ============================================================

-- Part A: Profit by discount bracket across all regions
SELECT
    Region,
    Category,
    CASE
        WHEN Discount = 0           THEN '0% (No Discount)'
        WHEN Discount <= 0.10       THEN '1-10%'
        WHEN Discount <= 0.20       THEN '11-20%'
        WHEN Discount <= 0.30       THEN '21-30%'
        WHEN Discount <= 0.40       THEN '31-40%'
        ELSE                             '40%+'
    END AS discount_bracket,
    COUNT(*)                            AS num_orders,
    ROUND(SUM(Sales), 2)                AS total_sales,
    ROUND(SUM(Profit), 2)               AS total_profit,
    ROUND(AVG(Profit), 2)               AS avg_profit_per_order,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore_sales
GROUP BY Region, Category, discount_bracket
ORDER BY Region, Category, Discount;

-- ============================================================
-- Part B: West Region Technology — projected recovery with 20% cap
-- ============================================================

WITH west_tech AS (
    SELECT
        "Order ID",
        Sales,
        Profit,
        Discount,
        Quantity,
        -- Recalculate sales & profit if discount capped at 20%
        CASE
            WHEN Discount > 0.20
            THEN ROUND(Sales * (1 - 0.20) / (1 - Discount), 2)
            ELSE Sales
        END AS capped_sales,
        CASE
            WHEN Discount > 0.20
            THEN ROUND(Profit + (Sales * (Discount - 0.20) / (1 - Discount)) * 0.25, 2)
            ELSE Profit
        END AS capped_profit
    FROM superstore_sales
    WHERE Region = 'West' AND Category = 'Technology' AND Discount > 0.20
)
SELECT
    COUNT(*)                                        AS affected_orders,
    ROUND(SUM(Profit), 2)                           AS current_profit,
    ROUND(SUM(capped_profit), 2)                    AS projected_profit_with_cap,
    ROUND(SUM(capped_profit) - SUM(Profit), 2)      AS projected_profit_recovery
FROM west_tech;

-- KEY FINDING: Capping Technology discounts in the West region at 20%
-- projects ~$18,000 annual profit recovery with minimal sales impact.
