# SQL E-Commerce Dataset

## Tujuan 
Menganalisis total pendapatan dan tren perjualan tahun 2020-2024

## Tools 
- BigQuery : Query dan analisis data
- Looker Studio : Visualisasi data hasil analisis

## Dataset
- `customer_detail.csv`
- `funnel_detail.csv`
- `order_detail.csv`
- `payment_detail.csv`
- `product_detail.csv`
- `transaction_detail.csv`

## Data Cleaning
1. Menghapus duplikasi pada tabel `order_detail`
2. Mengganti NULL pada kolom `province` dengan `UNKNOWN`
3. Menghapus baris jika `customer_id` bernilai NULL
4. Menghapus spasi berlebih pada data tabel `customer_detail`

## Analisis Utama
### 1. Laporan Pendapatan Bulanan 2024
Menganalisis total pendapatan per bulan di tahun 2024.

Query : 
### 2. Tren Penjualan Kategori 2020–2024.
Mengidentifikasi kategori produk dengan total penjualan tertinggi.
Query : 
### 3. Pertumbuhan Channel Bulanan 
Menganalisis MoM Growth Revenue per bulan 2024 vs 2023 dalam bulan yang sama berdasarkan channel.
Query :
### 4. Laporan Kinerja Funnel untuk Event Organic 2024.
Menganalisis tingkat efektivitas jalur organik. 
Query :
### 5. Laporan Registrasi & Rata-rata Waktu ke Pembelian Pertama.
Menganalisis optimasi onboarding.
Query : 


