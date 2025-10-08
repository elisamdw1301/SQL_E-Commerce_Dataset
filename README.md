# SQL E-Commerce Dataset

## Tujuan 
Project ini bertujuan untuk menyusun laporan analisis penjualan, channel, funnel, dan perilaku pelanggan untuk periode 2020-2024.

## Tools 
- BigQuery : Query dan analisis data
- Looker Studio : Visualisasi data hasil analisis
## 🧠 Skill & Tools yang Digunakan

| Skill / Tool          | Keterangan Penggunaan |
|------------------------|-------------------------|
| SQL (BigQuery)         | Data cleaning dan analisis tren penjualan |
| Looker Studio          | Dashboard dan visualisasi interaktif |
| GitHub & Markdown      | Publikasi project dalam bentuk portofolio |


## Dataset
- `customer_detail.csv` [tabel](data/customer_detail.csv) & [keterangan](image/customer_detail.png)
- `funnel_detail.csv` [tabel](data/funnel_detail.csv) & [keterangan](image/funnel_detail.png)
- `order_detail.csv` [tabel](data/order_detail.csv) & [keterangan](image/order_detail.png)
- `payment_detail.csv` [tabel](data/payment_detail.csv) & [keterangan](image/payment_detail.png)
- `product_detail.csv` [tabel](data/product_detail.csv) & [keterangan](image/product_detail.png)
- `transaction_detail.csv` [tabel](data/transaction_detail.csv) & [keterangan](image/transaction_detail.png)

[skema dataset](image/skema.png)

## Data Cleaning
1. Menghapus spasi berlebih
2. Menangani nilai NULL pada kolom provinsi
3. Menangani nilai NULL pada kolom tanggal

[query_data_cleaning](sql/00_data_cleaning.sql)

## Analisis Utama
### 1. Laporan Pendapatan Bulanan 2024
Menganalisis total pendapatan per bulan di tahun 2024. [query analisis 1](sql/01_monthly_total_revenue.sql)

### 2. Tren Penjualan per Kategori 2020–2024
Mengidentifikasi kategori produk dengan total penjualan. [query analisis 2](sql/02_sales_trend_by_category.sql)

### 3. Pertumbuhan Channel Bulanan 
Menganalisis YoY Growth Revenue per bulan 2024 vs 2023 dalam bulan yang sama berdasarkan channel. [query analisis 3](sql/03_monthly_channel_growth.sql)

### 4. Laporan Kinerja Funnel untuk Event Organic 2024
Menganalisis tingkat efektivitas jalur organik. [query analisis 4](sql/04_effectiveness_of_organic_events.sql)

### 5. Laporan Registrasi & Rata-rata Waktu ke Pembelian Pertama
Menganalisis optimasi customer onboarding. [query analisis 5](sql/05_customer_onboarding_optimization.sql)

## Hasil Analisis
### 1. Laporan Pendapatan Bulanan 2024
#### Insight 
Penjualan tertinggi terjadi pada bulan Oktober (834M) 
  
### 2. Tren Penjualan per Kategori 2020–2024
#### Insight
Permintaan pasar untuk kategori Home Decor dan Fashion mengalami peningkatan di tahun 2024
   
### 3. Pertumbuhan Channel Bulanan 
#### Insight
Channel Website menunjukkan menunjukkan pertumbuhan paling tinggi

### 4. Laporan Kinerja Funnel untuk Event Organic 2024.
#### Insight
Semua channel (App Store, Play Store, Website) memiliki efektivitas yang setara (25%) 

### 5. Laporan Registrasi & Rata-rata Waktu ke Pembelian Pertama.
#### Insight
Semakin banyak pelanggan baru yang masuk, semakin besar kemungkinan terjadi perlambatan atau hambatan dalam proses konversi awal


#### Rekomendasi
1. Tingkatkan stok & kampanye sejak awal Q4
2. Peluang besar untuk ekspansi produk & kampanye pemasaran yang lebih optimal untuk kategori Home Decor dan Fashion
3. Optimalkan channel Website untuk retensi pelanggan lama
4. Memaksimalkan promosi tambahan untuk meningkatkan volume order
5. Lakukan analisis mendalam pada jalur konversi dengan mencari tahu langkah spesifik mana (misalnya, pengisian data, proses pembayaran pertama) yang mengalami penumpukan atau kegagalan saat trafik tinggi.

## Data Visualization
### 1. Laporan Pendapatan Bulanan 2024
[gambar analisis 01](image/analisis_01.png)
### 2. Tren Penjualan per Kategori 2020–2024
[gambar analisis 02](image/analisis_02.png)
### 3. Pertumbuhan Channel Bulanan 
[gambar analisis 03](image/analisis_03.png)
### 4. Laporan Kinerja Funnel untuk Event Organic 2024
[gambar analisis 04](image/analisis_04.png)
### 5. Laporan Registrasi & Rata-rata Waktu ke Pembelian Pertama
[gambar analisis 05](image/analisis_05.png)

<pre> ``` 📂 project-folder ├── 📄 README.md ├── 📂 data │ ├── orders.csv │ ├── customers.csv │ ├── products.csv │ ├── payments.csv │ ├── transactions.csv │ └── funnel.csv ├── 📂 sql │ ├── 01_data_cleaning.sql │ ├── 02_monthly_sales.sql │ ├── 03_top_products.sql │ ├── 04_payment_methods.sql │ └── 05_customer_segmentation.sql ├── 📂 notebooks │ └── eda_analysis.ipynb ├── 📂 images │ └── dashboard_overview.png ``` </pre>
