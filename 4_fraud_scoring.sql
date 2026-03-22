
                 ------ FRAUD SCORING ------

SELECT 
    Time,
    Amount,

    (
        CASE WHEN Amount > 2000 THEN 2 ELSE 0 END +
        CASE WHEN Amount > 3 * AVG(Amount) OVER() THEN 2 ELSE 0 END +
        CASE 
            WHEN Amount > LAG(Amount) OVER (ORDER BY Time) * 2 THEN 1 
            ELSE 0 
        END
    ) AS fraud_score,

    CASE 
        WHEN (
            CASE WHEN Amount > 2000 THEN 2 ELSE 0 END +
            CASE WHEN Amount > 3 * AVG(Amount) OVER() THEN 2 ELSE 0 END +
            CASE WHEN Amount > LAG(Amount) OVER (ORDER BY Time) * 2 THEN 1 ELSE 0 END
        ) >= 4 THEN 'High Risk'
        
        WHEN (
            CASE WHEN Amount > 2000 THEN 2 ELSE 0 END +
            CASE WHEN Amount > 3 * AVG(Amount) OVER() THEN 2 ELSE 0 END +
            CASE WHEN Amount > LAG(Amount) OVER (ORDER BY Time) * 2 THEN 1 ELSE 0 END
        ) >= 2 THEN 'Medium Risk'
        
        ELSE 'Low Risk'
    END AS risk_level

FROM creditcard;