# 📊 E-Commerce Sales Analysis
### Business Analyst Portfolio Project

![SQL](https://img.shields.io/badge/SQL-SQLite-blue?logo=sqlite&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power%20BI-DAX-yellow?logo=powerbi&logoColor=black)
![Excel](https://img.shields.io/badge/Excel-Data%20Cleaning-green?logo=microsoftexcel&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📌 Business Problem

> *"We are generating significant revenue but do not know which products and regions are eroding our margins. Discount decisions are made ad hoc, costing the business an estimated $18K+ per year in recoverable profit."*

**Dataset:** Superstore Sales | 9,994 rows | 4 Regions | 3 Categories | 17 Sub-Categories

---

## 🔑 Key Findings

| # | Finding | Impact |
|---|---------|--------|
| 1 | 🔴 West region = **32% of sales** but only **18% of profit** | Technology discounting eroding margins |
| 2 | 💰 Discount cap at 20% in West/Technology | **$18K projected annual profit recovery** |
| 3 | 📉 Tables & Bookcases are **loss-making** sub-categories | Negative margin in Furniture |
| 4 | ⭐ Home Office segment has **highest profit margin %** | Underinvested vs Consumer/Corporate |
| 5 | 📅 Q4 drives **peak sales** consistently | Q1/Q2 need targeted promotions |

---

## 📁 Project Structure

```
ecommerce-sales-analysis/
├── 📂 sql/
│   ├── 01_revenue_by_region.sql       ← Sales & profit by region
│   ├── 02_top_products.sql            ← Top 10 products
│   ├── 03_monthly_trends.sql          ← Monthly trends + MoM growth
│   ├── 04_category_performance.sql    ← Category profitability
│   ├── 05_customer_segments.sql       ← Segment analysis
│   └── 06_discount_impact.sql         ← Discount impact + $18K model
├── 📂 docs/
│   └── BRD_ECommerce_Sales_Analysis.docx
├── 📄 superstore_sales.csv            ← Source dataset (9,994 rows)
├── 📄 DASHBOARD_GUIDE.md              ← Power BI build guide + DAX
└── 📄 README.md
```

---

## 🗂️ BA Deliverables

| Deliverable | Description |
|-------------|-------------|
| 📋 **BRD** | Business Requirements Document with stakeholder matrix, user stories, AS-IS/TO-BE process mapping |
| 👤 **User Stories** | 3 stakeholders — Sales Manager, Marketing Head, Finance |
| ✅ **Acceptance Criteria** | Defined for all 3 user stories |
| 🔄 **Process Mapping** | AS-IS vs TO-BE workflow redesign (BPMN) |
| 🔍 **SQL Queries** | 6 queries covering region, product, segment, trend & discount analysis |
| 📊 **Power BI Dashboard** | 3-page dashboard with DAX measures and cross-page slicers |

---

## 💡 SQL Highlights

**Discount Impact Analysis — West Region Technology**
```sql
CASE
    WHEN Discount = 0        THEN '0% (No Discount)'
    WHEN Discount <= 0.10    THEN '1-10%'
    WHEN Discount <= 0.20    THEN '11-20%'
    WHEN Discount <= 0.30    THEN '21-30%'
    ELSE                          '30%+'
END AS discount_bracket
```
> Orders with 30%+ discounts show **negative profit margins** across all regions.

---

## 🛠️ Tools & Skills

| Area | Details |
|------|---------|
| **BA Skills** | Requirements Gathering · BRD · User Stories · Gap Analysis · AS-IS/TO-BE · UAT |
| **SQL** | Joins · CTEs · Window Functions · CASE · Aggregations |
| **Visualisation** | Power BI · DAX measures · KPI Cards · Cross-page slicers |
| **Data** | Excel · SQLite · CSV cleaning |
| **Methods** | Agile · BPMN · Stakeholder Management |

---

## 👤 About

**Anurag Das** — Business Analyst  
📧 dasanurag97@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/anurag-das-2723263b5)  
💻 [GitHub](https://github.com/dasanurag97-maker)
