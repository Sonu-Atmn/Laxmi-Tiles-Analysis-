--creating cleaned table
select * into cleaned_sales from sales;
select * into cleaned_products from products;
select * into cleaned_customers from customers;


---cleaning tables sales
--chcking duplicates
select sales_id from cleaned_sales group by sales_id having count(*) >1; --no duplicates

--checking nulls 
exec checknullvalues 'cleaned_sales' --73 nulls in payment method

select distinct payment_method from cleaned_sales

update cleaned_sales
set payment_method = 'Cash'
where payment_method is null  -- no nulls now

--colunm profiling 
select * from cleaned_sales  -- seems fine 

--cleaning table customers
--checking duplicates
select customer_id from cleaned_customers group by customer_id having count(*) >1; --no duplicates 
--checking nulls 
exec CheckNullValues 'cleaned_customers';--68 gst numbers maube they dont have one 

--cleaning table products
--checking duplicates
select product_id from cleaned_products group by product_id having count(*) >1; --no duplicates 
--checking nulls 
exec CheckNullValues 'cleaned_products';--no nulls found



