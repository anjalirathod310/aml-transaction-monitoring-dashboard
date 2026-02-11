SELECT
    COUNT(*) AS total_laundering_txns,
    SUM(CASE WHEN risk_score_txn > 0 THEN 1 ELSE 0 END) AS flagged_laundering_txns,
    ROUND(
        SUM(CASE WHEN risk_score_txn > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS laundering_detection_rate_percentage
FROM fact_transactions
WHERE is_laundering = 1;
