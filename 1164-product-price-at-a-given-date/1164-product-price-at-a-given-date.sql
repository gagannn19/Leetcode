SELECT
    p.product_id,
    COALESCE(d.new_price, 10) AS price
FROM (
    SELECT DISTINCT product_id
    FROM Products
) AS p
LEFT JOIN (
    SELECT product_id, new_price
    FROM Products
    WHERE (product_id, change_date) IN (
        SELECT product_id, MAX(change_date)
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    )
) AS d
ON p.product_id = d.product_id;
