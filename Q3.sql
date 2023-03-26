/* 

PT1

I wanted to find all Female players over the age of 30 are taller 
than the Average height
	- Created a CTE to query all of the data I will need
		- This includes a CTE with the average height of all female players
	-Finally I ran my main query to filter my data for players that are
	taller than the Average height
	- Also filtered for players that are over 30 years old
PT2

I want to query only the females that are over the average weight
	- I just repeated the same steps to get the average height and
	replicated the process for weight
	- this showed 36 Female players over the age of 30 that are
	taller and heavier than average
*/

With player_height AS(
Select id, height, 
	AVG(height) OVER() AS average_height,
	gender,
	age,
	weight
FROM athletes
Where gender = 'F'),

tall_females AS (SELECT id, height, 
round(average_height) AS Average_Height,
gender,
age,
weight,
AVG(weight) OVER() as average_weight
FROM player_height
WHERE height > average_height
AND age > 30
ORDER BY height DESC)

SELECT id, weight, round(average_weight) as average_weight
FROM tall_females
where weight > average_weight
order by weight desc