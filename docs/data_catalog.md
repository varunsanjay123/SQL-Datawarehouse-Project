# Data Catalog for Gold Layer

## Overview

The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of **dimension tables** and **fact tables** that provide clean, enriched, and business-ready data for reporting, dashboards, and analytics.

---

# 1. gold.dim_customers

## Purpose

Stores customer details enriched with demographic and geographic information.

| Column Name     | Data Type   | Description                                                                           |
| --------------- | ----------- | ------------------------------------------------------------------------------------- |
| customer_key    | INT         | Surrogate key uniquely identifying each customer record in the dimension table.       |
| customer_id     | INT         | Unique numerical identifier assigned to each customer.                                |
| customer_number | VARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| first_name      | VARCHAR(50) | The customer's first name, as recorded in the system.                                 |
| last_name       | VARCHAR(50) | The customer's last name or family name.                                              |
| country         | VARCHAR(50) | The country of residence for the customer (e.g., Australia, United States).           |
| marital_status  | VARCHAR(50) | The marital status of the customer (e.g., Married, Single).                           |
| gender          | VARCHAR(50) | The gender of the customer (e.g., Male, Female, n/a).                                 |
| birthdate       | DATE        | The date of birth of the customer in YYYY-MM-DD format.                               |
| create_date     | DATE        | The date when the customer record was created in the source system.                   |

---

# 2. gold.dim_products

## Purpose

Provides detailed information about products and their attributes.

| Column Name    | Data Type   | Description                                                                          |
| -------------- | ----------- | ------------------------------------------------------------------------------------ |
| product_key    | INT         | Surrogate key uniquely identifying each product record in the dimension table.       |
| product_id     | INT         | A unique identifier assigned to the product for internal tracking and referencing.   |
| product_number | VARCHAR(50) | A structured alphanumeric code representing the product.                             |
| product_name   | VARCHAR(50) | Descriptive name of the product, including attributes such as type, color, and size. |
| category_id    | VARCHAR(50) | Identifier representing the product category.                                        |
| category       | VARCHAR(50) | High-level classification of the product (e.g., Bikes, Components, Clothing).        |
| subcategory    | VARCHAR(50) | Detailed classification of the product within a category.                            |
| maintenance    | VARCHAR(50) | Indicates whether the product requires maintenance (e.g., Yes, No).                  |
| cost           | INT         | Cost or base price of the product.                                                   |
| product_line   | VARCHAR(50) | Product line or series (e.g., Road, Mountain, Touring).                              |
| start_date     | DATE        | The date when the product became available for sale.                                 |

---

# 3. gold.fact_sales

## Purpose

Stores transactional sales data for analytical and reporting purposes.

| Column Name   | Data Type   | Description                                                            |
| ------------- | ----------- | ---------------------------------------------------------------------- |
| order_number  | VARCHAR(50) | Unique alphanumeric identifier for each sales order.                   |
| product_key   | INT         | Surrogate key linking the transaction to the product dimension table.  |
| customer_key  | INT         | Surrogate key linking the transaction to the customer dimension table. |
| order_date    | DATE        | The date when the order was placed.                                    |
| shipping_date | DATE        | The date when the order was shipped to the customer.                   |
| due_date      | DATE        | The date when payment for the order was due.                           |
| sales_amount  | INT         | Total monetary value of the sales transaction.                         |
| quantity      | INT         | Number of product units sold.                                          |
| price         | INT         | Unit price of the product at the time of sale.                         |

---

# Star Schema Overview

```text
                gold.dim_customers
                       |
                       |
                       |
gold.dim_products ---- gold.fact_sales
```

### Dimension Tables

* **gold.dim_customers**
* **gold.dim_products**

### Fact Table

* **gold.fact_sales**

---

# Business Purpose

The Gold Layer provides:

* Clean and standardized business data.
* A star schema optimized for analytics.
* Customer-centric reporting.
* Product performance analysis.
* Sales trend analysis.
* Country-wise sales reporting.
* Dashboard and BI tool integration.

This layer serves as the final presentation layer of the Data Warehouse and is intended for business users, analysts, and reporting tools.
