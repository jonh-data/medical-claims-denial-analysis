-- Calculate denial rate percentage
select COUNT(*) as total_claims,
		COUNT(CASE WHEN outcome = 'denied' THEN 1 END) as denied_claims,
		(COUNT(CASE WHEN outcome = 'denied' THEN 1 END) * 100.0 / COUNT(*)) as denial_rate_percentage
from claims_main;

-- Denial Rate by Payer Type
select payer_type,
		COUNT(*) as total_claims,
		COUNT(CASE WHEN outcome = 'denied' THEN 1 END) as denied_claims,
		ROUND((COUNT(CASE WHEN outcome = 'denied' THEN 1 END) * 100.0 / COUNT(*)), 2) as denial_rate_percentage
from claims_main
group by payer_type
order by denial_rate_percentage DESC;

-- Finding the top 10 codes by denial
select cpt_code, 
		COUNT(*) as denied_claims		
from claims_main
where outcome = 'denied'
group by cpt_code 
order by denied_claims desc
limit 10;

-- Calculating denial rate by procedure code
select cpt_code, COUNT(*) as total_claims,
		COUNT(CASE WHEN outcome = 'denied' THEN 1 END) as denied_claims,
		ROUND((COUNT(CASE WHEN outcome = 'denied' THEN 1 END) * 100.0 / COUNT(*)), 2) as denial_rate_percentage
from claims_main
group by cpt_code
order by denial_rate_percentage desc
limit 10;

-- Calculating total billed amount from denied claims
select sum(claim_amount_usd::NUMERIC) as denied_claims_billed_amount
from claims_main
where outcome = 'denied';

-- Denied billed amount by payer type
select payer_type, sum(claim_amount_usd::NUMERIC) as denied_billed_amount_by_payer_type
from claims_main
where outcome = 'denied'
group by payer_type
order by denied_billed_amount_by_payer_type DESC;


-- Last two queries gave different totals used this SQL to find out why
-- possibly because the column was imported in as dataype: REAL
-- switching queries to ::NUMERIC
SELECT
    SUM(claim_amount_usd) AS original_total,
    SUM(claim_amount_usd::NUMERIC) AS numeric_total
FROM claims_main
WHERE outcome = 'denied';

