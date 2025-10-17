# 🛍️ SQL E-Commerce Dashboard

---

## 📄 Description
This project aims to analyze total sales, channels, funnels, and customer behavior for the 2020-2024 period using **Google BigQuery** and **Google Looker Studio**. The focus of the analysis includes:
- Total monthly revenue in 2024
- Sales trends by category
- Monthly channel growth
- Funnel performance for organic events in 2024
- Customer onboarding optimization rate     

The ultimate goal of this project is to provide **insights** that can be used to make business decisions.

---

## 📚 Dataset
The dataset used is **Final Project** from **Bootcamp Data Analysis**. There is a [dataset schema](image/skema.png) that will be used, and the following is a description of the dataset consisting of several `.csv` files:

| Dataset Name             | Dataset Description        | Table                                        | Table Description                                   |
|--------------------------|----------------------------|----------------------------------------------|-----------------------------------------------------|
| `customer_detail.csv`    | Customer information       | [See The Table](data/customer_detail.csv)    | [See The Description](image/customer_detail.png)    |
| `funnel_detail.csv`      | Sales funnel data          | [See The Table](data/funnel_detail.csv)      | [See The Description](image/funnel_detail.png)      |
| `order_detail.csv`       | Sales transaction data     | [See The Table](data/order_detail.csv)       | [See The Description](image/order_detail.png)       |
| `payment_detail.csv`     | Payment methods            | [See The Table](data/payment_detail.csv)     | [See The Description](image/payment_detail.png)     |
| `product_detail.csv`     | Product Details            | [See The Table](data/product_detail.csv)     | [See The Description](image/product_detail.png)     |
| `transaction_detail.csv` | Financial transaction data | [See The Table](data/transaction_detail.csv) | [See The Description](image/transaction_detail.png) |

⚠️ This dataset is a fictional dataset used for learning purposes in the bootcamp program. No personal or confidential data is displayed.

---

## 🧼 Data Cleaning
Data cleaning was performed using **Google BigQuery**, including:
1. Removing excess spaces
2. Handling NULL values in the province column
3. Handling NULL values in the date column

🔗 [Data Cleaning Query](sql/00_data_cleaning.sql)

---

## 🧮 SQL Analysis
All data was analyzed using **Google BigQuery**.
| Analysis                        | Description                                                                                 | Query                                                        |
|---------------------------------|---------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| Monthly Total Revenue           | Analyzing total monthly revenue in 2024                                                     | [See The Query](sql/01_monthly_total_revenue.sql)            |
| Sales Trend by Category         | Identifying product categories by total sales                                               | [See The Query](sql/02_sales_trend_by_category.sql)          |
| Monthly Channel Growth          | Analyzing YoY growth revenue per month in 2024 vs. 2023 in the same month based on channel  | [See The Query](sql/03_monthly_channel_growth.sql)           |
| Effectiveness of Organic Events | Analyzing the effectiveness of organic pathways                                             | [See The Query](sql/04_effectiveness_of_organic_events.sql)  |
| Customer Onboarding Optimizing  | Analyzing customer onboarding optimization                                                  | [See The Query](sql/05_customer_onboarding_optimization.sql) |

---

## 📊 Data Visualization 
The dashboard visualization was created using **Google Looker Studio** and is based on analysis queries.

🔗 [Dashboard Overview](image/SQL_Dashboard.jpg)     
🌐 [See The Interactive Dashboard ](https://lookerstudio.google.com/reporting/a7b3d354-e010-4f35-808e-a964cb93d721)

---

## 🔍 Insight
Insights are gathered and sorted based on SQL analysis results.
- Sales peaked in October (834M) 
- Market demand for the Home Decor and Fashion categories increased in 2024
- The Website channel showed the highest growth
- All channels (App Store, Play Store, Website) had equal effectiveness (25%)
- The more new customers come in, the greater the likelihood of slowdowns or obstacles in the initial conversion process

---

## 💡Recommendation
Recommendations are created and sorted based on insights.
- Increase stock & campaigns from the start of Q4
- Significant opportunities for product expansion and more optimized marketing campaigns for the Home Decor and Fashion categories
- Optimize the Website channel for customer retention
- Maximize additional promotions to increase order volume
- Conduct a thorough analysis of the conversion funnel by identifying specific steps (e.g., data entry, first payment process) that experience bottlenecks or failures during high traffic periods.

---

## 🧠 Skill & Tools
| Skill / Tool             | Usage                                 |
|--------------------------|---------------------------------------|
| Google BigQuery          | Data cleaning and analysis            |
| Google Looker Studio     | Dashboard and interactive visualizing |
| GitHub & Markdown        | Project documentation and publication |

---

## 📌 About Me
Mathematics graduate with 5 years of experience as a **production operator in the automotive industry** and an interest in the field of Data Analysis. 
My previous experience has honed my attention to detail, process improvement, and operational management, which I now apply through a data lens. 
I have completed and hold a **Data Analyst certification from Bootcamp** with core expertise in SQL (Google BigQuery) for data extraction and manipulation, as well as visualization tools (Google Looker Studio).
I am ready to contribute and commit to a team focused on analyzing data, identifying process improvement opportunities, and supporting data-driven business strategy optimization.


📧 Email: elisa.martiana.dewi1301@gmail.com  
🔗 LinkedIn: [linkedin.com/in/elisa-martiana-dewi1301](https://www.linkedin.com/in/elisa-martiana-dewi1301/)   
🧾 CV: [CV_Elisa Martiana Dewi](https://drive.google.com/file/d/1ER17MfZrwFb7DQycJmV6SHe6sKkwNHve/view?usp=sharing)   
💻 GitHub: [github.com/elisamdw1301](https://github.com/elisamdw1301)

---

## 📝 Closing
This project is part of a portfolio to showcase my skills in:
- Managing and cleaning large amounts of data  
- Performing business-relevant SQL analysis  
- Presenting insights through visualization dashboards  
- Compiling professional reports with GitHub & Markdown

---

## 📂 Folder Structure 
```
📂 SQL E-Commerce Dashboard
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
│ ├── SQL_dashboard.jpg
│ ├── customer_detail.png
│ ├── funnel_detail.png
│ ├── order_detail.png
│ ├── payment_detail.png
│ ├── product_detail.png
│ ├── transaction_detail.png
│ └── skema.png
```

