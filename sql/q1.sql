use aml_project;
SELECT
    account_id,
    customer_name,
    risk_rating,
    max_risk_score,
    flagged_txn_count,
    total_txn_count,
    occupation,
    customer_type
FROM dim_customer
WHERE risk_rating = 'High'
ORDER BY
    max_risk_score DESC,
    flagged_txn_count DESC;
