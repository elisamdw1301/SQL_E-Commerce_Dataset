# SQL E-Commerce Dataset

## Tujuan 
Menyusun laporan analisis penjualan, channel, funnel, dan perilaku pelanggan untuk periode 2020-2024.

## Tools 
- BigQuery : Query dan analisis data
- Looker Studio : Visualisasi data hasil analisis

## Dataset
- `customer_detail.csv` [lihat tabel](data/customer_detail.csv)
- `funnel_detail.csv` [lihat tabel](data/funnel_detail.csv)
- `order_detail.csv` [lihat tabel](data/order_detail.csv)
- `payment_detail.csv` [lihat tabel](data/payment_detail.csv)
- `product_detail.csv` [lihat tabel](data/product_detail.csv)
- `transaction_detail.csv` [lihat tabel](data/transaction_detail.csv)

## Data Cleaning
1. Menghapus spasi berlebih
2. Menangani nilai NULL pada kolom provinsi
3. Menangani nilai NULL pada kolom tanggal
   [query_data_cleaning](sql/01_cleaning.sql)

## Analisis Utama
### 1. Laporan Pendapatan Bulanan 2024
Menganalisis total pendapatan per bulan di tahun 2024. [query analisis 1](sql/02_monthly_total_revenue.sql)

### 2. Tren Penjualan per Kategori 2020–2024.
Mengidentifikasi kategori produk dengan total penjualan. [query analisis 2](sql/03_sales_trend_by_category.sql)

### 3. Pertumbuhan Channel Bulanan 
Menganalisis YoY Growth Revenue per bulan 2024 vs 2023 dalam bulan yang sama berdasarkan channel. [query analisis 3](sql/04_monthly_channel_growth.sql)

### 4. Laporan Kinerja Funnel untuk Event Organic 2024.
Menganalisis tingkat efektivitas jalur organik. [query analisis 4](sql/05_effectiveness_of_organic_events.sql)

### 5. Laporan Registrasi & Rata-rata Waktu ke Pembelian Pertama.
Menganalisis optimasi customer onboarding. [query analisis 5](sql/06_customer_onboarding_optimization.sql)

## Hasil Analisis
### 1. Laporan Pendapatan Bulanan 2024
#### Insight 
- Titik penjualan tertinggi terjadi pada bulan Oktober sebesar 834M: Didorong event akhir tahun & liburan, konsumen lebih konsumtif.
- Titik penjualan terendah terjadi pada bulan Januari sebesar 118M: Awal tahun konsumen menahan belanja pasca liburan.
- Tren kenaikan di Q4 (_seasonal trend_): Data menunjukkan pola musiman yang konsisten.
#### Implikasi
- Tingkatkan stok & kampanye sejak awal Q4.
- Luncurkan promo pasca-liburan & fokus produk dengan penjualan tertinggi.
- Gunakan pola ini untuk perencanaan inventory, SDM, dan strategi marketing tahunan.
  
### 2. Tren Penjualan per Kategori 2020–2024.
#### Insight
- Permintaan pasar untuk kategori Toys&Games dan Gaming Gear mengalami penurunan.
- Permintaan pasar untuk kategori Electronics, Sports, dan Beauty cenderung stabil.
- Permintaan pasar untuk kategori Home Decor dan Fashion mengalami peningkatan di tahun 2024.
- Permintaan Kitchen Appliances melonjak hanya di tahun 2022 (musiman). Implikasi: strategi promosi musiman bisa diulang untuk memaksimalkan momentum.
#### Implikasi 
- Perlu inovasi produk untuk kategori Toys&Games dan Gaming Gear.
- Fokus efisiensi biaya dan supply chain untuk kategori Electronics, Sports, dan Beauty.
- Peluang besar untuk ekspansi produk & kampanye pemasaran lebih agresif untuk kategori Home Decor dan Fashion.
- Strategi promosi musiman untuk kategori Kitchen Appliances bisa diulang untuk memaksimalkan momentum.
  
### 3. Pertumbuhan Channel Bulanan 
#### Insight
- Channel Website menunjukkan stabilitas, namun pertumbuhan terbatas.
#### Implikasi
- Fokus memperkuat App channel karena growth paling tinggi.
- Optimalkan channel Website untuk retensi pelanggan lama.
  
### 4. Laporan Kinerja Funnel untuk Event Organic 2024.
#### Insight
- Semua channel (App Store, Play Store, Website) memiliki conversion rate yang sama, yaitu 25%: Efektivitas tiap channel setara.
- Play Store memiliki total event terbesar yaitu 200: Memiliki potensi traffic lebih tinggi. 
- App Store & Website memiliki event lebih rendah yaitu 176 & 172. Walau konversi sama, perlu strategi meningkatkan awareness/traffic agar kontribusi seimbang dengan Play Store.
#### Implikasi
- Memaksimalkan promosi tambahan untuk meningkatkan volume order untuk Play Store.
- Perlu strategi untuk meningkatkan _awareness/traffic_ pada App Store & Website agar kontribusi seimbang dengan Play Store.

### 5. Laporan Registrasi & Rata-rata Waktu ke Pembelian Pertama.
#### Insight
- Kekuatan Channel Mobile App yaitu akuisisi tertinggi dan konsisten. Sedangkan kelemahannya yaitu konversi tidak secepat Offline Store.
- Kekuatan Channel Offline Store yaitu konversi tercepat. Sedangkan kelemahannya yaitu jumlah pelanggan baru sedikit.
- Kekuatan Channel Website yaitu masih berkontribusi dalam akuisisi. Sedangkan kelemahannya yaitu konversi yang lambat dan jumlah pelanggan sedikit.
#### Implikasi
- Untuk Channel Mobile App, perlu dioptimalkan promo in-app, push notification, & onboarding user.
- Untuk Channel Offline Store, tetap dijaga sebagai channel pendukung, fokus pada segmen tertentu.
- Untuk Channel Website, perlu memperbaiki UX, checkout flow, dan lakukan retargeting pasca registrasi.
