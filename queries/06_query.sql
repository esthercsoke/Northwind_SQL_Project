-------------------------------
-- 6
-------------------------------
--- to do - remove null columns
WITH cte_mas AS (select 
t1.category_name, t2.unit_price, t3.discount,  t3.order_id,
CASE
		WHEN t3.unit_price < 10 THEN '1. Below $10'
		WHEN t3.unit_price >= 10 AND t2.unit_price <= 20 then '2. $10 - $20'
		WHEN t3.unit_price > 20 AND t2.unit_price <= 50 then '3. $20 - $50'
		WHEN t3.unit_price > 50 THEN '4. Over $50'
		end as price_range
from categories as t1
inner join products as t2
on t2.category_id = t1.category_id
inner join order_details as t3
on t2.product_id = t3.product_id)
SELECT category_name, price_range, 
	ROUND(CAST(sum(unit_price - discount) AS numeric),2) AS total_amount,
	count(distinct order_id) as total_number_orders
FROM cte_mas
GROUP BY category_name, price_range;
