-- DATA CLEANING


-- 1. Menghapus spasi berlebih pada tabel `customer_detail`
CREATE OR REPLACE TABLE `FinalProject.customer_detail_cleaned` AS  -- Membuat tabel baru 
  SELECT  -- Mengambil data 
    registration_date,  -- Memilih kolom `registration_date`
    dob,  -- Memilih kolom `dob`
    TRIM(`customer_id `) AS customer_id,  -- Menghapus spasi berlebih pada kolom `customer_id`
    TRIM(`customer_name `) AS customer_name,  -- Menghapus spasi berlebih pada kolom `customer_name`
    TRIM(`customer_type `) AS customer_type,  -- Menghapus spasi berlebih pada kolom `customer_type`
    TRIM(`province `) AS province,  -- Menghapus spasi berlebih pada kolom `province`
    TRIM(`registration_channel `) AS registration_channel  -- Menghapus spasi berlebih pada kolom `registration_channel`
  FROM `FinalProject.customer_detail`;  -- Mengambil data dari tabel `customer_detail`


-- 2. Menangani nilai NULL pada kolom provinsi
SELECT  -- Mengambil data
  customer_id,  -- Memilih kolom `customer_id`
  COALESCE(province, 'UNKNOWN') AS province_cleaned   -- Mengganti nilai NULL kolom `province` dengan `UNKNOWN`
FROM `FinalProject.customer_detail_cleaned`;  -- Mengambil data dari tabel `customer_detail_cleaned`


-- 3. Menangani nilai NULL pada kolom tanggal
SELECT  -- Mengambil data
  *,  -- Memilih seluruh data
  -- Mengubah nilai NULL pada kolom `order_date` dengan tanggal baru 
  COALESCE(order_date, CAST('2000-01-01 00:00:00 UTC' AS TIMESTAMP)) AS order_date_cleaned
FROM `FinalProject.order_detail`  -- Mengambil data dari tabel `order_detail`
