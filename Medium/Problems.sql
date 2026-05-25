SELECT customers.first_name, customers.last_name, orders.order_date FROM customers LEFT JOIN orders ON orders.customer_id = customers.id WHERE customers.first_name IS 'Liam' AND customers.last_name IS 'Smith';

SELECT SUM(order_items.quantity * products.price) AS 'total_revenue' FROM products LEFT JOIN order_items ON order_items.product_id = products.id;

SELECT customers.first_name, customers.last_name, order_count FROM customers LEFT JOIN (SELECT orders.customer_id, COUNT(*) AS 'order_count' FROM orders GROUP BY orders.customer_id) orders ON orders.customer_id = customers.id WHERE order_count > 2;

SELECT products.name, SUM(order_items.quantity) AS 'quantity' FROM products JOIN order_items ON order_items.product_id = products.id WHERE order_items.order_id = 1 GROUP BY products.name;

SELECT customers.first_name, customers.last_name FROM customers LEFT JOIN orders ON orders.customer_id = customers.id WHERE orders.id IS NULL;

SELECT orders.id, orders.order_date FROM orders LEFT JOIN customers ON customers.id = orders.customer_id WHERE customers.id = 1 GROUP BY orders.order_date;

SELECT DISTINCT customers.first_name, customers.last_name FROM customers JOIN orders ON orders.customer_id = customers.id JOIN order_items ON order_items.order_id = orders.id WHERE order_items.product_id = 2;

SELECT SUM(quantity * price_per_unit) AS 'revenue' FROM orders JOIN order_items ON order_id = id WHERE order_date LIKE '%2023-03%';

SELECT first_name, last_name FROM customers JOIN orders ON orders.customer_id = customers.id AND orders.status = 'Cancelled';

SELECT first_name, last_name FROM customers LEFT JOIN (SELECT customer_id, status, COUNT(*) AS 'order_count' FROM orders GROUP BY customer_id) AS o ON o.customer_id = id WHERE o.order_count >= 1 AND o.status = 'Cancelled';

SELECT c.first_name, c.last_name, o.order_count FROM customers c JOIN (select orders.customer_id, count(*) AS 'order_count' FROM orders GROUP BY orders.customer_id) AS 'o' ON o.customer_id = c.id WHERE o.order_count >= 2;

SELECT AVG(avg_order_value) FROM orders JOIN (SELECT order_items.order_id, SUM(order_items.quantity * order_items.price_per_unit) AS 'avg_order_value' FROM order_items GROUP BY order_items.order_id) AS 'oi' ON oi.order_id = orders.id;

SELECT p.name, oi.total_quantity FROM products p JOIN (SELECT order_items.product_id, SUM(order_items.quantity) AS 'total_quantity' FROM order_items GROUP BY order_items.product_id) AS 'oi' ON oi.product_id = p.id;

SELECT c.first_name, c.last_name, o.first_order FROM customers c JOIN (SELECT orders.customer_id, MIN(orders.order_date) AS 'first_order' FROM orders GROUP BY orders.customer_id) AS 'o' ON o.customer_id = c.id;

SELECT STRFTIME('%Y-%m', orders.order_date) AS 'month', COUNT(orders.id) AS orders_in_month FROM orders WHERE orders.order_date LIKE '%2023%' GROUP BY STRFTIME('%m', orders.order_date);

SELECT DISTINCT c.first_name, c.last_name FROM customers c JOIN orders ON orders.customer_id = c.id JOIN order_items ON order_items.order_id = orders.id JOIN products ON products.id = order_items.product_id WHERE products.category = 'Electronics';

SELECT order_items.order_id AS 'order_id', order_items.quantity AS 'total_quantity' FROM order_items WHERE total_quantity > 3 GROUP BY order_items.order_id;

SELECT SUM(order_items.quantity * order_items.price_per_unit) AS 'total_spent' FROM order_items JOIN orders ON orders.id = order_items.order_idJOIN customers ON customers.id = orders.customer_id WHERE customers.id = 5;

SELECT c.first_name, c.last_name FROM customers c JOIN orders ON orders.customer_id = c.id JOIN order_items ON order_items.order_id = orders.id WHERE orders.order_date LIKE '%2023-04%';