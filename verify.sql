SELECT COUNT(*) FROM restaurants;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM cuisine_targets;
SELECT status, COUNT(*)
FROM orders
GROUP BY status;