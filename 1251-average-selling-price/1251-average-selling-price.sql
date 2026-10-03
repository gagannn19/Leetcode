SELECT Prices.product_id, COALESCE(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price
FROM Prices
LEFT JOIN UnitsSold
ON Prices.product_id = UnitsSold.product_id
AND start_date <= purchase_date 
AND purchase_date <= end_date
GROUP BY Prices.product_id

