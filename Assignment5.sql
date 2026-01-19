
USE DbRoshanTraining

SELECT store_id, YEAR(order_date) AS year, COUNT(order_id) AS TotalOrdersReceived
FROM sales.orders
GROUP BY store_id, YEAR(order_date)
ORDER BY store_id, year;