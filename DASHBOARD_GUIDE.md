# Power BI Dashboard — Setup Guide
## E-Commerce Sales Analysis

---

## Overview

This guide walks you through building the 3-page Power BI dashboard
for the E-Commerce Sales Analysis project.

**Dataset:** `../data/superstore_sales.csv`  
**Tool:** Microsoft Power BI Desktop (free download from microsoft.com)

---

## Step 1: Load the Data

1. Open Power BI Desktop
2. Click **Get Data → Text/CSV**
3. Select `data/superstore_sales.csv`
4. Click **Transform Data** to open Power Query
5. Verify column types:
   - `Order Date`, `Ship Date` → Date
   - `Sales`, `Profit`, `Discount` → Decimal Number
   - `Quantity` → Whole Number
   - All others → Text

---

## Step 2: Create Calculated Columns & Measures (DAX)

In the **Data** view, create these measures in a new table called `_Measures`:

```dax
-- Total Sales
Total Sales = SUM(superstore_sales[Sales])

-- Total Profit
Total Profit = SUM(superstore_sales[Profit])

-- Profit Margin %
Profit Margin % = DIVIDE(SUM(superstore_sales[Profit]), SUM(superstore_sales[Sales])) * 100

-- Total Orders
Total Orders = DISTINCTCOUNT(superstore_sales[Order ID])

-- Average Discount %
Avg Discount % = AVERAGE(superstore_sales[Discount]) * 100

-- Average Order Value
Avg Order Value = DIVIDE(SUM(superstore_sales[Sales]), DISTINCTCOUNT(superstore_sales[Order ID]))

-- Sales Share % by Region (for highlighting West)
Sales Share % = 
DIVIDE(
    SUM(superstore_sales[Sales]),
    CALCULATE(SUM(superstore_sales[Sales]), ALL(superstore_sales[Region]))
) * 100

-- Profit Share % by Region
Profit Share % = 
DIVIDE(
    SUM(superstore_sales[Profit]),
    CALCULATE(SUM(superstore_sales[Profit]), ALL(superstore_sales[Region]))
) * 100

-- YoY Sales Growth
YoY Sales Growth % = 
VAR CurrentYear = SUM(superstore_sales[Sales])
VAR PreviousYear = CALCULATE(SUM(superstore_sales[Sales]), DATEADD(superstore_sales[Order Date], -1, YEAR))
RETURN DIVIDE(CurrentYear - PreviousYear, PreviousYear) * 100
```

---

## Step 3: Dashboard Pages

### Page 1 — Sales Overview

**Visuals to create:**

| Visual Type       | Fields                                      | Purpose                          |
|-------------------|---------------------------------------------|----------------------------------|
| KPI Card          | Total Sales                                 | Headline metric                  |
| KPI Card          | Total Profit                                | Headline metric                  |
| KPI Card          | Profit Margin %                             | Headline metric                  |
| KPI Card          | Total Orders                                | Headline metric                  |
| Bar Chart         | Region (X) vs Total Sales & Total Profit    | Sales vs Profit gap by Region    |
| Line Chart        | Order Date (Month) vs Total Sales           | Monthly sales trend              |
| Donut Chart       | Category vs Total Sales                     | Category sales mix               |
| Matrix/Table      | Region × Category vs Profit Margin %        | Profitability heatmap            |

**Slicers (sync across all pages):**
- Year (from Order Date)
- Region
- Category

---

### Page 2 — Product & Segment Analysis

| Visual Type       | Fields                                      | Purpose                          |
|-------------------|---------------------------------------------|----------------------------------|
| Bar Chart         | Sub-Category vs Profit Margin %             | Identify loss-making sub-cats    |
| Bar Chart         | Segment vs Total Sales & Total Profit       | Segment comparison               |
| Scatter Plot      | Total Sales (X) vs Total Profit (Y)         | Identify outlier products        |
| Table             | Product Name, Sales, Profit, Margin %       | Top/bottom product detail        |
| KPI Card          | Avg Order Value                             | Segment efficiency metric        |

---

### Page 3 — Discount Impact Analysis

| Visual Type       | Fields                                      | Purpose                          |
|-------------------|---------------------------------------------|----------------------------------|
| Clustered Bar     | Discount Bracket vs Profit (West, Tech)     | Discount-profit relationship     |
| Line & Bar Combo  | Discount % (Line) vs Profit (Bar) by Month  | Discount impact over time        |
| KPI Card          | Avg Discount % in West/Technology           | Highlight the problem            |
| Text Box          | "$18K projected recovery with 20% cap"      | Key recommendation callout       |
| Table             | Region, Category, Discount Bracket, Profit  | Detailed drill-down              |

**Conditional Formatting:**
- In the Region-level visuals, use conditional formatting to flag West region in orange
  when Profit Share % < Sales Share % (i.e. profit lags sales).

---

## Step 4: Formatting Tips

- Theme: Use a clean white background with blue (#1F5C99) as the accent colour
- Font: Segoe UI throughout
- KPI Cards: Use bold values, small descriptive subtitles
- Slicers: Place all 3 slicers (Year, Region, Category) at the top of every page
- Sync slicers: View → Sync Slicers → enable for all 3 slicers across all pages

---

## Step 5: Save & Export

1. Save the file as `ECommerce_Sales_Dashboard.pbix` in this folder
2. To share without Power BI Pro:
   - File → Export → Export to PDF (static snapshot)
   - Or publish to Power BI Service (free account) and share the link

---

## Key Insights to Highlight in the Dashboard

1. **West region** — 32% of sales, only 18% of profit (Technology discounting)
2. **Tables & Bookcases** — Loss-making sub-categories in Furniture
3. **Home Office segment** — Highest profit margin %, underinvested
4. **Q4 seasonality** — Consistently highest volume; plan Q1/Q2 promotions
5. **$18K recovery** — Capping West/Technology discounts at 20%
