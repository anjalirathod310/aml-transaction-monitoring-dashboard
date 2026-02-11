SELECT
    c.account_id,
    c.customer_name,
    c.risk_rating,
    COUNT(*) AS spike_txn_count,
    MAX(f.tx_ts) AS last_spike_txn,
    c.avg_risk_score,
    c.max_risk_score,
    c.occupation,
    c.customer_type
FROM fact_transactions f
JOIN dim_customer c
  ON f.sender_account = c.account_id
WHERE f.spike_flag = 1
GROUP BY
    c.account_id,
    c.customer_name,
    c.risk_rating,
    c.avg_risk_score,
    c.max_risk_score,
    c.occupation,
    c.customer_type
ORDER BY
    spike_txn_count DESC,
    last_spike_txn DESC;
