-- 1. WHERE
SELECT *
FROM restaurants
WHERE city = 'Mumbai';

-- 2. DISTINCT
SELECT DISTINCT cuisine
FROM restaurants;

-- 3. ORDER BY + LIMIT
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;

-- 4. LIKE
SELECT *
FROM restaurants
WHERE name LIKE '%House%';

-- 5. IN
SELECT *
FROM customers
WHERE city IN ('Mumbai','Delhi');

-- 6. BETWEEN
SELECT *
FROM orders
WHERE amount_inr BETWEEN 500 AND 1500;

-- 7. NOT BETWEEN
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 500 AND 1500;

-- 8. IS NULL
SELECT *
FROM orders
WHERE rating IS NULL;