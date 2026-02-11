SELECT
    account_id,
    customer_name,
    risk_rating,
    flagged_txn_count,
    total_txn_count,
    ROUND(
        flagged_txn_count * 100.0 / total_txn_count,
        2
    ) AS flagged_txn_percentage,
    avg_risk_score,
    occupation,
    customer_type
FROM dim_customer
WHERE flagged_txn_count >= 5
ORDER BY
    flagged_txn_count DESC,
    avg_risk_score DESC;
