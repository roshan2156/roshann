--1. Write a CTE to display all products with their brand names.
WITH ProductBrandCTE AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        b.BrandName
    FROM products p
    JOIN brands b
        ON p.BrandID = b.BrandID
)
SELECT *
FROM ProductBrandCTE;


--2
WITH CustomersStartingA AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        email,
        phone
    FROM sales.customers
    WHERE last_name LIKE 'A%'
)
SELECT *
FROM CustomersStartingA;


--3
WITH ProductCountCTE AS (
    SELECT
        c.category_name,
        COUNT(p.product_id) AS total_products
    FROM production.products p
    JOIN production.categories c
        ON p.category_id = c.category_id
    GROUP BY c.category_name
)
SELECT * FROM ProductCountCTE;


--4
