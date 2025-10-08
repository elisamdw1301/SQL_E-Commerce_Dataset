-- ANALISIS 5

-- Mengetahui optimasi customer onboarding

-- 1. Membuat CTE untuk menampilkan data pelanggan baru
WITH first_order AS (  
    SELECT
      customer_id,
      MIN(order_date) AS first_order_date  
    FROM 
        `FinalProject.order_detail`
    GROUP BY 
        customer_id 
)
    
-- 2. Menghitung rata-rata waktu
SELECT
    EXTRACT(MONTH FROM cd.registration_date) AS month,  
    cd.registration_channel,
    COUNT(DISTINCT cd.customer_id) AS customer_new,  
-- Menghitung rata-rata waktu dari selisih hari pada tanggal pesanan yang paling awal dan tanggal registrasi
    AVG(DATE_DIFF(DATE(fo.first_order_date), DATE(cd.registration_date), DAY)) AS avg_registration_to_first_order
FROM 
    `FinalProject.customer_detail_cleaned` AS cd
-- Menggabungkan CTE dengan tabel `customer_detail_cleaned` berdasarkan `customer_id` yang sama
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
