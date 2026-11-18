# medical-claims-denial-analysis
Medical claims denial and payer performance using SQL and PowerBI

## Project Overview
This medical claims analysis project solves the relationship between denied claims and payer type as well as the financial exposure associated with denied claims. 
I used SQL and PowerBI to compare denial rates, denied billed amounts, and identified the trend over time across insurers. 
This would help healthcare organizations identify different areas that may need further investigation and help to improve claims management.

## Dataset
This project uses the DenialIQ: 120K Medical Claims dataset by nudratabbas on Kaggle.
This dataset has 120,000 synthetic medical insurance claims from January 2021 through June 2024.

Three tables are used in this analysis:
- claims_main: which contains claims information such as payer type, procedure code, claim amount, claims submission date, and claim outcome.
- denial_labels: which contains additional information regarding denied claims.
- payer_rules: which contain payer rules regarding procedure codes. 

Synthetic data was used to demonstrate healthcare claims analysis without exposing actual patient information. These findings are not representative of a real healthcare organization. 

## SQL Use
SQL was used to validate, clean, and analyze medical claims dataset in PostgreSQL.

###Data Validation Process
- Checked data for duplicates and missing IDS
- Checked for zero, negative, and missing claim amounts
- Validated claims amount and count
- Checked the relationships between claims main and denial labels tables.
- Checked for submission date accuracy

###Data Cleaning Process
- Submission date was converted from test to DATE data type.

###Data Analysis Process
- Compared denial rates across payer types and calculated overall denial rate percentage.
- Identified the top 10 codes by denial and calculated denial rate by procedure codes.
- Calculated total denied billed amounts and identified denied billed amount by payer type
