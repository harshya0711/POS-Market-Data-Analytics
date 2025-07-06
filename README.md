# 🧠 RetailInsights360 – POS & Market Data Analytics for CPG Strategy

**RetailInsights360** is a business analyst portfolio project simulating how global teams at Colgate-Palmolive use Point-of-Sale (POS) data and syndicated market data (like Nielsen/Kantar) to generate actionable insights and support data-driven decision-making.

This project uses only **SQL**, **Excel**, and **Tableau**, with a no-code/low-code approach that aligns with real-world FMCG analytics workflows.

---

## 🎯 Project Objective

To analyze brand-level performance using POS and external market data, highlight gaps in pricing, distribution, and volume, and deliver executive-level insights to marketing, sales, and category teams at a consumer packaged goods (CPG) company.

---

## 🧱 Tools & Technologies

| Tool     | Use Case                                 |
|----------|------------------------------------------|
| SQL      | ETL, KPI generation, joins, trends       |
| Excel    | Pivot tables, KPI tracking, comparisons  |
| Tableau  | Executive dashboard & visual storytelling|

---

## 📊 Data Sources

### 1. `pos_sales_data.csv`
Simulated transaction-level Point-of-Sale data:
- Brand
- Region
- Channel
- Units Sold
- Unit Price
- Promo Flag

### 2. `syndicated_market_data.csv`
Simulated syndicated data (e.g., Nielsen, IRI):
- Brand
- Market Share (%)
- Distribution Coverage (%)
- Average Market Price

---

## 🛠️ SQL Tables Created

- `pos_sales_data` – Cleaned transactional sales data
- `syndicated_market_data` – External brand-level market stats

---

## 📈 KPIs Tracked

| KPI                                  | Description                                              |
|-------------------------------------|----------------------------------------------------------|
| 💰 Total Revenue                    | Units Sold × Unit Price                                  |
| 📦 Promo Uplift (%)                | Additional sales due to promotions                       |
| 📊 Market Share (%)                | % of total volume in market                              |
| 🗺️ Distribution Gap               | Brands with <90% reach                                   |
| 💡 Price Gap                      | Brand Price vs. Market Avg Price                         |
| 🔄 Channel Contribution (%)        | Share of volume by sales channel                         |
| 🚨 Alerts                         | Share drops, promo dips, pricing spikes                  |

---

## 📂 Folder Structure

