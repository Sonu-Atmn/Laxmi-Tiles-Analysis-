---EDA (Exploratiory Data Analysis)

select * from cleaned_sales

-- SALES — BASIC OVERVIEW
-------------------------

SELECT
    MIN(order_date) AS FirstOrderDate,
    MAX(order_date) AS LastOrderDate,
    COUNT(*) AS TotalOrders,
    COUNT(DISTINCT customer_id) AS UniqueCustomers,
    COUNT(DISTINCT product_id) AS UniqueProducts,
    SUM(quantity) AS TotalQuantity,
    SUM(net_amount) AS TotalSales,
    AVG(net_amount) AS AverageOrderValue
FROM cleaned_sales;
/*
FirstOrderDate	LastOrderDate	TotalOrders	UniqueCustomers	UniqueProducts	TotalQuantity	TotalSales	    AverageOrderValue
2024-01-01	    2026-09-13	    2597	    120	            63	            28076	        25691314.49	    9892.689445
*/

--SALES — YEARLY PERFORMANCE
------------------------------

SELECT
    YEAR(order_date) AS OrderYear,
    COUNT(DISTINCT order_id) AS TotalOrders,
    SUM(quantity) AS TotalQuantity,
    SUM(net_amount) AS TotalSales,
    AVG(net_amount) AS AverageOrderValue
FROM cleaned_sales
GROUP BY YEAR(order_date)
ORDER BY OrderYear;
/*
OrderYear	TotalOrders	TotalQuantity	TotalSales	    AverageOrderValue
2024	    314	        10654	        10159371.07	    10293.182441
2025	    306	        10263	        9103254.25	    9643.277807
2026	    230	        7159	        6428689.17	    9652.686441
*/


-- SALES — TOP 10 CUSTOMERS
----------------------------
with top10c as (
SELECT TOP 10
    customer_id,
    COUNT(DISTINCT order_id) AS TotalOrders,
    SUM(quantity) AS TotalQuantity,
    SUM(net_amount) AS TotalSpent,
    AVG(net_amount) AS AverageOrderValue
FROM cleaned_sales
GROUP BY customer_id)
select c.customer_id,TotalOrders,TotalQuantity,TotalSpent,AverageOrderValue,customer_name,city from top10c t join cleaned_customers c on t.customer_id=c.customer_id
ORDER BY TotalSpent DESC;

/*
customer_id	TotalOrders	TotalQuantity	TotalSpent	AverageOrderValue	customer_name	city
C2008	11	379	515031.60	16094.737500	Vivek Kumar	Mumbai
C2007	7	257	362411.30	16473.240909	Shalini Khan	Chennai
C2002	11	329	337875.25	9937.507352	Ritu Gupta	Indore
C2005	12	350	275217.15	9173.905000	Divya Menon	Chennai
C2010	8	195	193298.35	8054.097916	Amit Kumar	Raipur
C2009	5	134	183121.39	9637.967894	Nitin Nair	Kolkata
C2001	4	187	151978.62	9498.663750	Rakesh Kumar	Bhubaneswar
C2003	4	74	84417.16	8441.716000	Vivek Rao	Kolkata
C2004	6	189	83425.89	4907.405294	Deepika Kapoor	Indore
C2006	5	127	50899.75	4627.250000	Rahul Ansari	Dhanbad
*/

-- SALES — TOP 10 PRODUCTS
---------------------------

SELECT TOP 10
    product_id,
    SUM(quantity) AS UnitsSold,
    COUNT(DISTINCT order_id) AS TotalOrders,
    SUM(net_amount) AS TotalSales
FROM cleaned_sales
GROUP BY product_id
ORDER BY TotalSales DESC


--Count By Order Status
select order_status,count(*) as Order_count from cleaned_sales group by order_status
/*Pending	364
Returned	391
Completed	1446
Cancelled	396*/


--count of orders by order-chanel
select order_channel,count(8) as count from cleaned_sales group by order_channel
/*
Showroom						634
Site Visit / Contractor Order	660
Website							645
Phone Order						658
*/

--count by orders_status and ordr channel 
select order_status,order_channel, count(*) as Order_count from cleaned_sales group by order_status,order_channel order by Order_count desc

--Total sales timeline
SELECT
    FORMAT(MIN(order_date), 'MMM-yyyy') AS MonthYear,sum(net_amount) as Total_sales
FROM cleaned_sales
GROUP BY
    YEAR(order_date),
    MONTH(Order_Date)
ORDER BY
    YEAR(Order_Date),
    MONTH(Order_Date);

--monthly sales difference

with cte as (SELECT
    FORMAT(MIN(order_date), 'MMM-yyyy') AS MonthYear,sum(net_amount) as Total_sales
FROM cleaned_sales
GROUP BY
    YEAR(order_date),
    MONTH(Order_Date))
select Monthyear,Total_sales,Total_sales-lag(Total_sales) over(order by Monthyear) from cte
