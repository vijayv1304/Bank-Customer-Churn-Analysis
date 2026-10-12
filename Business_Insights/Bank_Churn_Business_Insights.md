# Bank Customer Churn Analysis
## Business Insights and Actionable Recommendations

### 1. Executive Summary

This project analyzes 10,000 bank customers to identify customer churn patterns, high-risk segments, and opportunities to improve customer retention.

**Key performance indicators:**

| Metric | Value |
|---|---:|
| Total Customers | 10,000 |
| Churned Customers | 2,037 |
| Retained Customers | 7,963 |
| Churn Rate | 20.37% |
| Retention Rate | 79.63% |

Approximately one in five customers has churned, highlighting an opportunity to improve retention.

### 2. Geographic Churn Analysis

| Geography | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| France | 5,014 | 810 | 16.15% |
| Germany | 2,509 | 814 | 32.44% |
| Spain | 2,477 | 413 | 16.67% |

**Finding:** Germany has the highest churn rate at 32.44%, approximately twice the rate observed in France and Spain.

**Recommendation:** Prioritize retention research and targeted interventions for customers in Germany. Investigate potential differences in customer experience, product suitability, pricing, and competitor offerings before selecting an intervention.

### 3. Gender-Based Churn Analysis

| Gender | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Female | 4,543 | 1,139 | 25.07% |
| Male | 5,457 | 898 | 16.46% |

**Finding:** The observed churn rate is higher among female customers than male customers.

**Recommendation:** Investigate the drivers behind this difference using additional customer experience and product usage information. Gender should not be used as the sole basis for offering or withholding retention benefits.

### 4. Customer Activity Analysis

| Activity Status | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Active | 5,151 | 735 | 14.27% |
| Inactive | 4,849 | 1,302 | 26.85% |

**Finding:** Inactive customers have substantially higher observed churn than active customers.

Inactive customers account for approximately 63.92% of all churned customers.

**Recommendation:** Develop a customer re-engagement strategy using usage-based reminders, feedback surveys, and personalized service outreach. Measure results through controlled experiments.

### 5. High-Risk Customer Segments

The analysis identified combinations of geography, activity status, and product ownership with elevated churn.

| Segment | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Germany — Inactive — 1 Product | 720 | 375 | 52.08% |
| France — Inactive — 1 Product | 1,253 | 371 | 29.61% |

**Finding:** Inactive German customers holding one product show a particularly high observed churn rate.

**Recommendation:** Prioritize this segment for further investigation and a pilot retention campaign. Evaluate product fit, engagement barriers, and service issues before deciding which intervention to offer.

### 6. Retention Strategy Recommendations

**Priority 1 — Investigate German customer churn**

Analyze service feedback, product suitability, customer complaints, and potential market-specific factors.

**Priority 2 — Re-engage inactive customers**

Test targeted engagement campaigns and monitor changes in activity, retention, and customer satisfaction.

**Priority 3 — Evaluate single-product customer needs**

Assess whether customers would benefit from additional relevant products or services, without assuming that cross-selling itself prevents churn.

**Priority 4 — Track segment-level churn**

Monitor churn rates by geography, activity, product count, and age group to detect emerging patterns.

### 7. Suggested Business KPIs

- Overall customer churn rate
- Customer retention rate
- Churn rate by geography
- Churn rate by activity status
- Churn rate by product ownership
- Customer engagement rate
- Retention campaign conversion rate
- Incremental retention improvement from controlled campaigns

### 8. Analytical Limitations

- The dataset represents a snapshot rather than a dated customer history.
- Observed relationships do not establish causal explanations for churn.
- Customer lifetime value and campaign return on investment cannot be calculated reliably without additional financial and historical data.
- Recommendations are hypotheses requiring business validation and controlled testing.

### 9. Conclusion

The analysis identifies Germany, inactive customers, and certain single-product customer segments as important areas for retention investigation.

The findings provide a data-driven foundation for prioritizing customer research, designing retention experiments, and monitoring business outcomes.