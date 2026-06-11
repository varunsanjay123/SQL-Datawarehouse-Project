-- =============================================================
-- Create Database
-- =============================================================

DROP DATABASE IF EXISTS datawarehouse;

CREATE DATABASE datawarehouse;

-- =============================================================
-- Create Schemas
-- =============================================================

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE SCHEMA IF NOT EXISTS silver;

CREATE SCHEMA IF NOT EXISTS gold;


--Verify Database

SELECT datname
FROM pg_database
WHERE datname = 'datawarehouse';

--Verify Schemas

SELECT schema_name
FROM information_schema.schemata
WHERE schema_name IN ('bronze', 'silver', 'gold');