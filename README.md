# 📊 EdTech Business Data Analysis

## 📌 Project Overview

This project simulates a real-world EdTech business scenario where student acquisition, conversion performance, revenue contribution, engagement behavior, and email funnel effectiveness are analyzed using SQL, Python, and Power BI.

The objective is to generate actionable insights that help improve:

- Conversion rates  
- Revenue optimization  
- Marketing channel efficiency  
- Student engagement tracking  
- Retention strategy  

This project demonstrates an end-to-end analytics workflow — from data generation to SQL analysis, EDA, and dashboard visualization.

---

## 🗂 Project Structure

edtech-business-data-analysis/

- data/ → Generated datasets & SQLite database  
- python/ → Data generation & SQL execution scripts  
- sql/ → Modular SQL analysis queries  
- notebooks/ → Jupyter EDA notebook  
- dashboard/ → Power BI dashboard  
- README.md  

---

## 🧮 Dataset Summary

- 10,000 simulated students  
- ~6,000 enrollments  
- 5 exam batches  
- Multi-channel acquisition (YouTube, Telegram, Organic, Ads, Email, Referral)  
- Engagement tracking (Live + Recorded views)  
- Email funnel simulation  
- SQLite database integration  

---

## 🔍 Key Analyses Performed

### 1️⃣ Funnel Analysis
- Overall conversion rate
- Conversion by marketing source
- Conversion by working professional status

### 2️⃣ Revenue Analysis
- Revenue by batch
- Revenue by source
- Revenue by persona
- Average ticket size

### 3️⃣ Engagement Analysis
- Live engagement vs conversion
- Engagement comparison by working professionals
- Revenue contribution by engagement behavior

### 4️⃣ Email Funnel Analysis
- Email engagement segmentation
- Email engagement vs conversion rate

---

## 📈 Key Insights

- Revenue is diversified across multiple batches, reducing dependency risk.
- YouTube and Telegram drive strong revenue performance.
- Conversion differences across sources are moderate, indicating stable acquisition efficiency.
- Non-working professionals convert at a higher rate than working professionals.
- Higher engagement levels strongly correlate with improved conversion performance.
- Email engagement meaningfully influences purchase behavior.

---

## 🛠 Tech Stack

- Python (Pandas, NumPy)
- SQLite
- SQL (Modular Query Files)
- Jupyter Notebook
- Power BI
- Git & GitHub

---

## 🚀 How to Run

### Generate Data
python python/generate_data.py

### Run SQL Analysis
python python/sql_analysis.py

### Open Notebook
jupyter notebook

### Open Dashboard
Open the .pbix file inside dashboard/ using Power BI Desktop.

---

## 👨‍💻 Author

Himanshu Chauhan  
Aspiring Data Analyst | SQL | Python | Power BI  
