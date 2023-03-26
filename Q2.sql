/*How many events did each country compete in across both summer and
winter games (just use country_id, not country name).*/

/*What I did was create a CTE to Capture Total events played by each country then joined
that data with the country names*/

WITH total_events as (SELECT summer_games.country_id,
	(Count(DISTINCT(summer_games.event)) +
	Count(DISTINCT(winter_games.event)) ) as events
FROM summer_games
LEFT JOIN winter_games
ON summer_games.country_id = winter_games.country_id
GROUP BY summer_games.country_id
)
SELECT countries.country, 
	total_events.events AS "Total_Events_Winter_and_Summer_Games"
FROM countries
LEFT JOIN total_events
ON countries.id = total_events.country_id
ORDER BY total_events.events DESC