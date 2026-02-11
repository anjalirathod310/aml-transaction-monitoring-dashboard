SELECT
    customer_type,
    occupation,
    risk_rating,
    COUNT(*) AS customer_count
FROM dim_customer
GROUP BY
    customer_type,
    occupation,
    risk_rating
ORDER BY
    customer_type,
    occupation,
    customer_count DESC;
