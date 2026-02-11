SELECT
    c.account_id,
    c.customer_name,
    c.risk_rating,
    c.max_risk_score,
    c.flagged_txn_count,
    MAX(f.tx_ts) AS last_flagged_activity,
    c.occupation,
    c.customer_type
FROM dim_customer c
JOIN fact_transactions f
  ON f.sender_account = c.account_id
WHERE f.risk_score_txn > 0
GROUP BY
    c.account_id,
    c.customer_name,
    c.risk_rating,
    c.max_risk_score,
    c.flagged_txn_count,
    c.occupation,
    c.customer_type
ORDER BY
    CASE c.risk_rating
        WHEN 'High' THEN 1
        WHEN 'Medium' THEN 2
        ELSE 3
    END,
    c.max_risk_score DESC,
    c.flagged_txn_count DESC,
    last_flagged_activity DESC;
