SELECT * 
FROM international_debt;
-- What is the total amount of debt owed by all countries in the dataset?
select (SUM(debt)/1000000)::numeric(20,2) as  total_debt_in_millions
from dataanalytics.international_debt;


-- How many distinct countries are recorded in the dataset?
select COUNT(distinct country_name) as distict_countries
from dataanalytics.international_debt;


-- What are the distinct types of debt indicators, and what do they represent?
select distinct indicator_name, indicator_code
from dataanalytics.international_debt;

-- Which country has the highest total debt, and how much does it owe?
select country_name,(SUM(debt)/1000000)::numeric(20,2) as  total_debt
from dataanalytics.international_debt
group by country_name 
order by total_debt desc;

-- What is the average debt across different debt indicators?
select indicator_code,(avg(debt)/1000000)::numeric(20,2) as average_debt_millions
from dataanalytics.international_debt
group by indicator_code
order by average_debt_millions DESC;

-- Which country has made the highest amount of principal repayments?
select country_name,(SUM(debt)/1000000)::numeric(20,2) as  total_repayment
from dataanalytics.international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name 
order by total_repayment desc
limit 1;

select country_name, sum(debt) "Highest Principal Repayment",indicator_name, indicator_code
from dataanalytics.international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name ,indicator_name,indicator_code
order by 2 desc;


-- What is the most common debt indicator across all countries?
SELECT indicator_name, indicator_code,COUNT(*) AS indicator_count
FROM dataanalytics.international_debt
GROUP BY indicator_name,indicator_code
ORDER BY indicator_count DESC
LIMIT 1;






