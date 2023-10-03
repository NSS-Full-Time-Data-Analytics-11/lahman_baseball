WITH top_gold_winter AS (SELECT country, SUM(gold) AS total_gold
							FROM winter_games INNER JOIN countries ON country_id = id
							WHERE gold IS NOT NULL
							GROUP BY country
							ORDER BY total_gold DESC
							LIMIT 5)
							
SELECT *
FROM top_gold_winter
WHERE total_gold >= 5;


WITH tall_athletes AS (SELECT *
						FROM athletes
						WHERE height > (SELECT AVG(height) FROM athletes))
						
SELECT *
FROM tall_athletes
WHERE gender = 'F' AND age > 30;


WITH tall_over30_female_athletes AS (SELECT *
									 FROM athletes
									 WHERE height > (SELECT AVG(height) FROM athletes) 
									 AND gender = 'F' AND age > 30)
									 
SELECT AVG(weight)
FROM tall_over30_female_athletes;