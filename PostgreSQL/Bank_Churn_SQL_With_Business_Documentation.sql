-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 1: Overall Customer Churn
-- ==================================================

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS retention_rate_pct
FROM bank_customers;

-- ### Business Question 1: Overall Customer Churn Analysis
--
-- **Objective:** Measure the overall customer churn and retention performance of the bank.
--
-- **Key Findings:**
-- - Total customers: 10,000
-- - Churned customers: 2,037
-- - Retained customers: 7,963
-- - Overall churn rate: 20.37%
-- - Customer retention rate: 79.63%
--
-- **Business Insight:**
--
-- Approximately one in five customers in the dataset has churned. The churn rate of 20.37% provides a baseline for comparing customer segments and identifying groups with elevated churn.
--
-- **Business Recommendation:**
--
-- Investigate customer segments with above-average churn rates. Prioritize retention analysis using customer demographics, geography, account activity, balances, and product ownership.


-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 2: Churn by Geography
-- ==================================================

SELECT
    geography,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    geography
ORDER BY
    churn_rate_pct DESC;

-- ### Business Question 2: Geography
--
-- **Objective:** Identify the geographical markets with the highest customer churn rates.
--
-- **Key Findings:**
-- - Germany: 32.44% (814/2,509); Spain: 16.67% (413/2,477); France: 16.15% (810/5,014).
--
-- **Business Insight:**
--
-- Germany: 32.44% (814/2,509); Spain: 16.67% (413/2,477); France: 16.15% (810/5,014).
--
-- **Business Recommendation:**
--
-- Investigate Germany's elevated churn, while considering customer mix.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 3: Churn by Gender
-- ==================================================

SELECT
    gender,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    gender
ORDER BY
    churn_rate_pct DESC;

-- ### Business Question 3: Gender and Geography
--
-- **Objective:** Compare customer churn across gender groups.
--
-- **Key Findings:**
-- - Female: 25.07% (1,139/4,543); male: 16.46% (898/5,457). Germany female: 37.55%; Germany male: 27.81%.
--
-- **Business Insight:**
--
-- Female: 25.07% (1,139/4,543); male: 16.46% (898/5,457). Germany female: 37.55%; Germany male: 27.81%.
--
-- **Business Recommendation:**
--
-- Explore other variables behind the association; do not use gender alone for differential treatment.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 3B: Churn by Geography and Gender
-- ==================================================

SELECT
    geography,
    gender,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    geography,
    gender
ORDER BY
    churn_rate_pct DESC;


-- **Objective:** Compare churn across gender groups within each geographical market.
--
-- **Key Findings:**
-- - Germany female: 37.55%; Germany male: 27.81%.
-- - Spain female: 21.21%; Spain male: 13.11%.
-- - France female: 20.34%; France male: 12.71%.
--
-- **Business Insight:** Female customers have higher observed churn in each country, but the results do not establish a causal relationship.
--
-- **Business Recommendation:** Investigate customer-experience differences without using gender alone to determine eligibility for retention offers.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 4: Churn by Age Group
-- ==================================================

WITH age_segments AS (
    SELECT
        customerid,
        exited,
        CASE
            WHEN age BETWEEN 18 AND 30 THEN '18-30'
            WHEN age BETWEEN 31 AND 40 THEN '31-40'
            WHEN age BETWEEN 41 AND 50 THEN '41-50'
            WHEN age BETWEEN 51 AND 60 THEN '51-60'
            ELSE '61+'
        END AS age_group
    FROM bank_customers
)

SELECT
    age_group,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM age_segments
GROUP BY
    age_group
ORDER BY
    CASE age_group
        WHEN '18-30' THEN 1
        WHEN '31-40' THEN 2
        WHEN '41-50' THEN 3
        WHEN '51-60' THEN 4
        ELSE 5
    END;

-- ### Business Question 4: Age Group
--
-- **Objective:** Identify which customer age groups show elevated churn.
--
-- **Key Findings:**
-- - 18–30: 7.52%; 31–40: 12.09%; 41–50: 33.97%; 51–60: 56.21%; 61+: 24.78%. Age 41–50 has 788 churned, the largest age-group count.
--
-- **Business Insight:**
--
-- 18–30: 7.52%; 31–40: 12.09%; 41–50: 33.97%; 51–60: 56.21%; 61+: 24.78%. Age 41–50 has 788 churned, the largest age-group count.
--
-- **Business Recommendation:**
--
-- Investigate customer experience across age groups without assuming age causes churn.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 5: Churn by Activity Status
-- ==================================================

SELECT
    CASE
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    isactivemember
ORDER BY
    churn_rate_pct DESC;

-- ### Business Question 5: Activity Status
--
-- **Objective:** Compare churn between active and inactive customers.
--
-- **Key Findings:**
-- - Inactive: 26.85% (1,302/4,849); active: 14.27% (735/5,151); gap: 12.58 percentage points.
--
-- **Business Insight:**
--
-- Inactive: 26.85% (1,302/4,849); active: 14.27% (735/5,151); gap: 12.58 percentage points.
--
-- **Business Recommendation:**
--
-- Evaluate re-engagement initiatives and their actual retention impact.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 6: Churn by Number of Products
-- ==================================================

SELECT
    numofproducts,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    numofproducts
ORDER BY
    numofproducts;


-- ### Business Question 6: Number of Products
--
-- **Objective:** Evaluate how churn varies with the number of banking products owned.
--
-- **Key Findings:**
-- - 1 product: 27.71% (1,409/5,084); 2: 7.58% (348/4,590); 3: 82.71% (220/266); 4: 100% (60/60).
--
-- **Business Insight:**
--
-- 1 product: 27.71% (1,409/5,084); 2: 7.58% (348/4,590); 3: 82.71% (220/266); 4: 100% (60/60).
--
-- **Business Recommendation:**
--
-- Investigate one-product churn volume and the three-/four-product anomalies; don't assume cross-selling prevents churn.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 7: Churn by Account Balance
-- ==================================================

WITH balance_segments AS (
    SELECT
        customerid,
        exited,
        CASE
            WHEN balance = 0 THEN 'Zero Balance'
            WHEN balance < 50000 THEN 'Below 50K'
            WHEN balance < 100000 THEN '50K-100K'
            WHEN balance < 150000 THEN '100K-150K'
            ELSE '150K+'
        END AS balance_group
    FROM bank_customers
)

SELECT
    balance_group,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM balance_segments
GROUP BY
    balance_group
ORDER BY
    CASE balance_group
        WHEN 'Zero Balance' THEN 1
        WHEN 'Below 50K' THEN 2
        WHEN '50K-100K' THEN 3
        WHEN '100K-150K' THEN 4
        ELSE 5
    END;


-- ### Business Question 7: Account Balance
--
-- **Objective:** Compare churn rates and churn counts across account balance groups.
--
-- **Key Findings:**
-- - Zero: 13.82% (500/3,617); below 50K: 34.67% (26/75); 50–100K: 19.88% (300/1,509); 100–150K: 25.77% (987/3,830); 150K+: 23.12% (224/969).
--
-- **Business Insight:**
--
-- Zero: 13.82% (500/3,617); below 50K: 34.67% (26/75); 50–100K: 19.88% (300/1,509); 100–150K: 25.77% (987/3,830); 150K+: 23.12% (224/969).
--
-- **Business Recommendation:**
--
-- Investigate the 100–150K group because of high churn volume; below-50K group is small.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 8: Churn by Credit Score
-- ==================================================

WITH credit_segments AS (
    SELECT
        customerid,
        exited,
        CASE
            WHEN creditscore < 500 THEN 'Below 500'
            WHEN creditscore < 600 THEN '500-599'
            WHEN creditscore < 700 THEN '600-699'
            WHEN creditscore < 800 THEN '700-799'
            ELSE '800+'
        END AS credit_group
    FROM bank_customers
)


SELECT
    credit_group,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM credit_segments
GROUP BY
    credit_group
ORDER BY
    CASE credit_group
        WHEN 'Below 500' THEN 1
        WHEN '500-599' THEN 2
        WHEN '600-699' THEN 3
        WHEN '700-799' THEN 4
        ELSE 5
    END;


-- ### Business Question 8: Credit Score
--
-- **Objective:** Assess whether credit score bands show differences in churn.
--
-- **Key Findings:**
-- - Below 500: 23.73%; 500–599: 21.23%; 600–699: 19.72%; 700–799: 19.90%; 800+: 19.54%.
--
-- **Business Insight:**
--
-- Below 500: 23.73%; 500–599: 21.23%; 600–699: 19.72%; 700–799: 19.90%; 800+: 19.54%.
--
-- **Business Recommendation:**
--
-- Credit score shows relatively small differences; examine jointly with engagement and products.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 9: Churn by Tenure
-- ==================================================

WITH tenure_segments AS (
    SELECT
        customerid,
        exited,
        CASE
            WHEN tenure BETWEEN 0 AND 2 THEN '0-2 Years'
            WHEN tenure BETWEEN 3 AND 5 THEN '3-5 Years'
            WHEN tenure BETWEEN 6 AND 8 THEN '6-8 Years'
            ELSE '9-10 Years'
        END AS tenure_group
    FROM bank_customers
)

SELECT
    tenure_group,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM tenure_segments
GROUP BY
    tenure_group
ORDER BY
    CASE tenure_group
        WHEN '0-2 Years' THEN 1
        WHEN '3-5 Years' THEN 2
        WHEN '6-8 Years' THEN 3
        ELSE 4
    END;

-- ### Business Question 9: Tenure
--
-- **Objective:** Understand churn patterns across customer tenure bands.
--
-- **Key Findings:**
-- - 0–2 years: 21.15%; 3–5: 20.76%; 6–8: 18.87%; 9–10: 21.30%.
--
-- **Business Insight:**
--
-- 0–2 years: 21.15%; 3–5: 20.76%; 6–8: 18.87%; 9–10: 21.30%.
--
-- **Business Recommendation:**
--
-- Do not treat tenure alone as a strong churn indicator.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 10: Churn by Credit Card Ownership
-- ==================================================

SELECT
    CASE
        WHEN hascrcard = 1 THEN 'Has Credit Card'
        ELSE 'No Credit Card'
    END AS credit_card_status,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    hascrcard
ORDER BY
    churn_rate_pct DESC;


-- ### Business Question 10: Credit Card Ownership
--
-- **Objective:** Compare churn among customers with and without credit cards.
--
-- **Key Findings:**
-- - No card: 20.81% (613/2,945); has card: 20.18% (1,424/7,055); gap: 0.63 percentage points.
--
-- **Business Insight:**
--
-- No card: 20.81% (613/2,945); has card: 20.18% (1,424/7,055); gap: 0.63 percentage points.
--
-- **Business Recommendation:**
--
-- Avoid targeting retention solely by credit card ownership.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 11: Churn by Estimated Salary
-- ==================================================

WITH salary_segments AS (
    SELECT
        customerid,
        exited,
        CASE
            WHEN estimatedsalary < 40000 THEN 'Below 40K'
            WHEN estimatedsalary < 80000 THEN '40K-80K'
            WHEN estimatedsalary < 120000 THEN '80K-120K'
            WHEN estimatedsalary < 160000 THEN '120K-160K'
            ELSE '160K+'
        END AS salary_group
    FROM bank_customers
)

SELECT
    salary_group,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM salary_segments
GROUP BY
    salary_group
ORDER BY
    CASE salary_group
        WHEN 'Below 40K' THEN 1
        WHEN '40K-80K' THEN 2
        WHEN '80K-120K' THEN 3
        WHEN '120K-160K' THEN 4
        ELSE 5
    END;

-- ### Business Question 11: Estimated Salary
--
-- **Objective:** Examine churn rates across estimated salary ranges.
--
-- **Key Findings:**
-- - Below 40K: 20.15%; 40–80K: 19.82%; 80–120K: 20.06%; 120–160K: 20.21%; 160K+: 21.61%.
--
-- **Business Insight:**
--
-- Below 40K: 20.15%; 40–80K: 19.82%; 80–120K: 20.06%; 120–160K: 20.21%; 160K+: 21.61%.
--
-- **Business Recommendation:**
--
-- Salary shows little separation; estimated salary is not bank profit.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 12: Churn by Activity and Number of Products
-- ==================================================

SELECT
    CASE
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    numofproducts,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    isactivemember,
    numofproducts
ORDER BY
    churn_rate_pct DESC;

-- ### Business Question 12: Activity × Product Count
--
-- **Objective:** Find churn patterns across activity status and product ownership.
--
-- **Key Findings:**
-- - Inactive/1 product: 36.65% (924/2,521), 45.36% of all churn; active/1: 18.92%; inactive/2: 9.89%; active/2: 5.56%. Three-/four-product rates remain very high.
--
-- **Business Insight:**
--
-- Inactive/1 product: 36.65% (924/2,521), 45.36% of all churn; active/1: 18.92%; inactive/2: 9.89%; active/2: 5.56%. Three-/four-product rates remain very high.
--
-- **Business Recommendation:**
--
-- Investigate inactive single-product customers and anomalous higher-product segments.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 13: Churn by Geography and Activity
-- ==================================================

SELECT
    geography,
    CASE
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    geography,
    isactivemember
ORDER BY
    churn_rate_pct DESC;


-- ### Business Question 13: Geography × Activity
--
-- **Objective:** Compare activity-related churn within each geographical market.
--
-- **Key Findings:**
-- - Germany inactive: 41.08% (518/1,261); Germany active: 23.72%; Spain inactive: 23.35%, active: 10.75%; France inactive: 21.13%, active: 11.50%.
--
-- **Business Insight:**
--
-- Germany inactive: 41.08% (518/1,261); Germany active: 23.72%; Spain inactive: 23.35%, active: 10.75%; France inactive: 21.13%, active: 11.50%.
--
-- **Business Recommendation:**
--
-- Explore Germany-specific factors beyond activity status.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 14: Churn by Age Group and Activity
-- ==================================================

WITH age_segments AS (
    SELECT
        customerid,
        exited,
        isactivemember,
        CASE
            WHEN age BETWEEN 18 AND 30 THEN '18-30'
            WHEN age BETWEEN 31 AND 40 THEN '31-40'
            WHEN age BETWEEN 41 AND 50 THEN '41-50'
            WHEN age BETWEEN 51 AND 60 THEN '51-60'
            ELSE '61+'
        END AS age_group
    FROM bank_customers
)

SELECT
    age_group,
    CASE
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM age_segments
GROUP BY
    age_group,
    isactivemember
ORDER BY
    CASE age_group
        WHEN '18-30' THEN 1
        WHEN '31-40' THEN 2
        WHEN '41-50' THEN 3
        WHEN '51-60' THEN 4
        ELSE 5
    END,
    isactivemember DESC;

-- ### Business Question 14: Age × Activity
--
-- **Objective:** Investigate churn by age group and activity status.
--
-- **Key Findings:**
-- - Inactive 51–60: 85.71% (288/336); inactive 61+: 82.02% (73/89); inactive 41–50: 41.60% (510/1,226).
--
-- **Business Insight:**
--
-- Inactive 51–60: 85.71% (288/336); inactive 61+: 82.02% (73/89); inactive 41–50: 41.60% (510/1,226).
--
-- **Business Recommendation:**
--
-- Investigate high-rate and high-volume groups separately; ensure fair treatment.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 15: Churn by Geography and Number of Products
-- ==================================================

SELECT
    geography,
    numofproducts,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    geography,
    numofproducts
ORDER BY
    geography,
    numofproducts;

-- ### Business Question 15: Geography × Product Count
--
-- **Objective:** Compare churn by geography and product count.
--
-- **Key Findings:**
-- - Germany/1 product: 42.85% (578/1,349); France/1: 22.43%; Spain/1: 21.87%. Two-product churn: France 5.70%, Germany 12.12%, Spain 7.35%.
--
-- **Business Insight:**
--
-- Germany/1 product: 42.85% (578/1,349); France/1: 22.43%; Spain/1: 21.87%. Two-product churn: France 5.70%, Germany 12.12%, Spain 7.35%.
--
-- **Business Recommendation:**
--
-- Examine German single-product customers and the small three-/four-product anomalies.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 16: High-Churn Segments: Geography, Activity and Products
-- ==================================================

SELECT
    geography,
    CASE
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    numofproducts,
    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct
FROM bank_customers
GROUP BY
    geography,
    isactivemember,
    numofproducts
HAVING COUNT(*) >= 100
ORDER BY
    churn_rate_pct DESC,
    churned_customers DESC;

-- ### Business Question 16: High-Churn Segments (minimum 100 customers)
--
-- **Objective:** Identify high-churn customer segments by geography, activity and product ownership, limiting the ranking to groups of at least 100 customers.
--
-- **Key Findings:**
-- - Germany/inactive/1: 52.08% (375/720); Spain/inactive/1: 32.48%; Germany/active/1: 32.27%; France/inactive/1: 29.61%.
--
-- **Business Insight:**
--
-- Germany/inactive/1: 52.08% (375/720); Spain/inactive/1: 32.48%; Germany/active/1: 32.27%; France/inactive/1: 29.61%.
--
-- **Business Recommendation:**
--
-- Prioritize investigation using both rate and volume; threshold excludes small segments.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 17: Rank Customer Segments by Churn Volume
-- ==================================================

SELECT
    geography,

    CASE
        WHEN isactivemember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,

    numofproducts,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(
            (SELECT COUNT(*)
             FROM bank_customers
             WHERE exited = 1),
            0
        ),
        2
    ) AS contribution_to_total_churn_pct

FROM bank_customers

GROUP BY
    geography,
    isactivemember,
    numofproducts

ORDER BY
    churned_customers DESC;

-- ### Business Question 17: Contribution to Total Churn
--
-- **Objective:** Rank customer segments by the number of churned customers and their contribution to total churn.
--
-- **Key Findings:**
-- - Germany/inactive/1 contributes 18.41% (375); France/inactive/1 contributes 18.21% (371). Together 36.62%; top five segments 64.80% (1,320 churned).
--
-- **Business Insight:**
--
-- Germany/inactive/1 contributes 18.41% (375); France/inactive/1 contributes 18.21% (371). Together 36.62%; top five segments 64.80% (1,320 churned).
--
-- **Business Recommendation:**
--
-- Focus on large sources of historical churn; contribution does not equal preventable churn.

-- ==================================================
-- PROJECT: Bank Customer Churn Analysis
-- BUSINESS QUESTION 18: Final SQL KPI Validation
-- ==================================================

SELECT
    COUNT(*) AS total_customers,

    COUNT(DISTINCT customerid) AS unique_customers,

    SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        AS churned_customers,

    SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        AS retained_customers,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS churn_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN exited = 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS retention_rate_pct

FROM bank_customers;

-- ### Business Question 18: Final KPI Reconciliation
--
-- **Objective:** Reconcile customer counts and churn KPIs before Power BI reporting.
--
-- **Key Findings:**
-- - 10,000 total = 10,000 unique; 2,037 churned + 7,963 retained = 10,000; churn 20.37%; retention 79.63%.
--
-- **Business Insight:**
--
-- 10,000 total = 10,000 unique; 2,037 churned + 7,963 retained = 10,000; churn 20.37%; retention 79.63%.
