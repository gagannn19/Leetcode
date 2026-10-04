SELECT ROUND( (SUM(order_date = customer_pref_delivery_date) / COUNT(*)) *100, 2) AS immediate_percentage
FROM Delivery
JOIN (
SELECT customer_id, MIN(order_date) AS first_order_date
FROM Delivery
GROUP BY customer_id
) AS first_orders
ON Delivery.customer_id = first_orders.customer_id
AND Delivery.order_date = first_orders.first_order_date
