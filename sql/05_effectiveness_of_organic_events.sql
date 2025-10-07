-- Efektifitas jalur organic

WITH organic AS (  -- CTE untuk menampilkan data dari tabel `funnel_detail`
  SELECT
    channel_source,
    order_id
  FROM `FinalProject.funnel_detail`
  WHERE 
    event = 'Organic'  -- Memfilter kolom `event` hanya menampilkan data `Organic`
    AND DATE(funnel_date) BETWEEN '2024-01-01' AND '2024-12-31'  -- Memfilter kolom `funnel_date` untuk menampilkan data selama tahun 2024
)
SELECT  
  channel_source,
  COUNT(*) AS total_events,  -- Menampilkan banyaknya data(baris) dalam CTE yang telah dibuat
  COUNT(DISTINCT NULLIF(order_id, '')) AS total_converted_orders,  -- Menampilkan banyaknya data berdasarkan `order_id`
  -- Menampilkan persentase dengan rumus ((banyaknya data `order_id`/ banyaknya data(baris) dalam CTE) * 100)
  CONCAT((SAFE_DIVIDE(COUNT(DISTINCT NULLIF(order_id, '')), COUNT(*)) * 100), '%') AS conversion_rate
FROM organic -- Mengambil data dari CTE yang telah dibuat
GROUP BY channel_source  -- Mengelompokkan hasil berdasarkan `channel_source`
ORDER BY total_events DESC; -- Mengurutkan hasil berdasarkan `total_events` dari yang terbesar
