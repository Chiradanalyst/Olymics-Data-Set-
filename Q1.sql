/* In this Query, I wanted to rank the countries with the largest GDP in 2016
	
	- I joined the country & country_stats tables to get the data that I need
	- I used A window function to obtain the rank 
	- and removed all nulls */

SELECT  Rank() OVER( order by gdp desc) as "GDP_Ranked",
country,
region,
year,
country_id,
gdp,
pop_in_millions,
Nobel_prize_winners
FROM countries
LEFT JOIN country_stats
ON countries.id = country_stats.country_id
WHERE gdp IS NOT NULL
and Year = '2016-01-01';
