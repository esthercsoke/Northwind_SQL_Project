-------------------------------
-- 2
-------------------------------
WITH cte_mas AS 
(
   SELECT
      COUNT(DISTINCT order_id) AS total_volume_orders,
      ship_country,
      round(AVG(shipped_date - order_date), 2) AS average_days_between_order_shipping 
   from
      orders 
   WHERE
      date_part('year', order_date) = 1997 
   GROUP BY
      ship_country
)
SELECT
   ship_country,
   average_days_between_order_shipping,
   total_volume_orders 
FROM
   cte_mas 
WHERE
   average_days_between_order_shipping >= 3 
   AND average_days_between_order_shipping < 20 
   AND total_volume_orders > 5;