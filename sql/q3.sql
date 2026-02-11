SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN risk_score_txn > 0 THEN 1 ELSE 0 END) AS flagged_transactions,
    ROUND(
        SUM(CASE WHEN risk_score_txn > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS alert_rate_percentage
FROM fact_transactions;
