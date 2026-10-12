# Bank Customer Churn Analysis — Python EDA Insights

## 1. Executive Summary

This project analyzes 10,000 banking customers to understand customer churn patterns, identify high-risk customer segments, and develop data-driven retention recommendations.

The exploratory data analysis was performed using Python, Pandas, NumPy, Matplotlib, and Seaborn.

**Key Performance Indicators**

| Metric | Value |
|---|---:|
| Total Customers | 10,000 |
| Retained Customers | 7,963 |
| Churned Customers | 2,037 |
| Overall Churn Rate | 20.37% |
| Retention Rate | 79.63% |

The analysis identifies important associations between customer churn and geography, age, activity status, product ownership, and account balance.

## 2. Geography Analysis

| Country | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Germany | 2,509 | 814 | 32.44% |
| Spain | 2,477 | 413 | 16.67% |
| France | 5,014 | 810 | 16.15% |

**Findings:** Germany has the highest churn rate at 32.44%, approximately twice the rate observed in France and Spain. France has the largest customer base and a substantial absolute churn volume.

**Recommendation:** Investigate customer experience, engagement, and product characteristics in Germany. Consider both churn rate and customer volume when prioritizing further analysis.

## 3. Customer Demographics

### Gender

| Gender | Churn Rate |
|---|---:|
| Female | 25.07% |
| Male | 16.46% |

### Age Groups

| Age Group | Churn Rate |
|---|---:|
| 18–30 | 7.52% |
| 31–40 | 12.09% |
| 41–50 | 33.97% |
| 51–60 | 56.21% |
| 61+ | 24.78% |

**Findings:** Customers aged 51–60 have the highest age-group churn rate, while customers aged 41–50 contribute the largest churn volume among the age groups.

**Recommendation:** Investigate underlying engagement, service, and account characteristics across demographic groups. Do not use age or gender alone to determine individual customer treatment.

## 4. Customer Activity

| Activity Status | Customers | Churn Rate |
|---|---:|---:|
| Inactive | 4,849 | 26.85% |
| Active | 5,151 | 14.27% |

**Findings:** Inactive customers have a substantially higher churn rate than active customers.

**Recommendation:** Investigate inactivity patterns and evaluate whether relevant engagement initiatives improve retention.

## 5. Banking Product Ownership

| Products Owned | Customers | Churn Rate |
|---|---:|---:|
| 1 | 5,084 | 27.71% |
| 2 | 4,590 | 7.58% |
| 3 | 266 | 82.71% |
| 4 | 60 | 100.00% |

**Findings:** Two-product customers have the lowest churn rate. Three- and four-product customers show exceptionally high churn, but these groups are small.

**Recommendation:** Investigate product suitability, customer satisfaction, and account characteristics. Do not assume that increasing product ownership directly reduces churn.

## 6. Financial and Account Characteristics

- **Balance:** Customers with balances between 100K and 150K have a churn rate of 25.77%, compared with 13.82% for zero-balance customers.
- **Credit Score:** Churn rates range from approximately 19.54% to 23.73% across the analyzed credit score groups.
- **Tenure:** Churn rates range from 18.87% to 21.30% across tenure groups.
- **Estimated Salary:** Churn rates range from 19.82% to 21.61% across salary groups.
- **Credit Card Ownership:** Customers without a credit card have a churn rate of 20.81%, compared with 20.18% for cardholders.

**Findings:** Balance shows more noticeable differences in churn than salary, tenure, or credit card ownership in these grouped comparisons.

## 7. Correlation Analysis

Pearson correlations with customer churn (`exited`):

| Feature | Correlation |
|---|---:|
| Age | +0.29 |
| Balance | +0.12 |
| Customer Activity | -0.16 |
| Product Count | -0.05 |
| Credit Score | -0.03 |
| Tenure | -0.01 |
| Credit Card Ownership | -0.01 |
| Estimated Salary | +0.01 |

**Interpretation:** Age has the strongest positive linear correlation among these features, while customer activity has the strongest negative correlation. These relationships are associative, not causal. Product ownership also shows nonlinear patterns that are not captured adequately by a single correlation coefficient.

## 8. Multivariable Customer Segmentation

### Geography × Activity

Germany's inactive customers have a churn rate of 41.08%, compared with 23.72% among active customers in Germany.

Inactive customers show higher churn rates than active customers in all three countries.

### Geography × Products

Among single-product customers:

- Germany: 42.85% churn.
- France: 22.43% churn.
- Spain: 21.87% churn.

Two-product customers show lower churn rates in every country.

### Age × Activity

Inactive customers aged 51–60 have a churn rate of 85.71%, compared with 34.71% among active customers in the same age group.

The inactive 41–50 segment contributes 510 churned customers, the highest churn volume among the age-activity combinations.

### Geography × Activity × Products

| Segment | Churned Customers | Churn Rate | Share of Total Churn |
|---|---:|---:|---:|
| Germany — Inactive — 1 Product | 375 | 52.08% | 18.41% |
| France — Inactive — 1 Product | 371 | 29.61% | 18.21% |
| Germany — Active — 1 Product | 203 | 32.27% | 9.97% |
| France — Active — 1 Product | 193 | 15.31% | 9.47% |
| Spain — Inactive — 1 Product | 178 | 32.48% | 8.74% |

These five segments account for **1,320 churned customers, representing 64.80% of total churn**.

Germany's and France's inactive single-product segments together account for 746 churned customers, or approximately 36.62% of total churn.

## 9. Business Recommendations

1. Investigate the experience of inactive, single-product customers, particularly in Germany and France.
2. Examine engagement patterns and service issues associated with customer inactivity.
3. Review product suitability and satisfaction across one-, two-, three-, and four-product segments.
4. Use churn volume and segment size alongside churn rate when prioritizing further investigation.
5. Evaluate retention interventions using controlled testing and appropriate performance metrics.
6. Avoid causal claims or individual treatment decisions based solely on demographic associations.

## 10. Limitations

- The dataset does not include transaction dates or customer churn dates, preventing time-series churn analysis.
- Revenue, profit, and customer lifetime value are unavailable, so financial impact cannot be quantified reliably.
- Extremely small segments may produce unstable churn percentages.
- Observational analysis cannot establish the causes of churn.
- The dataset provides historical patterns, not evidence that proposed interventions will work.

## 11. Conclusion

The analysis identifies geography, customer activity, age, and product ownership as useful dimensions for understanding customer churn.

The strongest operationally relevant finding is the concentration of churn among single-product customers, particularly inactive customers in Germany and France.