import pandas as pd
df =pd.read_csv('loan_data.csv')

print("Rows and Columns : ")
print(df.shape)

print("\n Dataset Information : ")
print(df.head())

# Checking Missing Values

print("\n Missing Values : ")
print(df.isnull().sum())

# Checks Duplicate Rows

print("\n Duplicate Rows : ")
print(df.duplicated().sum())            # if exist : df.drop_duplicates(inplcae=True)

# Loan Status

print(df['loan_status'].value_counts())

# Education Distribution

print(df['person_education'].value_counts())

# Loan Intent Analysis

print(df['loan_intent'].value_counts())

# Credit Score Analysis

print("Average Credit Score : ")
print(df['credit_score'].mean())

# Income Analysis

print("Average Income : ")
print(df['person_income'].mean())

# Approval by Gender

print(pd.crosstab(
    df['person_gender'],
    df['loan_status']))

# Approval by Education

print(pd.crosstab(
    df['person_education'],
    df['loan_status']))

# Approval by Previous Defaults

print(pd.crosstab(
    df['previous_loan_defaults_on_file'],
    df['loan_status']))

# Save cleaned Data

df.to_csv(
    "cleaned_bank_loan.csv",
    index=False
)
print("Cleaned file saved")


