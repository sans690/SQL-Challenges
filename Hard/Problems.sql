SELECT 
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.price_per_unit) AS total_spent
FROM 
    customers c
LEFT JOIN 
    orders o ON o.customer_id = c.id
LEFT JOIN 
    order_items oi ON oi.order_id = o.id
GROUP BY 
    c.first_name,
    c.last_name
ORDER BY 
    total_spent DESC
LIMIT 5;

SELECT 
    STRFTIME('%Y-%m', o.order_date) AS month,
    SUM(oi.quantity * oi.price_per_unit) AS monthly_revenue
FROM 
    orders o
JOIN 
    order_items oi ON oi.order_id = o.id
WHERE 
    o.order_date LIKE '%2023%'
GROUP BY 
    STRFTIME('%m', o.order_date);

SELECT 
    c.first_name,
    c.last_name
FROM 
    customers c
JOIN 
    orders o ON o.customer_id = c.id
JOIN 
    order_items oi ON oi.order_id = o.id
JOIN 
    products p ON p.id = oi.product_id
WHERE 
    p.name LIKE '%Laptop Pro 15"%'
GROUP BY 
    c.first_name, 
    c.last_name;

SELECT 
    p.name
FROM 
    products p
LEFT JOIN 
    order_items oi ON oi.product_id = p.id
WHERE 
    oi.product_id IS NULL;

SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.id) AS order_count,
    RANK() OVER(ORDER BY COUNT(DISTINCT o.id) DESC) AS customer_rank
FROM 
    customers c
JOIN 
    orders o ON o.customer_id = c.id
GROUP BY 
    c.id,
    c.first_name,
    c.last_name;

--next one also works

SELECT 
    c.first_name,
    c.last_name,
    COUNT(DISTINCT oi.order_id) AS order_count,
    RANK() OVER(ORDER BY COUNT(DISTINCT oi.order_id)DESC) AS customer_rank
FROM 
    customers c
JOIN 
    orders o ON o.customer_id = c.id
JOIN 
    order_items oi ON oi.order_id = o.id
GROUP BY 
    c.id,
    c.first_name,
    c.last_name;

SELECT 
    DISTINCT 
        p.name, 
        p.price, 
        RANK() OVER(ORDER BY p.price DESC) AS price_rank
FROM 
    products p 
WHERE 
    p.category = 'Electronics';

SELECT 
    c.first_name, 
    c.last_name, 
    cnt
FROM 
    customers c
JOIN (
    SELECT o.customer_id,
    COUNT(o.id) AS cnt 
FROM 
    orders o 
GROUP BY 
    o.customer_id) AS subquery ON subquery.customer_id = c.id
ORDER BY 
    cnt DESC
LIMIT 2;

SELECT 
    c.first_name,
    c.last_name 
FROM 
    customers c 
WHERE 
    EXISTS (
        SELECT * 
        FROM 
            orders o
        WHERE 
            o.status = 'Processing' 
        AND o.customer_id = c.id);