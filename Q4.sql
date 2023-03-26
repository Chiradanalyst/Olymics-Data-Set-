/*
What countrys competed in the winter games and won more than 5 gold medals?
*/
WITH top_five_gold_medals AS(
Select Rank() OVER( order by SUM(GOLD) desc) as "Rank_Gold_Medals",
	countries.country, 
	SUM(gold) AS "Total_Gold_Medals"
FROM winter_games
LEFT JOIN countries
ON winter_games.country_id = countries.id
WHERE gold IS NOT null
GROUP BY countries.country
ORDER BY SUM(gold) DESC
LIMIT 5)

SELECT "Rank_Gold_Medals" ,country, "Total_Gold_Medals"
FROM top_five_gold_medals
WHERE "Total_Gold_Medals" >= 5