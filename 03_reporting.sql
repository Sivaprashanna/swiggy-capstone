-- =========================================
-- Query 1: CASE WHEN Revenue Tier
-- =========================================

SELECT
    r.name,
    SUM(o.amount_inr) AS total_revenue,
    CASE
        WHEN SUM(o.amount_inr) >= 50000 THEN 'High'
        WHEN SUM(o.amount_inr) >= 20000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id
WHERE o.status = 'Delivered'
GROUP BY r.restaurant_id, r.name;

-- Query 2: Monthly Business Report
SELECT		
r.cuisine,		
FORMAT(o.order_date, 'yyyy-MM') AS month,
COUNT(o.order_id) AS order_count,
SUM(o.amount_inr) AS total_revenue,		
AVG(o.amount_inr) AS avg_revenue		
FROM orders o		
JOIN restaurants r		
ON o.restaurant_id = r.restaurant_id		
WHERE o.status = 'Delivered'		
GROUP BY		
r.cuisine,		
FORMAT(o.order_date, 'yyyy-MM')		
ORDER BY		
r.cuisine,		
month;		
-- Query 3: Revenue vs Target

SELECT	
    ct.cuisine,
    ct.target_revenue_inr,
    SUM(o.amount_inr) AS total_revenue,
    ct.target_revenue_inr - SUM(o.amount_inr) AS variance,
    ((SUM(o.amount_inr) - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr AS percentage_variance,

    CASE
        WHEN SUM(o.amount_inr) >= ct.target_revenue_inr
            THEN 'Above Target'
        WHEN ((ct.target_revenue_inr - SUM(o.amount_inr)) * 100.0) / ct.target_revenue_inr <= 15
            THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS status

FROM cuisine_targets ct
JOIN restaurants r
ON ct.cuisine = r.cuisine
JOIN orders o
ON r.restaurant_id = o.restaurant_id

WHERE o.status = 'Delivered'

GROUP BY
    ct.cuisine,
    ct.target_revenue_inr

ORDER BY
    total_revenue DESC;

