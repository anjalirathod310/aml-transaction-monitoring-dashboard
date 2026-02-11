SELECT
    'Velocity' AS rule_name,
    COUNT(*) AS flagged_txns
FROM fact_transactions
WHERE velocity_flag = 1

UNION ALL

SELECT
    'Structuring' AS rule_name,
    COUNT(*) AS flagged_txns
FROM fact_transactions
WHERE structuring_flag = 1

UNION ALL

SELECT
    'Spike' AS rule_name,
    COUNT(*) AS flagged_txns
FROM fact_transactions
WHERE spike_flag = 1

UNION ALL

SELECT
    'Fan-Out' AS rule_name,
    COUNT(*) AS flagged_txns
FROM fact_transactions
WHERE fanout_flag = 1

UNION ALL

SELECT
    'Fan-In' AS rule_name,
    COUNT(*) AS flagged_txns
FROM fact_transactions
WHERE fanin_flag = 1

ORDER BY flagged_txns DESC;
