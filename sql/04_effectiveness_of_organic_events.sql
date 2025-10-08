-- ANALISIS 4

-- Menganalisis tingkat efektifitas jalur organic

-- Membuat CTE untuk menampilkan data dari tabel `funnel_detail`
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
-- Menampilkan persentase dengan rumus ((banyaknya data `order_id`/ banyaknya data(baris) dalam CTE) * 100)
  CONCAT((SAFE_DIVIDE(COUNT(DISTINCT NULLIF(order_id, '')), COUNT(*)) * 100), '%') AS conversion_rate
FROM 
  organic 
GROUP BY 
  channel_source  
ORDER BY 
  total_events DESC; 
