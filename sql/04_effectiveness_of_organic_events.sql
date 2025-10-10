-- ANALYSIS 4

-- Analyzing the effectiveness of organic channels

-- Create a CTE to display data from the `funnel_detail` table
WITH organic AS (  
  SELECT
    channel_source,
    order_id
  FROM 
    `FinalProject.funnel_detail`
  WHERE 
    event = 'Organic'  
    AND DATE(funnel_date) BETWEEN '2024-01-01' AND '2024-12-31' 
)
SELECT  
  channel_source,
  COUNT(*) AS total_events,  
  COUNT(DISTINCT NULLIF(order_id, '')) AS total_converted_orders,  
-- Displaying the percentage using the formula ((number of `order_id` data / number of data (rows) in CTE) * 100)
  CONCAT((SAFE_DIVIDE(COUNT(DISTINCT NULLIF(order_id, '')), COUNT(*)) * 100), '%') AS conversion_rate
FROM 
  organic 
GROUP BY 
  channel_source  
ORDER BY 
  total_events DESC; 
