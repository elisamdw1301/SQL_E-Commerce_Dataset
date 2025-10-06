-- Total pendapatan per bulan tahun 2024.

SELECT
  EXTRACT(month FROM transaction_date) AS month, -- Memilih bulan dari kolom `transaction_date`
  SUM(total_paid) AS total_revenue  -- Menjumlahkan nilai pada kolom `total_paid`
FROM `FinalProject.transaction_detail` -- Mengambil data dari tabel `transaction_detail`
WHERE EXTRACT(year FROM transaction_date) = 2024  -- Memfilter tahun transaksi dari kolom `transaction_date` hanya 2024
GROUP BY month  -- Mengelompokkan total_revenue berdasarkan bulan
ORDER BY month ASC;  -- Mengurutkan hasil mulai dari bulan terkecil 
