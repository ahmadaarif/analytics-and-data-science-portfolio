# Customer Churn Prediction (Classification)

## Objective
Predict whether a customer will churn (leave) to support targeted retention actions.

## Business framing
Retention teams typically have limited budget. This model helps prioritise customers most at risk of churn so outreach can be targeted where it has the highest impact.

## Dataset
Telco Customer Churn (public dataset).  
Raw data is not committed to this repository.

## Approach
1. Data cleaning + preprocessing (missing values, encoding, scaling where needed)
2. Exploratory analysis (churn rates by segment, key drivers)
3. Baseline model (logistic regression)
4. Tree-based model (e.g., Random Forest / XGBoost if available)
5. Evaluation focused on imbalanced classification:
   - ROC-AUC, PR-AUC
   - Confusion matrix + precision/recall
   - Recall@K / Precision@K for targeting
6. Model interpretation (feature importance; SHAP optional)
7. Recommendations: who to target and why (business actions)

## Repo structure
- `notebooks/` – analysis notebooks
- `src/` – reusable preprocessing and evaluation code
- `models/` – saved model artifacts (not committed)
- `reports/figures/` – exported charts (not committed)

## Reproducibility
Create an environment and install dependencies:
```bash
pip install -r requirements.txt
