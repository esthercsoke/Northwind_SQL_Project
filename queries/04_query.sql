-------------------------------
-- 4
-------------------------------
WITH cte_mas AS (
SELECT year_month, count(*) total_number_orders, ROUND(SUM(freight))::INT AS total_freight 
FROM   (
   SELECT   date_trunc('month',order_date)::date as year_month, freight
   FROM orders) a
WHERE date_part('year', a.year_month) >= 1996 AND date_part('year', a.year_month) <= 1997
GROUP BY year_month)
SELECT *
FROM cte_mas
WHERE total_number_orders > 20 AND total_freight > 2500
ORDER BY total_freight DESC;