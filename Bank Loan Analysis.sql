CREATE DATABASE bank_loan_project;
USE bank_loan_project;
SELECT * FROM loan_data LIMIT 10;

 # Total Applicants
 SELECT COUNT(*) AS total_applicants FROM loan_data;
 
 #  1. Compare Approved Vs Rejected Loans
 SELECT loan_status, 
COUNT(*) AS total FROM loan_data
GROUP BY loan_status;

# 2. Identify the Most common loan purpose
SELECT loan_intent,
COUNT(*) AS total FROM loan_data
GROUP BY loan_intent
ORDER BY total DESC ;

# 3. Which Education group gets the most approvals ?
SELECT person_education, 
loan_status, COUNT(*) AS total FROM loan_data
GROUP BY person_education, loan_status
ORDER BY total DESC
LIMIT 1;

# 4. Do higher credit scores lead to more approvals ? 
SELECT loan_status,
ROUND(avg(credit_score),2) AS avg_credit_score FROM loan_data
GROUP BY loan_status;

# 5. Are people with mortage more likely to get loans ?
SELECT person_home_ownership,
loan_status,COUNT(*) AS total
FROM loan_data
GROUP BY person_home_ownership, loan_status
ORDER BY total DESC
limit 1;

# 6. Top 5 highest income Applicants
SELECT person_income,
person_education,
credit_score
FROM loan_data
ORDER BY person_income DESC
LIMIT 5;

# 7. How Age group affect approval ?
SELECT
CASE 
	WHEN person_age <=25 THEN 'Young'
    WHEN person_age BETWEEN 26 AND 35 THEN 'Adult'
	WHEN person_age BETWEEN 36 AND 55 THEN 'Senior'
	ELSE 'Old'
END AS Age_category,
loan_status, COUNT(*) AS total_loans FROM loan_data
GROUP BY Age_category, loan_status
ORDER BY Age_category, total_loans DESC;



 