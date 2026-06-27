# Retail Sales Analysis | SQL • Python • Tableau

A complete end-to-end retail analytics project that demonstrates the entire data analytics workflow—from relational database design and SQL querying to exploratory data analysis (EDA) and interactive dashboard development.

This project analyzes **600,000 retail transaction records** across multiple relational tables to uncover sales trends, customer behavior, product performance, supplier performance, and store-level insights using **MySQL, Python, and Tableau**.

---

# Project Objective

The objective of this project is to simulate a real-world retail analytics workflow by integrating SQL, Python, and Tableau into a single analytics pipeline.

The project covers:

- Database querying using MySQL
- Data cleaning and validation
- Exploratory Data Analysis (EDA)
- Business KPI generation
- Analytical SQL view creation
- Interactive Tableau dashboard development

---

# Tech Stack

| Tool | Purpose |
|------|----------|
| MySQL | Database Management & SQL Analysis |
| Python | Data Cleaning & EDA |
| Pandas | Data Manipulation |
| NumPy | Numerical Computing |
| Matplotlib | Data Visualization |
| Tableau Public | Interactive Dashboard |
| Google Colab | Python Development |

---

#  Dataset Description

The project uses a synthetic retail sales dataset consisting of **8 relational tables** that simulate the operations of a retail business.

| Table | Description |
|--------|-------------|
| Customers | Customer information and signup details |
| Orders | Order details including order date, customer, payment and store |
| Order Items | Individual products purchased in each order |
| Products | Product catalog with selling price, supplier and category |
| Categories | Product category information |
| Stores | Store details and city |
| Payments | Payment amount for each order |
| Shipments | Shipment status of each order |

### Dataset Statistics

- **600,000 Order Item Records**
- **259,233 Unique Orders**
- **50,000 Customers**
- **10 Stores**
- **30 Product Categories**
- **2020 – 2023 Sales Data**
- **8 Relational Tables**

---

# Project Workflow

```
CSV Files
      │
      ▼
MySQL Database
      │
      ▼
SQL Data Cleaning & Validation
      │
      ▼
SQL Analysis & Analytical Views
      │
      ▼
Python (EDA & KPI Analysis)
      │
      ▼
Final SQL Dashboard View (vw_dashboard_data)
      │
      ▼
CSV Export
      │
      ▼
Tableau Dashboard
```

---

# SQL Analysis

The SQL phase focuses on transforming relational data into analytics-ready datasets.

### SQL Concepts Used

- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- GROUP BY
- ORDER BY
- CASE Statements
- Date Functions
- Views
- Common Analytical Queries

### Analytical SQL Views Created

- **vw_monthly_sales** – Monthly revenue and order trends
- **vw_product_performance** – Product-wise sales performance
- **vw_customer_performance** – Customer purchase analysis
- **vw_store_performance** – Store-wise revenue analysis
- **vw_dashboard_data** – Final denormalized analytical view combining all required tables for Tableau visualization

Instead of connecting Tableau directly to multiple relational tables, a **single analytics-ready SQL view (`vw_dashboard_data`)** was created and exported as a CSV. This approach simplifies dashboard development, improves performance, and mirrors real-world BI workflows.

---

# Python Analysis

Python was used for:

- Data Quality Assessment
- Missing Value Analysis
- Duplicate Detection
- Data Validation
- Exploratory Data Analysis (EDA)
- Business KPI Generation

### EDA Visualizations

- Monthly Revenue Trend
- Revenue by Category
- Top 10 Products
- Top Customers
- Revenue by Store
- Revenue by Customer City
- Shipment Status Distribution
- Average Selling Price by Category
- Top Suppliers by Revenue
- Customer Signups Over Time

All EDA visualizations were exported into a single PDF report.

---

# 📈 Tableau Dashboard

The Tableau dashboard provides an interactive overview of retail sales performance.

### KPI Cards

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value

### Dashboard Visualizations

- Monthly Revenue Trend
- Revenue by Category
- Top Products
- Revenue by Store
- Revenue by Customer City
- Shipment Status Distribution
- Top Suppliers by Revenue
- Revenue by Quarter

---

# Project Structure

```
Retail-Sales-Analysis/
│
├── Dataset/
│   ├── customers.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── products.csv
│   ├── categories.csv
│   ├── stores.csv
│   ├── payments.csv
│   └── shipments.csv
│
├── SQL/
│   ├── create_database.sql
│   ├── create_tables.sql
│   ├── load_data.sql
│   ├── data_validation_cleaning.sql
│   ├── bussiness_queries.sql
|   ├── views.sql
|
├── Python/
│   ├── retail_sales_analysis.ipynb
│   ├── Retail_EDA_Report.pdf
│
├── Tableau/
│   ├── Retail Sales Dashboard.twb
│   ├── dashboard_preview.png
│
├── README.md
│
└── LICENSE
```

---

# Dashboard Preview

> **Add your Tableau dashboard screenshot here**

![Dashboard Preview](images/dashboard_preview.png)

---

# 📄 EDA Report

Python automatically generates a PDF report containing all exploratory data analysis visualizations.

---

# Skills Demonstrated

### SQL

- Database Design
- Data Cleaning
- Complex Joins
- Analytical Views
- Aggregations
- Business Queries

### Python

- Pandas
- NumPy
- Data Cleaning
- Exploratory Data Analysis
- Data Visualization
- Business KPI Analysis

### Tableau

- Dashboard Design
- KPI Cards
- Interactive Filters
- Time-Series Analysis
- Business Storytelling

---

# Key Learning Outcomes

- Built an end-to-end analytics pipeline using SQL, Python, and Tableau.
- Transformed normalized relational data into an analytics-ready SQL view.
- Performed comprehensive exploratory data analysis and business KPI generation.
- Designed an interactive Tableau dashboard for executive-level reporting.
- Applied best practices for data cleaning, visualization, and dashboard development.

---

# Future Improvements

- Customer Segmentation (RFM Analysis)
- Cohort Analysis
- Customer Lifetime Value (CLV)
- Profit & Margin Analysis
- Sales Forecasting
- Inventory Analytics
- Regional Sales Performance

---

# 🔗 Tableau Dashboard

**Tableau Public:** *(Add your Tableau Public link here)*

---
