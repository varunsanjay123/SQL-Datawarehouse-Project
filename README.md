# Data Warehouse and Analytics Project using PostgreSQL

Welcome to the **Sales Data Warehouse and Analytics Project** repository! 🚀

This project demonstrates the design and implementation of a modern Data Warehouse using **PostgreSQL (pgAdmin)** and the **Medallion Architecture (Bronze, Silver, Gold)**. The solution transforms raw ERP and CRM data into business-ready analytical datasets that support reporting and decision-making.

---

# 🏗️ Data Architecture

The project follows the Medallion Architecture:

```text
CSV Files
    ↓
Bronze Layer
(Raw Data)
    ↓
Silver Layer
(Cleaned & Transformed Data)
    ↓
Gold Layer
(Business Ready Data)
```

## Bronze Layer

* Stores raw data loaded directly from CSV files.
* No transformations are applied.
* Preserves source system data for auditing and reprocessing.

## Silver Layer

* Performs data cleansing and transformation.
* Removes duplicates.
* Standardizes values.
* Handles missing and invalid data.
* Applies business rules.

## Gold Layer

* Creates business-ready views.
* Implements a Star Schema.
* Supports reporting and analytics.
* Contains Dimension and Fact Views.

---

# 📖 Project Overview

This project covers:

## 1. Data Warehouse Design

* Database creation in PostgreSQL.
* Schema creation:

  * Bronze
  * Silver
  * Gold

## 2. ETL Pipeline Development

* Loading CRM and ERP data from CSV files.
* Bronze → Silver transformations.
* Data cleansing and standardization.
* Business rule implementation.

## 3. Data Modeling

* Star Schema implementation.
* Dimension Views.
* Fact Views.

## 4. Analytics and Reporting

* Customer Analytics.
* Product Performance Analysis.
* Sales Trend Analysis.
* Country-wise Sales Reporting.

---

# 🎯 Skills Demonstrated

* PostgreSQL
* pgAdmin
* SQL Development
* Data Warehousing
* ETL Development
* Data Modeling
* Star Schema Design
* Data Cleansing
* Data Quality Validation
* Analytical Query Development

---

# 🛠️ Technologies Used

| Tool       | Purpose                        |
| ---------- | ------------------------------ |
| PostgreSQL | Database Management System     |
| pgAdmin    | Database Administration Tool   |
| SQL        | ETL and Analytics              |
| Draw.io    | Architecture and Data Modeling |
| GitHub     | Version Control                |
| CSV Files  | Source Data                    |

---

# 📂 Data Warehouse Layers

## Bronze Layer Tables

```text
bronze.crm_cust_info
bronze.crm_prd_info
bronze.crm_sales_details
bronze.erp_cust_az12
bronze.erp_loc_a101
bronze.erp_px_cat_g1v2
```

### Purpose

Stores raw source data exactly as received from CRM and ERP systems.

---

## Silver Layer Tables

```text
silver.crm_cust_info
silver.crm_prd_info
silver.crm_sales_details
silver.erp_cust_az12
silver.erp_loc_a101
silver.erp_px_cat_g1v2
```

### Purpose

Stores cleansed and transformed data.

### Transformations Applied

* Duplicate removal
* Null handling
* Data standardization
* Date validation
* Product categorization
* Gender normalization
* Country normalization

---

## Gold Layer Views

### Dimension Views

```text
gold.dim_customers
gold.dim_products
```

### Fact View

```text
gold.fact_sales
```

### Star Schema

```text
                 dim_customers
                        |
                        |
                        |
dim_products ----- fact_sales
```

---

# 📊 Business Analytics

The Gold Layer enables:

## Customer Analytics

* Customer demographics
* Gender distribution
* Country distribution
* Customer segmentation

## Product Analytics

* Product performance
* Category analysis
* Product line analysis

## Sales Analytics

* Revenue analysis
* Sales trends
* Top-selling products
* Customer purchase behavior

---

# 📁 Project Structure

```text
data-warehouse-project/
│
├── datasets/
│   ├── source_crm/
│   └── source_erp/
│
├── docs/
│   ├── data_architecture.drawio
│   ├── data_models.drawio
│   ├── data_catalog.md
│   └── data_flow.drawio
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── tests/
│
├── README.md
│
└── .gitignore
```

---

# ✅ Data Quality Checks

The project includes validation checks for:

* Duplicate Records
* Null Values
* Invalid Dates
* Invalid Product Costs
* Data Standardization
* Referential Integrity
* Fact-to-Dimension Relationships

---

# 🚀 Sample Analytics Queries

### Total Sales

```sql
SELECT SUM(sales_amount)
FROM gold.fact_sales;
```

### Sales by Country

```sql
SELECT
    c.country,
    SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY c.country
ORDER BY total_sales DESC;
```

### Top 10 Products

```sql
SELECT
    p.product_name,
    SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;
```

---

# 🌟 About Me

**Varun Sanjay P**

Aspiring Software Developer and Data Engineer with hands-on experience in:

* Java Development
* SQL
* PostgreSQL
* Data Warehousing
* ETL Development
* Data Analytics

This project demonstrates my understanding of Data Warehouse design, ETL processes, data modeling, and analytical reporting using PostgreSQL.

---

# 📜 License

This project is developed for learning and portfolio purposes.
