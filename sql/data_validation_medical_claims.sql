-- Record check for claims_main table
select COUNT(*) as claims_records_count
from claims_main;

-- Record check for denail_labels table
select COUNT(*) as denial_records_count
from denial_labels;

-- Record check for payer_rules table
select COUNT(*) as payer_rules_records_count
from payer_rules;

-- Claims duplicate check
select COUNT(*), claim_id
from claims_main
group by claim_id
having COUNT(claim_id) > 1;

-- Checking missing claim ids 
select COUNT(*) as missing_claim_id_count
from claims_main
where claim_id is null;

--Checking missing claim amount
select COUNT(*) as missing_claim_amount_count
from claims_main
where claim_amount_usd is null;

-- Check claim amount values for zero or less
select COUNT(*) as invalid_claim_amount_count
from claims_main
where claim_amount_usd <= 0;

-- Claim status check and number of claims
select COUNT(*) as claim_count, outcome
from claims_main
group by outcome;

-- Checking matching records between claims_main and denial_labels
select COUNT(cm.claim_id) as records_count
from claims_main as cm
inner join denial_labels as dl on cm.claim_id = dl.claim_id;

-- Claims submission date check
select MIN(claim_submission_date) as earliest_submission_date, MAX(claim_submission_date) as latest_sumbission_date
from claims_main;




















