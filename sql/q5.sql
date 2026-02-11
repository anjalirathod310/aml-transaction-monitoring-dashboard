SELECT
    c.account_id,
    c.customer_name,
    c.risk_rating,
    COUNT(*) AS structuring_txn_count,
    MAX(f.tx_ts) AS last_structuring_txn,
    c.flagged_txn_count,
    c.max_risk_score,
    c.occupation,
    c.customer_type
FROM fact_transactions f
JOIN dim_customer c
  ON f.sender_account = c.account_id
WHERE f.structuring_flag = 1
GROUP BY
    c.account_id,
    c.customer_name,
    c.risk_rating,
    c.flagged_txn_count,
    c.max_risk_score,
    c.occupation,
    c.customer_type
ORDER BY
    structuring_txn_count DESC;
