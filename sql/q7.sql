SELECT
    c.account_id,
    c.customer_name,
    c.risk_rating,
    SUM(CASE WHEN f.fanout_flag = 1 THEN 1 ELSE 0 END) AS fanout_txn_count,
    SUM(CASE WHEN f.fanin_flag = 1 THEN 1 ELSE 0 END) AS fanin_txn_count,
    MAX(f.tx_ts) AS last_network_activity,
    c.max_risk_score,
    c.avg_risk_score,
    c.occupation,
    c.customer_type
FROM fact_transactions f
JOIN dim_customer c
  ON f.sender_account = c.account_id
WHERE f.fanout_flag = 1
   OR f.fanin_flag = 1
GROUP BY
    c.account_id,
    c.customer_name,
    c.risk_rating,
    c.max_risk_score,
    c.avg_risk_score,
    c.occupation,
    c.customer_type
ORDER BY
    (fanout_txn_count + fanin_txn_count) DESC,
    last_network_activity DESC;
