-- Check for invalid claim submission dates

select COUNT(*) AS invalid_date_count
from claims_main
where claim_submission_date is not null
  and not pg_input_is_valid(claim_submission_date, 'date');


-- Converting date from text to date
ALTER table claims_main
	alter column claim_submission_date type DATE
	using claim_submission_date::DATE;

-- Date change verification
select column_name, data_type
from information_schema."columns" 
where table_name = 'claims_main'
and column_name = 'claim_submission_date';

-- Checking data for calculations
select column_name, data_type
from information_schema."columns"
where table_name = 'claims_main'
and column_name = 'claim_amount_usd'
