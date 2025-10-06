-- Menghapus duplikasi pada tabel `order_detail`
SELECT DISTINCT *
FROM `FinalProject.order_detail`;


-- Mengganti NULL pada kolom 'province' dengan 'UNKNOWN' pada tabel `customer_detail`
SELECT
  customer_id,
  COALESCE(province, 'UNKNOWN') AS province_cleaned
FROM `FinalProject.customer_detail_cleaned`;


-- Menghapus spasi berlebih pada tabel `customer_detail`
CREATE OR REPLACE TABLE `FinalProject.customer_detail_cleaned` AS
SELECT
  registration_date,
  dob,
  TRIM(`customer_id `) AS customer_id,
  TRIM(`customer_name `) AS customer_name,
  TRIM(`customer_type `) AS customer_type,
  TRIM(`province `) AS province,
  TRIM(`registration_channel `) AS registration_channel
FROM `FinalProject.customer_detail`

