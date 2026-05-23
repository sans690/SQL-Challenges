SELECT *  FROM customers ORDER BY customers.id;

SELECT products.name, products.price FROM products WHERE products.category IS 'Electronics' ORDER BY products.price DESC;

SELECT * FROM orders ORDER BY orders.order_date DESC LIMIT 10;

SELECT COUNT(products.id) FROM products;

SELECT orders.id FROM orders WHERE orders.status IS 'Shipped';

SELECT * FROM customers WHERE customers.id IS 1;

SELECT * FROM products WHERE products.price < 25;

SELECT * FROM orders WHERE orders.order_date > '2023-03-01';

SELECT COUNT(orders.id) FROM orders WHERE orders.status IS 'Cancelled';

SELECT * FROM products WHERE products.category IS 'Office Supplies';
