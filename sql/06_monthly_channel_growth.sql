-- ANALISIS 3

-- Menganalisis YoY Growth Revenue per bulan 2024 vs 2023 dalam bulan yang sama berdasarkan channel

-- 1. Menghitung total pesanan (distinct) dan pendapatan (after_discount) per bulan tahun 2023 dan 2024
-- CTE pertama untuk menampilkan data tahun 2024
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
  -- CTE kedua untuk menampilkan data tahun 2023
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
  -- CTE ketiga untuk menampilkan total pesanan dan total pendapatan tahun 2024
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
  -- CTE keempat untuk menampilkan total pesanan dan total pendapatan tahun 2023
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
  
-- 2. Menghitung YoY growth revenue per bulan 2024 vs 2023 dalam bulan yang sama
SELECT 
  FORMAT_DATE('%B', DATE(2024, a24.month, 1)) AS period,  
  a24.channel_type AS channel,
  a24.total_orders,
-- Menampilkan total pendapatan tahun 2024 dengan format desimal 2 angka dibelakang koma
  ROUND(a24.revenue_2024, 2) AS revenue_2024,  
-- Menampilkan total pendapatan tahun 2023 dengan format desimal 2 angka dibelakang koma
  ROUND(COALESCE(a23.revenue_2023, 0), 2) AS revenue_2023,  
-- Menghitung Year-over-Year dengan rumus ((pendapatan 2024-pendapatan 2023) / pendapatan 2023) * 100 untuk mendapatkan hasil dalam persentase
  CONCAT(ROUND(SAFE_DIVIDE(a24.revenue_2024 - COALESCE(a23.revenue_2023, 0), NULLIF(a23.revenue_2023, 0)) * 100, 2), '%') AS yoy_growth,  
-- Menampilkan status jika memenuhi salah satu dari 4 kondisi berdasarkan persentase YoY
  CASE
    WHEN a23.revenue_2023 IS NULL OR a23.revenue_2023 = 0 THEN 'New Channel'
    WHEN SAFE_DIVIDE(a24.revenue_2024 - a23.revenue_2023, a23.revenue_2023) > 0.1 THEN 'Strong Growth'
    WHEN SAFE_DIVIDE(a24.revenue_2024 - a23.revenue_2023, a23.revenue_2023) > 0 THEN 'Growth'
    ELSE 'Decline' 
  END AS status
FROM 
  agg_2024 AS a24
-- Menggabungkan 2 CTE dengan mempertahankan semua data di CTE `agg_2024`, digabung berdasarkan bulan yang sama dan jenis saluran yang sama
LEFT JOIN 
  agg_2023 AS a23  
ON 
  a24.month = a23.month  
  AND a24.channel_type = a23.channel_type  
ORDER BY 
  a24.month, a24.revenue_2024 DESC;
