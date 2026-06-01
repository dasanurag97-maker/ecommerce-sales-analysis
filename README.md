# E-Commerce Sales Analysis
### Business Analyst Portfolio Project | SQL · Excel · Power BI · BPMN

---

## Overview

This project analyses the Superstore Sales dataset (9,994 rows) to identify which product categories,
regions, and customer segments drive profit vs. loss — and to provide data-backed recommendations to
improve overall profitability.

**Key Business Finding:** The West region contributes ~32% of total sales but only ~18% of total profit
due to excessive Technology discounting. A discount cap policy is projected to recover **$18,000 in annual profit**.

---

## Project Structure

```
ecommerce-sales-analysis/
│
├── data/
│   └── superstore_sales.csv          # Source dataset (9,994 rows)
│
├── sql/
│   ├── 01_revenue_by_region.sql      # Sales & profit by region with share %
│   ├── 02_top_products.sql           # Top 10 products by sales and profit
│   ├── 03_monthly_trends.sql         # Monthly trends with MoM growth
│   ├── 04_category_performance.sql   # Category/sub-category profitability
│   ├── 05_customer_segments.sql      # Consumer vs Corporate vs Home Office
│   └── 06_discount_impact.sql        # Discount impact + $18K recovery model
│
├── docs/
│   └── BRD_ECommerce_Sales_Analysis.docx   # Full Business Requirements Document
│
├── powerbi/
│   └── DASHBOARD_GUIDE.md            # Step-by-step Power BI build guide (DAX included)
│
└── README.md
```

---

## Business Requirements Document (BRD)

The full BRD is in `docs/BRD_ECommerce_Sales_Analysis.docx` and covers:

- Business problem statement and objectives
- Stakeholder matrix (Sales Manager, Marketing Head, Finance)
- AS-IS and TO-BE process mapping
- User stories with acceptance criteria for all 3 stakeholders
- Functional requirements table (FR-01 to FR-07)
- Key findings and recommendations
- Stakeholder sign-off section

---

## SQL Queries

All 6 queries are written in standard SQL (compatible with SQLite, PostgreSQL, BigQuery).

| File | Business Question |
|------|------------------|
| `01_revenue_by_region.sql` | Which regions drive the most sales and profit? |
| `02_top_products.sql` | Which products are top sellers — and are they profitable? |
| `03_monthly_trends.sql` | How do sales trend over time? Any seasonality? |
| `04_category_performance.sql` | Which sub-categories are loss-making? |
| `05_customer_segments.sql` | Which customer segments are most valuable? |
| `06_discount_impact.sql` | How do discounts erode profit? What does a cap recover? |

### Running the SQL (SQLite example)

```bash
# Install SQLite if needed
# Load the dataset
sqlite3 analysis.db
.mode csv
.import data/superstore_sales.csv superstore_sales

# Run a query
.read sql/01_revenue_by_region.sql
```

---

## Power BI Dashboard

The 3-page dashboard is documented in `powerbi/DASHBOARD_GUIDE.md` with full DAX measures,
visual specifications, and formatting instructions.

**Dashboard Pages:**
1. **Sales Overview** — KPI cards, regional bar chart, monthly trend line, category donut
2. **Product & Segment Analysis** — Sub-category profitability, segment comparison, scatter plot
3. **Discount Impact** — Discount bracket analysis, $18K recovery callout, West/Tech deep-dive

**Cross-page slicers:** Year · Region · Category

---

## Key Findings

| Finding | Impact | Recommendation |
|---------|--------|----------------|
| West = 32% sales, 18% profit | ~$18K annual profit leakage | Cap Technology discounts at 20% in West |
| Tables & Bookcases are loss-making | Drags Furniture margin negative | Review pricing & discount policy |
| Home Office has highest margin % | Underinvested segment | Increase targeted marketing spend |
| Q4 drives peak sales consistently | Q1/Q2 significantly slower | Plan Q1/Q2 promotional campaigns |

---

## Tools & Skills Demonstrated

| Area | Tools / Skills |
|------|---------------|
| **Requirements** | BRD, User Stories, Acceptance Criteria, BPMN (AS-IS/TO-BE) |
| **Data Analysis** | SQL (Joins, CTEs, Window Functions, CASE), Excel |
| **Visualisation** | Power BI (DAX measures, KPI cards, cross-page slicers) |
| **Project Management** | JIRA-style user story format, stakeholder mapping |
| **Documentation** | Business Requirements Document, process mapping |

---

## About

**Anurag Das** — Business Analyst  
📧 dasanurag97@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/anurag-das-2723263b5)  
💻 [GitHub](https://github.com/dasanurag97-maker)
