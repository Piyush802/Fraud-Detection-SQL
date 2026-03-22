CREATE DATABASE fraud_detection_analysis;
USE fraud_detection_analysis;

SELECT * FROM creditcard;

EXEC sp_rename 'creditcard.["Time"]', 'Time', 'COLUMN';
EXEC sp_rename 'creditcard.["V1"]', 'V1', 'COLUMN';
EXEC sp_rename 'creditcard.["V2"]', 'V2', 'COLUMN';
EXEC sp_rename 'creditcard.["V3"]', 'V3', 'COLUMN';
EXEC sp_rename 'creditcard.["V4"]', 'V4', 'COLUMN';
EXEC sp_rename 'creditcard.["V5"]', 'V5', 'COLUMN';
EXEC sp_rename 'creditcard.["V6"]', 'V6', 'COLUMN';
EXEC sp_rename 'creditcard.["V7"]', 'V7', 'COLUMN';
EXEC sp_rename 'creditcard.["V8"]', 'V8', 'COLUMN';
EXEC sp_rename 'creditcard.["V9"]', 'V9', 'COLUMN';
EXEC sp_rename 'creditcard.["V10"]', 'V10', 'COLUMN';
EXEC sp_rename 'creditcard.["V11"]', 'V11', 'COLUMN';
EXEC sp_rename 'creditcard.["V12"]', 'V12', 'COLUMN';
EXEC sp_rename 'creditcard.["V13"]', 'V13', 'COLUMN';
EXEC sp_rename 'creditcard.["V14"]', 'V14', 'COLUMN';
EXEC sp_rename 'creditcard.["V15"]', 'V15', 'COLUMN';
EXEC sp_rename 'creditcard.["V16"]', 'V16', 'COLUMN';
EXEC sp_rename 'creditcard.["V17"]', 'V17', 'COLUMN';
EXEC sp_rename 'creditcard.["V18"]', 'V18', 'COLUMN';
EXEC sp_rename 'creditcard.["V19"]', 'V19', 'COLUMN';
EXEC sp_rename 'creditcard.["V20"]', 'V20', 'COLUMN';
EXEC sp_rename 'creditcard.["V21"]', 'V21', 'COLUMN';
EXEC sp_rename 'creditcard.["V22"]', 'V22', 'COLUMN';
EXEC sp_rename 'creditcard.["V23"]', 'V23', 'COLUMN';
EXEC sp_rename 'creditcard.["V24"]', 'V24', 'COLUMN';
EXEC sp_rename 'creditcard.["V25"]', 'V25', 'COLUMN';
EXEC sp_rename 'creditcard.["V26"]', 'V26', 'COLUMN';
EXEC sp_rename 'creditcard.["V27"]', 'V27', 'COLUMN';
EXEC sp_rename 'creditcard.["V28"]', 'V28', 'COLUMN';
EXEC sp_rename 'creditcard.["Class"]', 'Class', 'COLUMN';
EXEC sp_rename 'creditcard.["Amount"]', 'Amount', 'COLUMN';

-- Checking the column names
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'creditcard';

SELECT * FROM creditcard;

                
				---- DATA CLEANING/UPDATING ----

-- Delete the rows which contains "Class" in Class column
DELETE FROM creditcard 
WHERE Class LIKE '%Class%';                   

-- Replace the values - "0" and "1" to 0 and 1 from Class column
UPDATE creditcard
SET Class = REPLACE(Class,'"', '')
WHERE Class LIKE '%"%';

-- For checking the type of values in Class column
SELECT DISTINCT Class
FROM creditcard;
					  
-- For checking the lenth of values in Class column
SELECT Class, LEN(Class) AS length
FROM creditcard
GROUP BY Class;
					
-- Convert to INT Datatype
ALTER TABLE creditcard ALTER COLUMN Time FLOAT
ALTER TABLE creditcard ALTER COLUMN V1 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V2 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V3 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V4 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V5 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V6 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V7 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V8 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V9 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V10 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V11 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V12 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V13 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V14 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V15 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V16 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V17 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V18 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V19 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V20 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V21 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V22 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V23 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V24 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V25 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V26 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V27 FLOAT;
ALTER TABLE creditcard ALTER COLUMN V28 FLOAT;
ALTER TABLE creditcard ALTER COLUMN Amount FLOAT;
ALTER TABLE creditcard ALTER COLUMN Class INT;
	
-- How to check Datatype of columns
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'creditcard';