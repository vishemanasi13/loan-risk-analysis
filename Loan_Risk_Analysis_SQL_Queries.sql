-- Project: Loan Risk Analysis Dashboard

 ===========================================================
 1. Loan Risk Category Distribution

SELECT
    CASE
        WHEN RiskScore >= 70 THEN 'High Risk'
        WHEN RiskScore >= 40 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Level,
    COUNT(*) AS Total_Customers
FROM loan_data
GROUP BY
    CASE
        WHEN RiskScore >= 70 THEN 'High Risk'
        WHEN RiskScore >= 40 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END;

 ==========================================================

 2. Average Risk Score by Employment Status


SELECT
    EmploymentStatus,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY EmploymentStatus
ORDER BY Avg_Risk DESC;

 ==========================================================
  3. Average Risk Score by Loan Purpose

SELECT
    LoanPurpose,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY LoanPurpose
ORDER BY Avg_Risk DESC;

 ==========================================================
 4. Previous Loan Defaults Impact on Risk Score


SELECT
    PreviousLoanDefaults,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY PreviousLoanDefaults;

 ==========================================================
 5. Bankruptcy History Impact on Risk Score

SELECT
    BankruptcyHistory,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY BankruptcyHistory;

 ==========================================================
 6. Risk Score by Credit Utilization Group


SELECT
    CASE
        WHEN CAST(REPLACE(CreditUtilization, '%', '') AS INT) < 30 THEN 'Low'
        WHEN CAST(REPLACE(CreditUtilization, '%', '') AS INT) < 70 THEN 'Medium'
        ELSE 'High'
    END AS Utilization_Level,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY
    CASE
        WHEN CAST(REPLACE(CreditUtilization, '%', '') AS INT) < 30 THEN 'Low'
        WHEN CAST(REPLACE(CreditUtilization, '%', '') AS INT) < 70 THEN 'Medium'
        ELSE 'High'
    END;

 ==========================================================
 7. Savings Group vs Average Risk Score


SELECT
    CASE
        WHEN SavingsAccountBalance < 10000 THEN 'Low Savings'
        WHEN SavingsAccountBalance < 50000 THEN 'Medium Savings'
        ELSE 'High Savings'
    END AS Savings_Group,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY
    CASE
        WHEN SavingsAccountBalance < 10000 THEN 'Low Savings'
        WHEN SavingsAccountBalance < 50000 THEN 'Medium Savings'
        ELSE 'High Savings'
    END;

 ==========================================================
 8. Loan Approval vs Average Credit Score

SELECT
    LoanApproved,
    AVG(CreditScore) AS Avg_CreditScore
FROM loan_data
GROUP BY LoanApproved;

 ==========================================================
  9. Income Group vs Average Risk Score

SELECT
    CASE
        WHEN AnnualIncome < 30000 THEN 'Low Income'
        WHEN AnnualIncome < 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    AVG(RiskScore) AS Avg_Risk_Score
FROM loan_data
GROUP BY
    CASE
        WHEN AnnualIncome < 30000 THEN 'Low Income'
        WHEN AnnualIncome < 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END;

  ==========================================================
  10. Debt-to-Income Ratio Impact on Risk Score


SELECT
    CASE
        WHEN CAST(REPLACE(DebtToIncome, '%', '') AS INT) < 20 THEN 'Low DTI'
        WHEN CAST(REPLACE(DebtToIncome, '%', '') AS INT) < 40 THEN 'Medium DTI'
        ELSE 'High DTI'
    END AS DTI_Group,
    AVG(RiskScore) AS Avg_Risk
FROM loan_data
GROUP BY
    CASE
        WHEN CAST(REPLACE(DebtToIncome, '%', '') AS INT) < 20 THEN 'Low DTI'
        WHEN CAST(REPLACE(DebtToIncome, '%', '') AS INT) < 40 THEN 'Medium DTI'
        ELSE 'High DTI'
    END;