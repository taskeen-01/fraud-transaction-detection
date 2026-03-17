# 1. Fraud vs Non-Fraud Distribution. How many transactions are fraud (1) vs normal (0)
SELECT Is_Fraud, 
       COUNT(*) AS total_transactions
FROM transactions
GROUP BY Is_Fraud;

# 2. Shows what % of transactions are fraudulent.
SELECT SUM(Is_Fraud) * 100.0 / COUNT(*) AS fraud_percentage
FROM transactions;

# 3. Identifies high-risk locations.
SELECT Location, 
       COUNT(*) AS fraud_cases
FROM transactions
WHERE Is_Fraud = 1
GROUP BY Location
ORDER BY fraud_cases DESC;

# 4. Shows which payment method is most used in fraud
SELECT Payment_Method,
	   COUNT(*) AS fraud_cases
FROM transactions
WHERE Is_Fraud = 1
GROUP BY Payment_Method
ORDER BY fraud_cases DESC;

# 5. Find whether fraud is higher on
SELECT 
Device_Type,
COUNT(*) AS fraud_cases
FROM transactions
WHERE Is_Fraud = 1
GROUP BY Device_Type;

# 6. Show which business category is risky
SELECT Merchant_Category,
       COUNT(*) AS fraud_cases
FROM transactions
WHERE Is_Fraud = 1
GROUP BY Merchant_Category
ORDER BY fraud_cases DESC;

# 7. Fraud by Transaction Hour
SELECT Transaction_Hour,
       COUNT(*) AS fraud_cases
FROM transactions
WHERE Is_Fraud = 1
GROUP BY Transaction_Hour
ORDER BY fraud_cases DESC;

# 8. Shows whether fraud transactions tend to have higher or lower amounts compared to normal transactions.
SELECT Is_Fraud,
       AVG(Transaction_Amount) AS avg_amount
FROM transactions
GROUP BY Is_Fraud;

# 9. Show top customers based on spending.
SELECT Customer_ID,
       SUM(Transaction_Amount) AS total_spent
FROM transactions
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 10;

# 10. Fraud Count by Device and Payment Method
SELECT Device_Type,
       Payment_Method,
       COUNT(*) AS fraud_cases
FROM transactions
WHERE Is_Fraud = 1
GROUP BY Device_Type, Payment_Method
ORDER BY fraud_cases DESC;
