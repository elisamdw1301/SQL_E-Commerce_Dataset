-- Mengetahui optimasi customer onboarding.

WITH first_order AS (  -- Membuat CTE untuk menampilkan data pelanggan baru
    SELECT
      customer_id,
      MIN(order_date) AS first_order_date  -- Menampilkan data tanggal pesanan yang paling awal
    FROM `FinalProject.order_detail`
    GROUP BY customer_id  -- Mengelompokkan hasil berdasarkan `customer_id`
)
SELECT
    EXTRACT(MONTH FROM cd.registration_date) AS month,  -- Memilih bulan dari tanggal registrasi
    cd.registration_channel,
    COUNT(DISTINCT cd.customer_id) AS customer_new,  -- Menghitung banyaknya id customer
    -- Menghitung rata-rata waktu dari selisih hari pada tanggal pesanan yang paling awal dan tanggal registrasi
    AVG(DATE_DIFF(DATE(fo.first_order_date), DATE(cd.registration_date), DAY)) AS avg_registration_to_first_order
FROM `FinalProject.customer_detail_cleaned` AS cd
JOIN first_order AS fo  -- Menggabungkan CTE dengan tabel `customer_detail_cleaned`
ON cd.customer_id = fo.customer_id  -- Mencocokkan data berdasarkan `customer_id`
WHERE 
  EXTRACT(YEAR FROM cd.registration_date) = 2024  -- Memfilter tanggal registrasi hanya tahun 2024
  AND fo.first_order_date IS NOT NULL  -- Memfilter hanya tanggal pesanan paling awal yang tidak NULL
GROUP BY month, cd.registration_channel  -- Mengelompokkan hasil berdasarkan bulan dan channel registrasi
ORDER BY month, cd.registration_channel;  -- Mengurutkan hasil dengan bulan dan channel registrasi yang terkecil
