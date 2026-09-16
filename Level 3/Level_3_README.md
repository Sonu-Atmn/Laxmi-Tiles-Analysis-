# Level 3 --- Exploratory Data Analysis & Business Insights

## Overview

Level 3 focuses on Exploratory Data Analysis (EDA) using the cleaned
retail datasets created in Level 2.

The objective is to use SQL to understand sales performance, customer
behavior, product performance, and trends over time, and then convert
the findings into meaningful business insights.

## Datasets Used

The analysis is performed on:

-   `cleaned_sales`
-   `cleaned_customers`
-   `cleaned_products`

These tables were cleaned and validated during Level 2.

## Project Structure

``` text
Level 3/
│
├── scripts/
│   └── EDA.sql
│
└── readme.md
```

## EDA Objectives

The EDA is designed to answer key business questions such as:

-   How much total sales were generated?
-   How many orders and customers are there?
-   What is the average order value?
-   How are sales changing over time?
-   Which months perform best and worst?
-   What is the month-over-month sales growth?
-   Which products generate the most sales?
-   Which products sell the most units?
-   Which categories perform best?
-   Who are the highest-value customers?
-   How frequently do customers purchase?
-   What percentage of customers are repeat customers?
-   How concentrated are sales among top customers?
-   Are there unusual or high-value transactions?
-   Are there any remaining data-quality issues?
-   Are there products or customers that require further investigation?

## Analysis Areas

### 1. Overall Sales Performance

Key metrics analyzed include:

-   Total sales
-   Total orders
-   Total quantity sold
-   Number of customers
-   Number of products
-   Average order value

### 2. Time-Based Analysis

Sales and order activity are analyzed by:

-   Year
-   Month
-   Day

Month-over-month analysis is also performed to identify increases and
decreases in performance.

Example:

``` text
Current Month Sales - Previous Month Sales
```

and:

``` text
(Current Month Sales - Previous Month Sales)
÷ Previous Month Sales × 100
```

### 3. Customer Analysis

Customer behavior is analyzed using:

-   Total orders per customer
-   Total customer spending
-   Average order value
-   Order frequency
-   Repeat customer rate
-   First and last order dates
-   Customer spending segments

### 4. Product Analysis

Product performance is evaluated using:

-   Units sold
-   Number of orders
-   Total sales
-   Average sales
-   Top-performing products
-   Lowest-performing products

### 5. Category Analysis

Product categories are compared based on:

-   Total sales
-   Units sold
-   Number of products
-   Number of orders
-   Average order value

Monthly category performance is also analyzed to identify changing
customer demand.

### 6. Outlier Analysis

Unusual transactions are investigated rather than automatically removed.

Examples include:

-   Extremely high transaction values
-   Extremely low transaction values
-   Zero or negative sales
-   Unusual quantities

The purpose is to determine whether an unusual value represents a
genuine business transaction or a data issue.

### 7. Data Integrity Analysis

Relationships between the cleaned tables are checked to identify:

-   Sales records without a matching customer
-   Sales records without a matching product
-   Duplicate order IDs
-   Missing key values

## SQL Techniques Used

The EDA demonstrates practical SQL techniques including:

-   `SELECT`
-   `WHERE`
-   `GROUP BY`
-   `HAVING`
-   `ORDER BY`
-   `JOIN`
-   `LEFT JOIN`
-   `COUNT`
-   `COUNT(DISTINCT)`
-   `SUM`
-   `AVG`
-   `MIN`
-   `MAX`
-   `STDEV`
-   `CASE`
-   `CTE`
-   `LAG()`
-   `ROW_NUMBER()`
-   `DATEFROMPARTS()`
-   `FORMAT()`
-   Window functions

## Business Insights

The purpose of the analysis is not only to generate SQL results but to
translate those results into business findings.

Each important finding should be documented using:

  -----------------------------------------------------------------------
  Finding                 Evidence                Business Meaning
  ----------------------- ----------------------- -----------------------
  Example: Sales          MoM growth = X%         Demand increased
  increased in March                              

  Example: Category A     Total sales = X         Main revenue driver
  leads sales                                     

  Example: Top customers  Customer contribution   Sales are concentrated
  contribute X%           analysis                among high-value
                                                  customers
  -----------------------------------------------------------------------

Actual values should be filled in from the SQL results.

## EDA Workflow

``` text
Cleaned Data
     ↓
Overall Performance
     ↓
Time Analysis
     ↓
Customer Analysis
     ↓
Product Analysis
     ↓
Category Analysis
     ↓
Outlier Investigation
     ↓
Data Integrity Checks
     ↓
Business Insights
     ↓
Power BI Dashboard
```

## Outcome

By the end of Level 3, the project should have:

-   A complete SQL-based EDA
-   Key sales and customer metrics
-   Time-based performance analysis
-   Product and category rankings
-   Customer behavior analysis
-   Outlier investigations
-   Data integrity checks
-   A collection of business insights
-   A clear foundation for the Power BI dashboard

## Next Step

**Level 4 --- Power BI Dashboard**

The insights discovered during EDA will be used to design the dashboard
around actual business questions rather than simply displaying charts
and numbers.
