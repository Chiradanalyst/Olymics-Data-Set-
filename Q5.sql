/*I am creating a list of all countries whose population decreased from 2001 to 2006*/
/* 
1. Created CTE's with 2001 & 2006 Population data
2. Joined on countries column to add in country name
3. selected only countries that decreased in population using a where clause*/


WITH one AS(
SELECT country_id,
	pop_in_millions AS "one_population"
FROM country_stats
WHERE YEAR = '2000-01-01'
),
six AS (
SELECT country_id,
	pop_in_millions AS "six_population"
FROM country_stats
WHERE YEAR = '2006-01-01'
)
SELECT countries, 
	one_population, 
	six_population
FROM countries
LEFT JOIN one
ON countries.id = one.country_id
LEFT JOIN six
ON countries.id = six.country_id
WHERE one_population > six_population

