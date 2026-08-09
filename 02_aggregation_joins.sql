-- Query 1: INNER JOIN + GROUP BY + HAVING

SELECT
    r.cuisine,
    COUNT(*) AS total_orders,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS average_revenue
FROM orders o
INNER JOIN restaurants r
ON o.restaurant_id = r.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.cuisine
HAVING total_revenue > 40000;


-- Query 2: LEFT JOIN

SELECT
    r.name,
    COUNT(o.order_id) AS total_orders
FROM restaurants r
LEFT JOIN orders o
ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.name
ORDER BY total_orders ASC;