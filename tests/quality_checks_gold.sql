--1. Customer Key Uniqueness

SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

--2. Product Key Uniqueness

SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

--3. Fact-to-Dimension Relationship Check

SELECT *
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
       ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
       ON p.product_key = f.product_key
WHERE p.product_key IS NULL
   OR c.customer_key IS NULL;

