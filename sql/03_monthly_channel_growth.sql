-- ANALYSIS 3

-- Analyzing YoY growth revenue per month in 2024 vs. 2023 in the same month based on channel

-- 1.Calculating the total orders (distinct) and revenue (after_discount) per month for 2023 and 2024
-- The first CTE to display data for 2024
WITH 
  orders_2024 AS (  
    SELECT
      order_id,
      channel_type,
      after_discount,
      EXTRACT(MONTH FROM order_date) AS month
    FROM 
      `FinalProject.order_detail`
    WHERE 
      EXTRACT(YEAR FROM order_date) = 2024 AND is_valid = 1
  ),
  -- The second CTE to display data for 2023
  orders_2023 AS (  
    SELECT
      order_id,
      channel_type,
      after_discount,
      EXTRACT(MONTH FROM order_date) AS month
    FROM
      `FinalProject.order_detail`
    WHERE 
      EXTRACT(YEAR FROM order_date) = 2023 AND is_valid = 1
  ),
  -- The third CTE displays the total orders and total revenue for 2024
  agg_2024 AS (  
    SELECT
      month,
      channel_type,
      COUNT(DISTINCT order_id) AS total_orders,
      SUM(after_discount) AS revenue_2024
    FROM 
      orders_2024
    GROUP BY 
      month, channel_type
  ),
  -- The fourth CTE displays the total orders and total revenue for 2023
  agg_2023 AS (  
    SELECT
      month,
      channel_type,
      SUM(after_discount) AS revenue_2023
    FROM 
      orders_2023
    GROUP BY 
      month, channel_type
  )
  
-- 2. Calculating YoY revenue growth per month in 2024 vs. 2023 in the same month
SELECT 
  FORMAT_DATE('%B', DATE(2024, a24.month, 1)) AS period,  
  a24.channel_type AS channel,
  a24.total_orders,
-- Displaying total revenue for 2024 with a decimal format of 2 digits after the decimal point
  ROUND(a24.revenue_2024, 2) AS revenue_2024,  
-- Displaying total revenue for 2023 with a decimal format of 2 digits after the decimal point
  ROUND(COALESCE(a23.revenue_2023, 0), 2) AS revenue_2023,  
-- Calculating Year-over-Year using the formula ((2024 revenue - 2023 revenue) / 2023 revenue) * 100 to get the result in percentage
  CONCAT(ROUND(SAFE_DIVIDE(a24.revenue_2024 - COALESCE(a23.revenue_2023, 0), NULLIF(a23.revenue_2023, 0)) * 100, 2), '%') AS yoy_growth,  
-- Displaying status if it meets one of the 4 conditions based on YoY percentage
  CASE
    WHEN a23.revenue_2023 IS NULL OR a23.revenue_2023 = 0 THEN 'New Channel'
    WHEN SAFE_DIVIDE(a24.revenue_2024 - a23.revenue_2023, a23.revenue_2023) > 0.1 THEN 'Strong Growth'
    WHEN SAFE_DIVIDE(a24.revenue_2024 - a23.revenue_2023, a23.revenue_2023) > 0 THEN 'Growth'
    ELSE 'Decline' 
  END AS status
FROM 
  agg_2024 AS a24
-- Combining 2 CTEs while retaining all data in the `agg_2024` CTE, combined based on the same month and the same channel type
LEFT JOIN 
  agg_2023 AS a23  
ON 
  a24.month = a23.month  
  AND a24.channel_type = a23.channel_type  
ORDER BY 
  a24.month, a24.revenue_2024 DESC;
