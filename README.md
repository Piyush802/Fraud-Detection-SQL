# Fraud Detection Analysis using SQL

## 1 . Problem Statement
Fraud detection is a critical problem in the financial industry, where identifying fraudulent transactions accurately is essential to prevent financial losses. This dataset presents a challenging scenario due to extreme class imbalance, where fraudulent transactions make up less than 1% of total data. Additionally, overlapping transaction patterns between fraudulent and normal transactions make detection difficult.
  
## 2. Dataset
Source (Kaggle)
Columns: Time, Amount, Class

## 4. Approach
- Data cleaning
- SQL analysis
- Window functions
- Fraud scoring
  
## 5. Key Insights
Example:
- Fraud transactions are rare (<1%)
- Fraud amounts are generally higher
- High-risk transactions identified using scoring

## 6. SQL Concepts Used
- Aggregations
- CASE WHEN
- Window functions (LAG, AVG OVER)
- CTE

## 7. Results
- Fraud %
- High-risk detection
