# Level 2 --- SQL Data Cleaning & EDA

## Overview

Level 2 focuses on preparing raw retail data for analysis using SQL
Server.

The raw datasets are copied into cleaned tables, data quality issues are
identified and corrected, reusable SQL logic is created through stored
procedures, and the cleaned data is prepared for Exploratory Data
Analysis (EDA).

## Datasets

The project uses three main datasets:

-   `sales`
-   `customers`
-   `products`

Cleaned versions are stored as:

-   `cleaned_sales`
-   `cleaned_customers`
-   `cleaned_products`

## Project Structure

``` text
Level 2/
│
├── cleaned_datasets/
│   ├── cleaned_sales.csv
│   ├── cleaned_customers.csv
│   └── cleaned_products.csv
│
├── scripts/
│   ├── cleaning_table.sql
│   └── Stored_procedures.sql
│
├── relation_diagram.png
└── readme.md
```

## Data Cleaning Process

The cleaning process was performed directly on copies of the original
tables so that the raw data remains unchanged.

### Main steps

1.  Created cleaned copies of the raw tables.
2.  Checked for duplicate IDs.
3.  Profiled columns and values.
4.  Checked NULL values across all columns.
5.  Investigated NULL values and applied appropriate replacements where
    required.
6.  Checked categorical values for consistency.
7.  Prepared the cleaned tables for further analysis.

## Stored Procedure

A reusable stored procedure was created to check NULL values for any
selected table.

``` sql
EXEC CheckNullValues 'cleaned_sales';
```

The procedure dynamically checks every column and returns the result as
a list:

``` text
ColumnName        NullCount
----------------  ---------
customer_id       0
product_id        0
payment_method    0
net_amount        0
```

The same procedure can be used for:

``` sql
EXEC CheckNullValues 'cleaned_customers';

EXEC CheckNullValues 'cleaned_products';
```

## Data Validation

After cleaning, the datasets were validated again to confirm that:

-   Required IDs are present.
-   Duplicate records are investigated.
-   NULL values are identified.
-   Categorical values are consistent.
-   Numeric values are reasonable.
-   The cleaned tables are suitable for analysis.

## Relationship Between Tables

The three datasets are connected through their key fields.

``` text
cleaned_customers
        │
        │ customer_id
        ▼
   cleaned_sales
        │
        │ product_id
        ▼
cleaned_products
```

The relationship diagram is included in `relation_diagram.png`.

## Exploratory Data Analysis

After cleaning and validation, the next stage is EDA.

The EDA focuses on understanding:

-   Overall sales performance
-   Order volume
-   Monthly and yearly trends
-   Month-over-month sales changes
-   Average order value
-   Top customers
-   Top products
-   Product/category performance
-   Customer purchasing behavior
-   Repeat customers
-   High-value transactions
-   Outliers
-   Data relationships and business patterns

The objective is to turn the cleaned data into meaningful business
insights that can later be used for reporting and dashboard development.

## Tools Used

-   **SQL Server / SSMS** --- Data cleaning, validation, stored
    procedures, and EDA
-   **VS Code** --- SQL script organization and project management
-   **draw.io** --- Database relationship diagram
-   **Power BI** --- Planned visualization and dashboard stage

## Outcome

By the end of Level 2, the project has:

-   Structured cleaned datasets
-   Reusable SQL data-quality logic
-   Validated tables
-   Documented table relationships
-   A foundation for Exploratory Data Analysis
-   A clean data layer ready for visualization and business reporting

## Next Step

**Level 3 --- Exploratory Data Analysis & Business Insights**

The next stage will use SQL to analyze the cleaned datasets, identify
trends and patterns, and develop business-focused insights for the final
dashboard.
