USE DbRoshanTraining;

SELECT *
FROM sales.customers
WHERE state <> 'NY';

--2
SELECT 
    first_name + ' ' + last_name AS [Customer Name],
    phone AS Phone
FROM sales.customers
WHERE phone IS NOT NULL
ORDER BY first_name, last_name;

--3
SELECT 
    first_name + ' ' + last_name AS [Customer Name],
    email
FROM sales.customers
WHERE email LIKE '%@msn.com'
   OR email LIKE '%@hotmail.com';
   
--4
   SELECT *
FROM sales.customers
WHERE first_name LIKE '%rob%'
   OR last_name LIKE '%rob%';


--5
   SELECT 
    first_name + ' ' + last_name AS [Customer Name],
    street AS Address
FROM sales.customers
WHERE street LIKE '[0-9][0-9][0-9][0-9]%';

--6
SELECT 
    state AS State,
    COUNT(DISTINCT city) AS [Total Cities],
    COUNT(*) AS [Total Customers]
FROM sales.customers
GROUP BY state;

--7
SELECT 
    city AS City,
    STRING_AGG(email, '; ') AS [Customer Email]
FROM sales.customers
WHERE city IN ('Jackson Heights', 'New York', 'Baldwin', 'Oakland')
  AND email IS NOT NULL
GROUP BY city;

--8

SELECT 
    state AS State,
    city AS City,
    COUNT(*) AS [Total Customer]
FROM sales.customers
GROUP BY state, city
HAVING COUNT(*) > 10;

--9
SELECT DISTINCT 
    RIGHT(email, LEN(email) - CHARINDEX('@', email)) AS [Email Domain]
FROM sales.customers
WHERE email IS NOT NULL;

--10
SELECT 
    store_id,
    COUNT(*) AS [Staff Headcount]
FROM sales.staffs
GROUP BY store_id;

--11
WITH OrderAmounts AS (
    SELECT 
        oi.order_id,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_amount
    FROM sales.order_items oi
    GROUP BY oi.order_id
)

SELECT 
    order_id,
    order_amount,
    'Highest' AS [Highest/Lowest]
FROM (
    SELECT 
        oi.order_id,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_amount
    FROM sales.order_items oi
    GROUP BY oi.order_id
) AS OrderAmounts
WHERE order_amount = (
    SELECT MAX(order_amount)
    FROM (
        SELECT 
            SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_amount
        FROM sales.order_items oi
        GROUP BY oi.order_id
    ) t
)

UNION ALL

SELECT 
    order_id,
    order_amount,
    'Lowest' AS [Highest/Lowest]
FROM (
    SELECT 
        oi.order_id,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_amount
    FROM sales.order_items oi
    GROUP BY oi.order_id
) AS OrderAmounts
WHERE order_amount = (
    SELECT MIN(order_amount)
    FROM (
        SELECT 
            SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS order_amount
        FROM sales.order_items oi
        GROUP BY oi.order_id
    ) t
);

--12

SELECT 
    order_id,
    COUNT(DISTINCT product_id) AS total_products,
    SUM(quantity) AS total_quantity
FROM sales.order_items
GROUP BY order_id
ORDER BY order_id;

--13
    SELECT *
FROM production.products
WHERE product_name LIKE '%Women%'
   OR product_name LIKE '%Girls%'
   OR product_name LIKE '%Ladies%';

--14
   SELECT 
    p.product_id,
    p.product_name,
    p.brand_id,
    p.category_id,
    p.model_year,
    p.list_price
FROM production.products p
JOIN production.brands b
    ON p.brand_id = b.brand_id
WHERE b.brand_name IN ('Trek', 'Electra')
  AND p.model_year = 2017;


--15
  SELECT
    SUM(quantity * list_price * (1 - discount)) AS [Total Revenue],
    SUM(quantity * list_price * discount) AS [Total Discount Provided]
FROM sales.order_items;