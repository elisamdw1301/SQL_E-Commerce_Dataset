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
### 1. Pendapatan di tahun 2024.
Menganalisis total pendapatan per bulan di tahun 2024.
Query : 



