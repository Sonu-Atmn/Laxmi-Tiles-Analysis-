BULK INSERT customers
FROM 'C:\Users\nites\OneDrive\Desktop\python\Data Analysis\tiles project\customers.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"'
);

BULK INSERT products
FROM 'C:\Users\nites\OneDrive\Desktop\python\Data Analysis\tiles project\products.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"'
);

BULK INSERT sales
FROM 'C:\Users\nites\OneDrive\Desktop\python\Data Analysis\tiles project\sales.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"'
);

SELECT 
    'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 
    'products', COUNT(*) FROM products
UNION ALL
SELECT 
    'sales', COUNT(*) FROM sales;