SELECT customers.first_name, customers.last_name, orders.order_date FROM customers LEFT JOIN orders ON orders.customer_id = customers.id WHERE customers.first_name IS 'Liam' AND customers.last_name IS 'Smith';

SELECT SUM(order_items.quantity * products.price) AS 'total_revenue' FROM products LEFT JOIN order_items ON order_items.product_id = products.id;

SELECT customers.first_name, customers.last_name, order_count FROM customers LEFT JOIN (SELECT orders.customer_id, COUNT(*) AS 'order_count' FROM orders GROUP BY orders.customer_id) orders ON orders.customer_id = customers.id WHERE order_count > 2;

SELECT products.name, SUM(order_items.quantity) AS 'quantity' FROM products JOIN order_items ON order_items.product_id = products.id WHERE order_items.order_id = 1 GROUP BY products.name;

SELECT customers.first_name, customers.last_name FROM customers LEFT JOIN orders ON orders.customer_id = customers.id WHERE orders.id IS NULL;

SELECT orders.id, orders.order_date FROM orders LEFT JOIN customers ON customers.id = orders.customer_id WHERE customers.id = 1 GROUP BY orders.order_date;

SELECT DISTINCT customers.first_name, customers.last_name FROM customers JOIN orders ON orders.customer_id = customers.id JOIN order_items ON order_items.order_id = orders.id WHERE order_items.product_id = 2;

SELECT SUM(quantity * price_per_unit) AS 'revenue' FROM orders JOIN order_items ON order_items.order_id = id WHERE order_date LIKE '%2023-03%';

SELECT first_name, last_name FROM customers JOIN orders ON orders.customer_id = customers.id AND orders.status = 'Cancelled';

SELECT customers.first_name, customers.last_name, order_count FROM customers JOIN (SELECT orders.customer_id, COUNT(*) AS 'order_count' FROM orders GROUP BY orders.customer_id) AS 'o' ON o.customer_id = customers.id WHERE order_count >= 2;