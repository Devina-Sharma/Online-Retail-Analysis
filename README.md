# Online Retail Sales & Customer Analytics Project

## Project Overview

This project analyses online retail transaction data to understand sales performance, customer behaviour, product performance, and customer risk patterns.

The project follows an end-to-end data analytics workflow, starting from raw data cleaning and transformation, followed by exploratory analysis, SQL-based business analysis, Power BI dashboard development, and customer segmentation with churn risk prediction using machine learning.

The objective is to extract meaningful business insights from transactional data and support data-driven decision-making.

---

# Dataset Description

This project uses a real-world online retail transaction dataset sourced from Kaggle.

The dataset represents transactional data from an online retail business and contains information such as:

- Invoice number
- Product details
- Quantity purchased
- Invoice date
- Unit price
- Customer information
- Country

The raw dataset was cleaned and transformed before analysis to improve data quality and create additional features required for business analysis.

---

# Project Objectives

The main objectives of this project are:

- Clean and prepare raw retail transaction data for analysis
- Analyse overall sales performance and revenue trends
- Identify high-performing products and markets
- Understand customer purchasing behaviour
- Segment customers using RFM analysis
- Identify customers classified as at risk based on purchasing behaviour
- Build an interactive dashboard for business analysis
- Apply machine learning to predict customer risk classification

---

# Tools & Technologies Used

## Python

Libraries used:

- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn

Used for:

- Data cleaning
- Feature engineering
- Exploratory data analysis
- Customer segmentation
- Churn risk prediction


## SQL (MySQL)

Used for:

- Business performance analysis
- Revenue analysis
- Customer analysis
- Product analysis
- Ranking analysis using window functions
- Revenue contribution analysis


## Power BI

Used for:

- Interactive dashboard creation
- KPI visualisation
- Revenue trend analysis
- Country and product performance analysis
- Business performance monitoring

---

# Project Workflow

```
Raw Retail Dataset
        |
        ↓
Data Cleaning & Preparation
        |
        ↓
Exploratory Data Analysis
        |
        ↓
SQL Business Analysis
        |
        ↓
Power BI Dashboard
        |
        ↓
Customer Segmentation & Churn Risk Prediction
```

---

# Project Files

```
Online-Retail-Analysis/

│
├── daa_cleaning.ipynb
│   └── Data cleaning and preprocessing
│
├── eda.ipynb
│   └── Exploratory data analysis and business insights
│
├── churn.ipynb
│   └── Customer segmentation and churn risk prediction model
│
├── retail_analysis.sql
│   └── SQL-based business analysis queries
│
└── salesdashboard.pbix
    └── Power BI interactive dashboard
```

---

# Analysis Performed

## 1. Data Cleaning & Preparation

The raw dataset was prepared for analysis by:

- Inspecting the dataset structure
- Converting date columns into datetime format
- Removing duplicate records
- Handling missing values
- Removing invalid transactions
- Removing zero and negative prices
- Removing negative quantities representing returns/cancellations
- Creating a Revenue feature using Quantity × Unit Price

---

# 2. Exploratory Data Analysis

The exploratory analysis focused on understanding business performance and sales patterns.

## Business Performance Metrics

The analysis calculated:

- Total Revenue
- Total Orders
- Total Customers
- Total Products
- Average Order Value


## Sales Analysis

The analysis explored:

- Monthly revenue trends
- Country-wise revenue contribution
- Product revenue performance


## Key Findings

- Total Revenue: **£10.64M**
- Total Orders: **19,960**
- Total Customers: **4,338**
- Total Products: **3,922**
- Average Order Value: **£533.17**

Additional insights:

- Revenue increased significantly towards the end of 2011.
- November recorded the highest monthly revenue.
- The United Kingdom was the largest revenue-generating market.
- A small number of products contributed significantly to overall revenue.

---

# 3. Product Performance Analysis

Product performance was analysed based on revenue contribution.

Top revenue-generating products included:

- Regency Cakestand 3 Tier
- Paper Craft Little Birdie
- White Hanging Heart T-Light Holder
- Party Bunting

Non-product transactions such as postage charges and manual adjustments were excluded when analysing actual product performance.

---

# 4. Customer Segmentation & Churn Risk Prediction

Customer purchasing behaviour was analysed using RFM analysis:

- **Recency** → How recently a customer made a purchase
- **Frequency** → Number of purchases made
- **Monetary** → Total customer spending


Customers were segmented based on purchasing behaviour, including:

- VIP Customers
- Loyal Customers
- Regular Customers
- At Risk Customers


A Logistic Regression model was developed to predict customer risk classification based on RFM-related features.

---

# Model Results

The Logistic Regression model achieved:

- Accuracy: **98.73%**
- Precision (At Risk Class): **100%**
- Recall (At Risk Class): **94%**

The model successfully identified customers classified as at risk based on their purchasing behaviour patterns.

---

# Feature Importance Insights

The model identified customer activity patterns that influence risk classification.

Key findings:

- Recency was the strongest indicator of customer risk.
- Customers with longer periods since their last purchase were more likely to be classified as at risk.
- Frequency and Monetary values also contributed to identifying customer behaviour patterns.

---

# SQL Analysis

SQL queries were developed to analyse:

- Overall revenue and order metrics
- Monthly sales trends
- Country performance
- Product performance
- Customer spending behaviour
- Customer rankings
- Revenue contribution percentages
- Running revenue trends

The SQL analysis supported the findings generated through Python and provided additional business-focused insights.

---

# Power BI Dashboard

The Power BI dashboard provides a visual overview of business performance, including:

- Revenue metrics
- Order and customer metrics
- Monthly sales trends
- Country-level revenue contribution
- Product performance analysis

The dashboard enables users to explore sales performance and identify important business trends.

---

# Conclusion

This project demonstrates an end-to-end data analytics workflow using Python, SQL, and Power BI.

The analysis transformed raw retail transaction data into meaningful insights about sales performance, customer behaviour, product contribution, and customer risk patterns.

The combination of data preparation, business analysis, dashboard development, and machine learning provides a complete approach to solving real-world analytics problems.

---

