# 🛒 Woolworths Grocery Price Trend Analysis - End-to-End EDA

### Tracking essential household grocery prices at Woolworths (May–Nov 2025)

## 1. Overview
Australian grocery prices have been rising steadily over the past few years, affecting households across all income levels.
To understand how everyday essentials behave over time, I conducted a complete Exploratory Data Analysis (EDA) on daily grocery prices from Woolworths, focusing on:


How prices move month-to-month


Which items are the most and least stable


Whether a typical household basket is becoming more expensive


Insights into inflation-like patterns within supermarket pricing


This is a real-world dataset, manually extracted from a public grocery price tracker, making the analysis closer to real consumer experiences rather than idealised textbook data.

## 2. Dataset Source
Data Source:
📌 auscost.com.au – Woolworths Daily Grocery Price Dataset

🔗 https://auscost.com.au/d/dd34eddb-26fc-48ce-88fb-19ef7b18734e/groceries

The original dataset contains pricing history for many grocery items.
For this version of the project, I extracted a sample of 10 essential household products, including:

Eggs

Almond Milk / Lactose-free Milk

Red & Brown Onions

Pasta Sauce

Ravioli

Pesto

Chicken Tikka

A derived basket_total representing combined essentials
These items were selected because they reflect typical weekly household purchases, allowing for meaningful trend analysis.

## 3. Why I Built This Project
I created this project to:


Understand how fast grocery prices are rising in Australia


Identify which essential items are driving household spending increases


Analyse patterns, volatility, and stability of prices


Build a foundation for large-scale pricing comparison (more products, longer timeframes)


Prepare for a future project comparing Woolworths vs Coles and even 10+ years of grocery inflation data


This is part of a broader initiative to bring analytics into real-life financial and consumer decisions.

## 4. What This Project Covers
✔ Data Cleaning & Preparation
-Date parsing
-Handling missing values
-Data indexing
-Creating rolling averages
-Generating price indices
-Validating data via SQL


✔ SQL + Python EDA Pipeline
-MySQL schema creation
-Data sanity checks
-EDA in Pandas
-Visualisations using Matplotlib & Seaborn


✔ Analysis Performed
-Price Index (Base = first recorded day)
-Price Volatility (Std Dev)
-Correlation Heatmap
-7-Day Rolling Averages
-Daily Price Ranks
-Smoothed Weekly Trends
-Total Basket Cost Over Time
-Product-to-Product comparison (Red vs Brown onions, etc.)



## 5. Key Visuals Included in Repository
All charts are inside the /Images folder.


Price Index Chart – how each item's price changed relative to Day 1


Price Volatility Plot – identifies unstable pricing items


Weekly Average Price Trend – smoothed trends from May to Nov


Heatmap of Price Correlations – items that move together


Basket Total Trend – cost of a 9-item essentials basket over time


Daily Price Rank Chart – cheapest → most expensive items


Rolling 7-Day Averages – removes noise to show real patterns


Each visual is designed for portfolio and LinkedIn posting.

## 6. Most Important Insights

1. Pasta Sauce & Red Onions Are the Most Volatile
These items showed the highest standard deviation, likely due to promotions, seasonality, and supplier variations.


2. Eggs & Almond Milk Remain the Most Stable
Their prices barely moved across six months.


3. Essentials Basket Ranged Between $36.7 and $38.8
A noticeable increase showing price pressure even in basic groceries.


4. Price Index Reveals 5–25% Growth for Several Items
Some items doubled in price temporarily.


5. Red vs Brown Onions Show Clear Seasonal Patterns
Red onions fluctuate sharply; brown onions stay relatively stable.



## 7. Repository Structure
```
Woolworths-grocery-price-trend-eda/
│
├── Create_schema.sql
├── Basic_Exploration.sql
│
├── Data/
│   └── daily_groceries_prices.csv
│
├── Images/
│   ├── Price_Index.png
│   ├── Volatility.png
│   ├── Price_vs_Volatility.png
│   ├── Weekly_Average_Prices.png
│   ├── Price_Ranks.png
│   ├── Heatmap.png
│   ├── Basket_Total.png
│   ├── Red_vs_Brown_Onions.png
│   └── Rolling_Average_Prices.png
│
└── Woolworths_grocery_price_trend_EDA.pdf

```



## 8. Future Improvements
This EDA is Phase 1 of a much larger project. Future expansions will include:

 🔹 1. Expanding to 30–50 grocery items covering all household essentials (bread, milk, fruits, vegetables, meats, snacks).
 
 🔹 2. Woolworths vs Coles Price Comparison: Daily pricing difference, 5-year trend, Which supermarket is cheaper by category
 
 🔹 3. Multi-Year Inflation Tracking (2015–2025) Historical view of how household spending has changed in the last decade.
 
 🔹 4. Adding Price Prediction Models
Using:
ARIMA
Prophet
LSTM
To forecast future grocery prices.

 🔹 5. Dynamic Tableau Dashboard or Streamlit App - Interactive grocery inflation tracker.

## 9. Tech Stack

Python: Pandas, NumPy, Matplotlib, Seaborn

SQL: MySQL for schema + validation

Google Colab for analysis

GitHub for version control



## 10. How to Use This Repo
Clone the project:
git clone https://github.com/rohang-7/Woolworths-grocery-price-trend-eda.git

Open the notebook PDF/Colab version and run the analysis.

## 11. Contact
If you want to collaborate or explore pricing datasets with me, feel free to reach out!
