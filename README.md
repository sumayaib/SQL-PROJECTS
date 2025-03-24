# SQL-PROJECT
# International Debt Analysis Using SQL 
This project analyzes international debt data collected by the World Bank, focusing on the total debt (in USD) owed by developing countries across various debt categories from 1970 to 2015. The goal is to extract meaningful financial insights using SQL queries in PostgreSQL and visualize the findings.

# Key Objectives
* Explore the international debt dataset to understand debt trends and patterns.
* Answer key financial questions using SQL queries.

# Project Tasks 
1. What is the total amount of debt owed by all countries in the dataset?
* The total amount of debt owed by all countries is $3,079,735.08 million (USD).The amount was calculated by summing the debt and rounding to two decimal places.
* The query;
```
select (SUM(debt)/1000000)::numeric(20,2) as  total_debt_in_millions
from dataanalytics.international_debt;
```

2. How many distinct countries are recorded in the dataset?
* This is to identify the number of unique countries represented in the data.
* The query returned 124 unique countries;
```
select COUNT(distinct country_name) as distict_countries
from dataanalytics.international_debt;
```

3. What are the distinct types of debt indicators, and what do they represent?
* The query used categorized the types of debt in the dataset and what each indicator measures.
```
select distinct indicator_name, indicator_code
from dataanalytics.international_debt;
```

4. Which country has the highest total debt, and how much does it owe?
* The aim is to know the most indebted country which is China with a total debt of $285,793.52 million(USD).
* The query used;
```
select country_name,(SUM(debt)/1000000)::numeric(20,2) as  total_debt
from dataanalytics.international_debt
group by country_name 
order by total_debt desc
limit 1;
```

5. What is the average debt across different debt indicators?
* The aim was to identify which debt indicators have high or low averages compared to the global average.
* Among all debt indicators, external debt stocks (DT.AMT.DLXF.CD) has the highest average debt 5,904.87 million USD, while interest on bilateral debt (DT.INT.PROP.CD) has the lowest 34.25 million USD.
```
select indicator_code,(avg(debt)/1000000)::numeric(20,2) as average_debt_millions
from dataanalytics.international_debt
group by indicator_code
order by average_debt_millions DESC;
```

6. Which country has made the highest amount of principal repayments?
* The main purpose was to identify the country that is actively repaying debts which may indicate a strong fiscal discipline.
* The country in discussion is China with a repayment amount of $96,218.62 million(USD).
* The query;
```
select country_name,(SUM(debt)/1000000)::numeric(20,2) as  total_repayment
from dataanalytics.international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name 
order by total_repayment desc
limit 1;
```

7. What is the most common debt indicator across all countries?
* The most common debt indicator is DT.INT.MLAT.CD, which shows that it is mostly used.
* The query used;
```
SELECT indicator_name, indicator_code,COUNT(*) AS indicator_count
FROM dataanalytics.international_debt
GROUP BY indicator_name,indicator_code
ORDER BY indicator_count DESC
LIMIT 1;
```

# Key Insights
1.	Global Debt Burden: The total debt across all countries amounted to $3,079,735.08 million (USD), highlighting the scale of financial dependence.
  
2.	Debt Composition: The most common debt indicator was DT.INT.MLAT.CD, suggesting widespread reliance on multilateral loans.

3.	Repayment Insights: China led in $96,218.62 million(USD) principal repayments, reflecting active debt management.

# Conclusion
* This project revealed that countries owe a combined debt of $3,079,735.08 million (USD).China bears the highest burden ($285,793.52 million USD) but also has a high amount of principal repayment suggesting an aggressive debt management.
* Most debt came from multilateral loans like the IMF which offer better terms but still strain budgets.
* The key insights show the need for targeted financial interventions and deeper temporal analysis.

