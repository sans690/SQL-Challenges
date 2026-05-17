SELECT customers.first_name, customers.last_name, orders.order_date FROM customers LEFT JOIN orders ON orders.customer_id = customers.id WHERE customers.first_name IS 'Liam' AND customers.last_name IS 'Smith';

SELECT SUM(order_items.quantity * products.price) AS 'total_revenue' FROM products LEFT JOIN order_items ON order_items.product_id = products.id;

SELECT customers.first_name, customers.last_name, order_count FROM customers LEFT JOIN (SELECT orders.customer_id, COUNT(*) AS 'order_count' FROM orders GROUP BY orders.customer_id) orders ON orders.customer_id = customers.id WHERE order_count > 2;

SELECT products.name, SUM(order_items.quantity) AS 'quantity' FROM products JOIN order_items ON order_items.product_id = products.id WHERE order_items.order_id = 1 GROUP BY products.name;