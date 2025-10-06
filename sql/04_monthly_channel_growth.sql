-- Pertumbuhan channel bulanan.
-- 1. Total orders (distinct) dan revenue (after_discount) per bulan.
-- 2. Hitung MoM growth revenue per bulan vs 2023 dalam bulan yang sama

WITH 
  orders_2024 AS (  -- CTE pertama untuk menampilkan data tahun 2024
    SELECT
      order_id,
      channel_type,
      after_discount,
      EXTRACT(MONTH FROM order_date) AS month
    FROM `FinalProject.order_detail`
    WHERE EXTRACT(YEAR FROM order_date) = 2024 AND is_valid = 1
  ),
  orders_2023 AS (  -- CTE kedua untuk menampilkan data tahun 2023
    SELECT
      order_id,
      channel_type,
      after_discount,
      EXTRACT(MONTH FROM order_date) AS month
    FROM `FinalProject.order_detail`
    WHERE EXTRACT(YEAR FROM order_date) = 2023 AND is_valid = 1
  ),
  agg_2024 AS (  -- CTE ketiga untuk menampilkan total order dan total pendapatan tahun 2024
    SELECT
      month,
      channel_type,
      COUNT(DISTINCT order_id) AS total_orders,
      SUM(after_discount) AS revenue_2024
    FROM orders_2024
    GROUP BY month, channel_type
  ),
  agg_2023 AS (  -- CTE keempat untuk menampilkan total order dan total pendapatan tahun 2023
    SELECT
      month,
      channel_type,
      SUM(after_discount) AS revenue_2023
    FROM orders_2023
    GROUP BY month, channel_type
  )
SELECT 
  FORMAT_DATE('%B', DATE(2024, a24.month, 1)) AS period,
  a24.channel_type AS channel,
  a24.total_orders,
  ROUND(a24.revenue_2024, 2) AS revenue_2024,
  ROUND(COALESCE(a23.revenue_2023, 0), 2) AS revenue_2023,
  CONCAT(ROUND(SAFE_DIVIDE(a24.revenue_2024 - COALESCE(a23.revenue_2023, 0), NULLIF(a23.revenue_2023, 0)) * 100, 2), '%') AS yoy_growth,
  CASE
    WHEN a23.revenue_2023 IS NULL OR a23.revenue_2023 = 0 THEN 'New Channel'
    WHEN SAFE_DIVIDE(a24.revenue_2024 - a23.revenue_2023, a23.revenue_2023) > 0.1 THEN 'Strong Growth'
    WHEN SAFE_DIVIDE(a24.revenue_2024 - a23.revenue_2023, a23.revenue_2023) > 0 THEN 'Growth'
    ELSE 'Decline'
  END AS status
FROM agg_2024 AS a24
JOIN agg_2023 AS a23
ON 
  a24.month = a23.month 
  AND a24.channel_type = a23.channel_type
ORDER BY a24.month, a24.revenue_2024 DESC;
