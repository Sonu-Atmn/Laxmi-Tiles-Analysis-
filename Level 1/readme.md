# Level 1 — Data Warehouse

## Overview

This level focuses on building the foundational data warehouse for the Tile Retail Analytics project using SQL Server.

The project uses customer, product, and sales datasets provided as CSV files. The datasets are loaded into SQL Server and structured into related tables to support the subsequent data cleaning, transformation, analysis, and reporting stages.

## Objectives

- Create the SQL Server database
- Design tables based on the source datasets
- Load CSV data into SQL Server
- Define primary keys
- Establish foreign key relationships
- Validate the loaded data

## Data Sources

| Dataset | Description |
|---|---|
| `customers.csv` | Customer information |
| `products.csv` | Product information |
| `sales.csv` | Sales transaction data |

## Database Structure

The database consists of three main tables:

- **Customers** — Stores customer information
- **Products** — Stores product and pricing information
- **Sales** — Stores sales transaction records

The `sales` table is related to both `customers` and `products` through foreign keys.

```text
Customers ───────< Sales >─────── Products