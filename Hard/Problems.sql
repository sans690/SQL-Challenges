SELECT c.first_name, c.last_name, SUM(oi.quantity * oi.price_per_unit) AS 'total_spent' 
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
LEFT JOIN order_items oi ON oi.order_id = o.id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;


