SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.price_per_unit) AS 'total_spent' 
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
LEFT JOIN order_items oi ON oi.order_id = o.id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

SELECT STRFTIME('%Y-%m', o.order_date) AS month, SUM(oi.quantity * oi.price_per_unit) AS monthly_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
WHERE o.order_date LIKE '%2023%'
GROUP BY STRFTIME('%m', o.order_date);

SELECT c.first_name, c.last_name
FROM customers c
JOIN orders o ON o.customer_id = c.id
JOIN order_items oi ON oi.order_id = o.id
JOIN products p ON p.id = oi.product_id
WHERE p.name LIKE '%Laptop Pro 15"%'
GROUP BY c.first_name, c.last_name;
