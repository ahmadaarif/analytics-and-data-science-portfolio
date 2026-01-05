## Project Overview
This project analyses user behaviour across an e-commerce funnel to understand **where users drop off**, **how effectively they convert**, and **which stages offer the greatest optimisation opportunities**.

The analysis follows an **end-to-end analytics workflow**, covering:
- Data preparation and sampling of large-scale event data
- Sequential funnel analysis in Python
- Validation of funnel metrics using SQL (SQLite)
- Interactive Power BI dashboard for business stakeholders
- Actionable insights and recommendations

The project is designed to reflect **real-world product and growth analytics work**, with a strong focus on business impact rather than tool usage alone.


## Business Problem
E-commerce platforms often generate high traffic but struggle to convert users efficiently.  
This project answers the following questions:

- How many users progress through each funnel stage (View → Cart → Purchase)?
- Where do the largest drop-offs occur?
- How stable is conversion behaviour over time?
- Which stages should be prioritised for optimisation to improve overall conversion?


## Dataset
- **Source:** Kaggle – E-commerce Behaviour Dataset (October 2019)
- **Data type:** Event-level user interaction data
- **Key events analysed:** `view`, `cart`, `purchase`

Due to the large size of the original dataset (~5GB), a **representative user-level sample** was created using chunked processing to preserve behaviour across the full month while remaining computationally efficient.

> Full raw data is not included in this repository due to size constraints.  
> A sampled and processed dataset is used for analysis and reproducibility.


## Tools & Technologies
- **Python:** pandas, numpy
- **SQL:** SQLite
- **Visualisation:** Power BI
- **Version Control:** Git & GitHub


## Methodology

### 1️⃣ Data Preparation (Python)
- Loaded large CSV files using chunked processing to avoid memory issues
- Filtered relevant funnel events (`view`, `cart`, `purchase`)
- Converted timestamps and created date-level fields
- Built a user-level dataset to support sequential funnel logic

### 2️⃣ Funnel Analysis (Python)
- Constructed a **sequential user-level funnel**
- Ensured users counted at each stage progressed through prior steps
- Calculated:
  - Funnel counts
  - Step conversion rates
  - Drop-off rates
  - Daily conversion trends

### 3️⃣ SQL Validation (SQLite)
- Reproduced the same funnel logic using SQL
- Created user-level flags and sequential filters
- Validated that SQL results aligned with Python outputs
- Calculated conversion rates and drop-offs using window functions

### 4️⃣ Visualisation (Power BI)
- Built an interactive dashboard with:
  - Funnel KPIs (Views, Cart Users, Purchases)
  - Conversion rate cards
  - Funnel bar chart (sequential and correctly ordered)
  - Daily conversion trend with date slicer
- Designed the dashboard to clearly separate:
  - **Overall funnel performance**
  - **Time-based trend exploration**


## Key Results (Sample Data)
- **View → Cart Conversion:** ~17.9%
- **Cart → Purchase Conversion:** ~65.3%
- **Overall Conversion:** ~11.7%

The analysis highlights a significant drop-off before cart addition, while showing strong purchase intent once users commit.