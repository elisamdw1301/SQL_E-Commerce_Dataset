-- ANALYSIS 5

-- Analyzing customer onboarding optimization

-- 1. Create a CTE to display new customer data
WITH first_order AS (  
    SELECT
      customer_id,
      MIN(order_date) AS first_order_date  
    FROM 
        `FinalProject.order_detail`
    GROUP BY 
        customer_id 
)    
    
-- 2. Calculating the average time
SELECT
    EXTRACT(MONTH FROM cd.registration_date) AS month,  
    cd.registration_channel,
    COUNT(DISTINCT cd.customer_id) AS customer_new,  
-- Calculating the average time from the difference between the earliest order date and the registration date
    AVG(DATE_DIFF(DATE(fo.first_order_date), DATE(cd.registration_date), DAY)) AS avg_registration_to_first_order
FROM 
    `FinalProject.customer_detail_cleaned` AS cd
-- Combining the CTE table with the `customer_detail_cleaned` table based on the same `customer_id` column
JOIN 
    first_order AS fo  
ON 
    cd.customer_id = fo.customer_id  
WHERE 
  EXTRACT(YEAR FROM cd.registration_date) = 2024  
  AND fo.first_order_date IS NOT NULL  
GROUP BY 
    month, cd.registration_channel 
ORDER BY 
    month, cd.registration_channel ASC;  
