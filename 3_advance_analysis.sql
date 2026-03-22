						
						---- ADVANCE ANALYSIS ----

-- Count transactions based on amount ranges
SELECT 
     CASE WHEN Amount < 50 THEN '< 50'
     WHEN Amount BETWEEN 50 AND 200 THEN '50 - 200'
	 ELSE '>= 200'
	 END AS 'amount_range',
	 COUNT(*) AS transactions
FROM creditcard
GROUP BY 
     CASE WHEN Amount < 50 THEN '< 50'
     WHEN Amount BETWEEN 50 AND 200 THEN '50 - 200'
	 ELSE '>= 200'
	 END
ORDER BY amount_range;

-- Transactions where Amount is much higher than average
SELECT *, CAST(Amount - avg_amount AS DECIMAL(10,2)) AS diff_from_avg
FROM (SELECT *, AVG(Amount) OVER() AS avg_amount
FROM creditcard) t
WHERE Amount > avg_amount;

-- Compare each transaction with previous one
SELECT *, LAG(Amount) OVER (ORDER BY Time) AS previous_amount,
          Amount - LAG(Amount) OVER (ORDER BY Time) AS difference
FROM creditcard;

-- Rank transactions by highest amount
SELECT *, DENSE_RANK() OVER (ORDER BY Amount DESC) AS transactions_acc_to_amount
FROM creditcard;
