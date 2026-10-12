# Bank Customer Churn — SQL Business Insights

**Project:** Bank Customer Churn Analysis  
**Database:** `bank_churn_db`  
**Table:** `bank_customers`  
**Dataset:** 10,000 customers; no transaction/date field  
**Overall churn benchmark:** 20.37%

## Business objective
Understand the distribution of customer churn, identify segments for further investigation, and inform measurable retention experiments. These are observational, descriptive results, not causal findings.

## Business Question 01: Overall Customer Churn

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** 10,000 customers; 2,037 churned; 7,963 retained; churn 20.37%; retention 79.63%.

**Business recommendation:** Use 20.37% as the comparison benchmark for all segments.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 02: Geography

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Germany: 32.44% (814/2,509); Spain: 16.67% (413/2,477); France: 16.15% (810/5,014).

**Business recommendation:** Investigate Germany's elevated churn, while considering customer mix.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 03: Gender and Geography

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Female: 25.07% (1,139/4,543); male: 16.46% (898/5,457). Germany female: 37.55%; Germany male: 27.81%.

**Business recommendation:** Explore other variables behind the association; do not use gender alone for differential treatment.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 04: Age Group

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** 18–30: 7.52%; 31–40: 12.09%; 41–50: 33.97%; 51–60: 56.21%; 61+: 24.78%. Age 41–50 has 788 churned, the largest age-group count.

**Business recommendation:** Investigate customer experience across age groups without assuming age causes churn.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 05: Activity Status

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Inactive: 26.85% (1,302/4,849); active: 14.27% (735/5,151); gap: 12.58 percentage points.

**Business recommendation:** Evaluate re-engagement initiatives and their actual retention impact.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 06: Number of Products

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** 1 product: 27.71% (1,409/5,084); 2: 7.58% (348/4,590); 3: 82.71% (220/266); 4: 100% (60/60).

**Business recommendation:** Investigate one-product churn volume and the three-/four-product anomalies; don't assume cross-selling prevents churn.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 07: Account Balance

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Zero: 13.82% (500/3,617); below 50K: 34.67% (26/75); 50–100K: 19.88% (300/1,509); 100–150K: 25.77% (987/3,830); 150K+: 23.12% (224/969).

**Business recommendation:** Investigate the 100–150K group because of high churn volume; below-50K group is small.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 08: Credit Score

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Below 500: 23.73%; 500–599: 21.23%; 600–699: 19.72%; 700–799: 19.90%; 800+: 19.54%.

**Business recommendation:** Credit score shows relatively small differences; examine jointly with engagement and products.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 09: Tenure

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** 0–2 years: 21.15%; 3–5: 20.76%; 6–8: 18.87%; 9–10: 21.30%.

**Business recommendation:** Do not treat tenure alone as a strong churn indicator.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 10: Credit Card Ownership

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** No card: 20.81% (613/2,945); has card: 20.18% (1,424/7,055); gap: 0.63 percentage points.

**Business recommendation:** Avoid targeting retention solely by credit card ownership.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 11: Estimated Salary

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Below 40K: 20.15%; 40–80K: 19.82%; 80–120K: 20.06%; 120–160K: 20.21%; 160K+: 21.61%.

**Business recommendation:** Salary shows little separation; estimated salary is not bank profit.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 12: Activity × Product Count

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Inactive/1 product: 36.65% (924/2,521), 45.36% of all churn; active/1: 18.92%; inactive/2: 9.89%; active/2: 5.56%. Three-/four-product rates remain very high.

**Business recommendation:** Investigate inactive single-product customers and anomalous higher-product segments.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 13: Geography × Activity

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Germany inactive: 41.08% (518/1,261); Germany active: 23.72%; Spain inactive: 23.35%, active: 10.75%; France inactive: 21.13%, active: 11.50%.

**Business recommendation:** Explore Germany-specific factors beyond activity status.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 14: Age × Activity

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Inactive 51–60: 85.71% (288/336); inactive 61+: 82.02% (73/89); inactive 41–50: 41.60% (510/1,226).

**Business recommendation:** Investigate high-rate and high-volume groups separately; ensure fair treatment.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 15: Geography × Product Count

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Germany/1 product: 42.85% (578/1,349); France/1: 22.43%; Spain/1: 21.87%. Two-product churn: France 5.70%, Germany 12.12%, Spain 7.35%.

**Business recommendation:** Examine German single-product customers and the small three-/four-product anomalies.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 16: High-Churn Segments (minimum 100 customers)

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Germany/inactive/1: 52.08% (375/720); Spain/inactive/1: 32.48%; Germany/active/1: 32.27%; France/inactive/1: 29.61%.

**Business recommendation:** Prioritize investigation using both rate and volume; threshold excludes small segments.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 17: Contribution to Total Churn

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** Germany/inactive/1 contributes 18.41% (375); France/inactive/1 contributes 18.21% (371). Together 36.62%; top five segments 64.80% (1,320 churned).

**Business recommendation:** Focus on large sources of historical churn; contribution does not equal preventable churn.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Business Question 18: Final KPI Reconciliation

**Objective:** Evaluate churn patterns for this business dimension.

**Results and key insight:** 10,000 total = 10,000 unique; 2,037 churned + 7,963 retained = 10,000; churn 20.37%; retention 79.63%.

**Business recommendation:** Validation passed; use these metrics as the Power BI reconciliation baseline.

**Limitation:** Association does not establish causation; interpret small segments cautiously.

## Consolidated recommendations

1. Investigate inactive single-product customers in Germany and France, balancing churn rates with customer counts.
2. Explore why Germany has elevated churn even among active customers.
3. Review the unusually high churn among three- and four-product customers, with careful attention to sample size and product suitability.
4. Evaluate retention interventions with appropriate testing and fairness checks.