SELECT
    stockcode,
    description,
    ROUND(SUM(revenue), 2) AS product_revenue
FROM retail_sales
GROUP BY stockcode, description
ORDER BY product_revenue DESC
LIMIT 10;
