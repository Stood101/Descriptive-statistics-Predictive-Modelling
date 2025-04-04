# 💳 Credit Risk Analysis & Predictive Modeling (German Credit Dataset)

This project explores a German credit card dataset to understand key risk factors, perform statistical transformations, and build predictive models that classify customers as creditworthy or not. The analysis was conducted entirely in **R** using libraries like `readxl`, `tidyverse`, and built-in modeling functions.

---

## 📌 Project Objectives

- 🧹 Clean and prepare the dataset by handling missing values and inconsistent labels (e.g., replacing `"X"` in the `purpose` column).
- 📊 Explore and summarize key features using descriptive statistics.
- 📈 Standardize, normalize, and scale financial features using z-scores, t-scores, and min-max scaling.
- 🎯 Build custom **risk scoring models** using weighted inputs from business logic and team-defined criteria.
- 🧠 Implement **predictive models** including:
  - Linear Regression
  - Logistic Regression
- 🎲 Simulate dice, coin, and exponential distributions to model randomness and probability behavior.
- 📉 Visualize distributions and predictions using histograms.

---

## 🛠️ Tools & Technologies

- **Language:** R
- **Libraries:**  
  - `readxl`  
  - `tidyverse`  
  - Base R modeling (`lm()`, `glm()`)  
- **Techniques:**  
  - Data cleaning & wrangling  
  - Risk score modeling  
  - Feature engineering  
  - Predictive modeling  
  - Probability simulation  
  - Statistical standardization

---

## 📁 Files in This Repo

| File Name | Description |
|-----------|-------------|
| `german_credit_analysis_himanshu.R` | Main R script with full workflow from data cleaning to predictive modeling |
| `german credit card.xls` | Input dataset containing anonymized German credit card applications |
| `README.md` | You’re here. Summary of the project and structure |

---

## 🔍 Sample Insights

- Customers with higher employment status and good savings generally receive higher risk scores (safer customers).
- Logistic regression indicates that `checking`, `duration`, and `installment plans` have significant predictive power.
- Simulations confirm that probability distributions (dice, coin, exponential) align with statistical theory at scale.

---

## 🧠 Business Interpretation

This analysis demonstrates how financial institutions can use both descriptive and predictive analytics to make informed decisions about credit approvals, using data-driven risk scoring and probability-based modeling.

---

## 🚀 Getting Started

1. Clone the repository
2. Open `german_credit_analysis_himanshu.R` in RStudio
3. Ensure `german credit card.xls` is in your working directory
4. Run the script section by section or all at once

---

## 🤝 Let's Connect

This project was developed by **Himanshu Bundel** as part of the Business Analytics program at Hult International Business School.

📬 [LinkedIn] (https://www.linkedin.com/in/himanshubundel/) 
💡 Feedback, ideas, or collabs? DM me or fork the repo — let’s build cool things!

---

## 📌 Disclaimer

This project is for educational purposes. The dataset is anonymized and publicly available for practice and teaching.

