-- ANALISIS 2


-- Menampilkan tren penjualan berdasarkan kategori
SELECT    
    p.category, 
-- Menjumlahkan nilai pada kolom `quantity` berdasarkan tahun pada kolom `order_date`
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_date) = 2020 THEN o.quantity ELSE 0 END) AS year_2020, 
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_date) = 2021 THEN o.quantity ELSE 0 END) AS year_2021,
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_date) = 2022 THEN o.quantity ELSE 0 END) AS year_2022,
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_date) = 2023 THEN o.quantity ELSE 0 END) AS year_2023,
    SUM(CASE WHEN EXTRACT(YEAR FROM o.order_date) = 2024 THEN o.quantity ELSE 0 END) AS year_2024
FROM `FinalProject.order_detail` AS o    
-- Menggabungkan tabel `order_detail` dan `product_detail` berdasarkan kolom `sku_id` yang sama
JOIN `FinalProject.product_detail` AS p    
ON o.sku_id = p.sku_id      
WHERE EXTRACT(YEAR FROM o.order_date) BETWEEN 2020 AND 2024    
GROUP BY p.category
ORDER BY p.category;
