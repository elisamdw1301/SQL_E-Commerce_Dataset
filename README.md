# 🛍️ SQL E-Commerce Dataset

---

## 📄 Deskripsi
Proyek ini bertujuan untuk menganalisis total penjualan, channel, funnel, dan perilaku pelanggan untuk periode 2020-2024 menggunakan **Google BigQuery** dan **Google Looker Studio**. Fokus analisis meliputi:
- Total pendapatan bulanan tahun 2024
- Tren penjualan berdasarkan kategori
- Pertumbuhan channel bulanan
- Kinerja funnel untuk event organic tahun 2024
- Tingkat optimasi customer onboarding

Tujuan akhir dari proyek ini adalah memberikan **insight strategis** yang dapat digunakan untuk mengambil keputusan bisnis.

---

## 📚 Dataset
Dataset yang digunakan adalah **Final Project** yang berasal dari **Bootcamp Data Analysis**. Terdapat [skema dataset](image/skema.png) yang akan digunakan dan berikut penjabaran dataset yang terdiri dari beberapa file `.csv`:

| Nama Dataset | Deskripsi | Tabel | Keterangan |
|-------------|-----------|------|---------------|
| `customer_detail.csv` | Informasi pelanggan | [Lihat Tabel](data/customer_detail.csv) | [Lihat Keterangan](image/customer_detail.png) |
| `funnel_detail.csv` | Data funnel penjualan | [Lihat Tabel](data/funnel_detail.csv) | [Lihat Keterangan](image/funnel_detail.png) |
| `order_detail.csv` | Data transaksi penjualan | [Lihat Tabel](data/order_detail.csv) | [Lihat Keterangan](image/order_detail.png) |
| `payment_detail.csv` | Metode pembayaran | [Lihat Tabel](data/payment_detail.csv) | [Lihat Keterangan](image/payment_detail.png) |
| `product_detail.csv` | Detail produk | [Lihat Tabel](data/product_detail.csv) | [Lihat Keterangan](image/product_detail.png) |
| `transaction_detail.csv` | Data transaksi keuangan | [Lihat Tabel](data/transaction_detail.csv) | [Lihat Keterangan](image/transaction_detail.png) |

---

## 🧼 Data Cleaning
Pembersihan data dilakukan menggunakan **Google BigQuery**, mencakup:
1. Menghapus spasi berlebih
2. Menangani nilai NULL pada kolom provinsi
3. Menangani nilai NULL pada kolom tanggal

🔗 [query data cleaning](sql/00_data_cleaning.sql)

---

## 🧮 SQL Analisis
Seluruh data dianalisis menggunakan **Google BigQuery**.
| Analisis | Deskripsi | Query |
|---------|------------|-------|
| Monthly Total Revenue | Menganalisis total pendapatan per bulan di tahun 2024 | [Lihat Query](sql/01_monthly_total_revenue.sql) |
| Sales Trend by Category | Mengidentifikasi kategori produk dengan total penjualan | [Lihat Query](sql/02_sales_trend_by_category.sql) |
| Monthly Channel Growth | Menganalisis YoY Growth Revenue per bulan 2024 vs 2023 dalam bulan yang sama berdasarkan channel | [Lihat Query](sql/03_monthly_channel_growth.sql) |
| Effectiveness of Organic Events | Menganalisis tingkat efektivitas jalur organik | [Lihat Query](sql/04_effectiveness_of_organic_events.sql) |
| Customer Onboarding Optimizing | Menganalisis optimasi customer onboarding | [Lihat Query](sql/05_customer_onboarding_optimization.sql) |

---

## 📊 Data Visualization 
Visualisasi dashboard dibuat menggunakan **Google Looker Studio** dan berdasar pada query analisis.

🔗 [Dashboard Overview](image/SQL_Dashboard.jpg)
🌐 [Lihat Dashboard Interaktif](https://lookerstudio.google.com/reporting/a7b3d354-e010-4f35-808e-a964cb93d721)

---

## 🔍 Insight
Insight diambil dan diurut berdasarkan hasil SQL analisis.
- Penjualan tertinggi terjadi pada bulan Oktober (834M) 
- Permintaan pasar untuk kategori Home Decor dan Fashion mengalami peningkatan di tahun 2024
- Channel Website menunjukkan menunjukkan pertumbuhan paling tinggi
- Semua channel (App Store, Play Store, Website) memiliki efektivitas yang setara (25%)
- Semakin banyak pelanggan baru yang masuk, semakin besar kemungkinan terjadi perlambatan atau hambatan dalam proses konversi awal

---

## 💡Rekomendasi
Rekomendasi dibuat dan diurut berdasarkan insight.
- Tingkatkan stok & kampanye sejak awal Q4
- Peluang besar untuk ekspansi produk & kampanye pemasaran yang lebih optimal untuk kategori Home Decor dan Fashion
- Optimalkan channel Website untuk retensi pelanggan lama
- Memaksimalkan promosi tambahan untuk meningkatkan volume order
- Lakukan analisis mendalam pada jalur konversi dengan mencari tahu langkah spesifik mana (misalnya, pengisian data, proses pembayaran pertama) yang mengalami penumpukan atau kegagalan saat trafik tinggi.

---

## 🧠 Skill & Tools
| Skill / Tool            | Penggunaan                                     |
|--------------------------|-----------------------------------------------|
| Google BigQuery | Data cleaning dan analisis |
| Google Looker Studio | Dashboard dan visualisasi interaktif |
| GitHub & Markdown | Dokumentasi dan publikasi proyek |

---

## 📌 Tentang Saya
Lulusan Matematika dengan pengalaman 5 tahun sebagai **operator produksi di industri otomotif** dan memiliki ketertarikan  **di bidang Data Analyst**. 
Pengalaman sebelumnya mengasah ketajaman saya pada detail, perbaikan proses, dan manajemen operasional, yang kini saya terapkan melalui lensa data. 
Saya telah menyelesaikan dan memiliki **sertifikasi Data Analyst dari Bootcamp** dengan keahlian utama SQL(Google BigQuery) untuk ekstraksi dan manipulasi data serta tool visualisasi(Google Looker Studio).
Siap berkontribusi dan berkomitmen dalam tim yang berfokus untuk menganalisis data, mengidentifikasi peluang perbaikan proses, dan mendukung optimasi strategi bisnis berbasis data.

📧 Email: elisa.martiana.dewi1301@gmail.com  
🔗 LinkedIn: [linkedin.com/in/elisa-martiana-dewi1301](https://www.linkedin.com/in/elisa-martiana-dewi1301/)  
💻 GitHub: [github.com/yourusername](https://github.com/yourusername)

---

## 📝 Penutup
Proyek ini merupakan bagian dari portofolio untuk menunjukkan kemampuan saya dalam:
- Mengelola dan membersihkan data dalam jumlah besar  
- Melakukan analisis SQL yang relevan dengan bisnis  
- Menyajikan insight melalui dashboard visualisasi  
- Menyusun laporan profesional dengan GitHub & Markdown

---

## 📂 Struktur Folder 
```
📂 SQL E-Commerce Dataset
├── 📄 README.md
├── 📂 data
│ ├── order_detail.csv
│ ├── customer_detail.csv
│ ├── product_detail.csv
│ ├── payment_detail.csv
│ ├── transaction_detail.csv
│ └── funnel_detail.csv
├── 📂 sql
│ ├── 00_data_cleaning.sql
│ ├── 01_monthly_total_revenue.sql
│ ├── 02_sales_trend_by_category.sql
│ ├── 03_monthly_channel_growth.sql
│ ├── 04_effectiveness_of_organic_events.sql
| └── 05_customer_onboarding_optimization.sql
├── 📂 images
│ ├── dashboard_overview.png
│ ├── customer_detail.png
│ ├── funnel_detail.png
│ ├── order_detail.png
│ ├── payment_detail.png
│ ├── product_detail.png
│ ├── transaction_detail.png
│ └── skema.png
```
