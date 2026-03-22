					  					  
					 ---- BASIC COUNTS ----
          
-- 1. Total number of transactions
SELECT COUNT(*) AS total_no_of_transactions FROM creditcard;

-- 2. Total fraud transactions
SELECT COUNT(*) AS total_fraud_transactions
FROM creditcard
WHERE Class = '1';

-- 3. Total normal transactions
SELECT COUNT(*) AS total_normal_transactions
FROM creditcard WHERE Class = '0';


					   
					   ----- FRAUD PERCENTAGE ----

SELECT
      COUNT(*) AS total_num_of_transactions,
      SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) AS fraud_transactions,
	  CAST(SUM(CASE WHEN Class = 1 THEN 1 ELSE 0 END) * 100.0/
	  COUNT(*) AS DECIMAL(10,2)) AS fraud_percentage
FROM creditcard;


					  ----- FRAUD PATTERN ANALYSIS ----

-- Average Fraud Transactions
SELECT ROUND(AVG(Amount),2) AS avg_fraud_transactions_amount
FROM creditcard 
WHERE Class = 1;

-- Average Normal Transactions
SELECT ROUND(AVG(Amount),2) AS avg_normal_transactions_amount
FROM creditcard 
WHERE Class = 0;

-- Max Fraud Amount
SELECT MAX(Amount) AS max_fraud_amount
FROM creditcard
WHERE Class = 1;

-- Top 10 Suspicious transactions
SELECT TOP 10* FROM creditcard
ORDER BY Amount DESC;