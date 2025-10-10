-- ANALYSIS 1

-- Analyzing total monthly revenue in 2024

SELECT
  EXTRACT(MONTH FROM transaction_date) AS month, 
  SUM(total_paid) AS total_revenue  
FROM 
  `FinalProject.transaction_detail` 
WHERE 
  EXTRACT(YEAR FROM transaction_date) = 2024  
GROUP BY
  month  
ORDER BY 
  month ASC;  
