USE RoshanBikeStore

/*
Use online bike store database and design a query that returns count of orders as per order status. 
Result should include following columns: 
Pending, Processing, Rejected, Completed 
Note: order_status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed */
SELECT
    SUM(CASE WHEN order_status = 1 THEN 1 ELSE 0 END) AS Pending,
    SUM                                                                                                                                       M(CASE WHEN order_status = 2 THEN 1 ELSE 0 END) AS Processing,
    SUM(CASE WHEN order_status = 3 THEN 1 ELSE 0 END) AS Rejected,
    SUM(CASE WHEN order_status = 4 THEN 1 ELSE 0 END) AS Completed
FROM sales.orders;

/*
Use online bike store sample database and design a query that returns a table containing following columns: 
order_id, customer_name, order_date, shipped_date, store_name, staff_name, final_order_amount */

SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_date,
    o.shipped_date,
    s.store_name,
    CONCAT(st.first_name, ' ', st.last_name) AS staff_name,
    SUM(od.quantity * od.list_price * (1 - od.discount)) AS final_order_amount
FROM sales.orders o
JOIN sales.customers c 
    ON o.customer_id = c.customer_id
JOIN sales.stores s 
    ON o.store_id = s.store_id
JOIN sales.staffs st
    ON o.staff_id = st.staff_id
JOIN sales.order_items od
    ON o.order_id = od.order_id
GROUP BY 
    o.order_id,
    c.first_name, c.last_name,
    o.order_date,
    o.shipped_date,
    s.store_name,
    st.first_name, st.last_name
ORDER BY o.order_id;

/*Use online bike store sample database and design a query that returns a table containing following columns: 
brand_name, category_name, product_name, model_year, total_available_stock*/

SELECT 
    b.brand_name,
    c.category_name,
    p.product_name,
    p.model_year,
    SUM(s.quantity) AS total_available_stock
FROM production.products p
JOIN production.brands b
    ON p.brand_id = b.brand_id
JOIN production.categories c
    ON p.category_id = c.category_id
JOIN production.stocks s
    ON p.product_id = s.product_id
GROUP BY 
    b.brand_name,
    c.category_name,
    p.product_name,
    p.model_year
ORDER BY 
    b.brand_name,
    c.category_name,
    p.product_name;

/*Retrieve all the products having nth highest list price.*/

DECLARE @N INT = 3;   
SELECT product_name, list_price
FROM production.products
WHERE list_price = (
    SELECT DISTINCT list_price
    FROM production.products
    ORDER BY list_price DESC
    OFFSET (@N - 1) ROWS
    FETCH NEXT 1 ROWS ONLY
);
