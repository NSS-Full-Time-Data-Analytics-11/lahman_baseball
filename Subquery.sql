SELECT AVG(value)
FROM unemployment;


SELECT county, COUNT(period) AS total_months
FROM unemployment
WHERE value > (SELECT AVG(value) FROM unemployment)
GROUP BY county
ORDER BY total_months DESC;


SELECT company, MAX(capital_investment)
FROM ecd
GROUP BY company;


SELECT county, AVG(new_jobs)
FROM (SELECT company, MAX(capital_investment) AS max_cap
	  FROM ecd
	  GROUP BY company) AS max_cap INNER JOIN ecd ON max_cap.company = ecd.company AND max_cap.max_cap = ecd.capital_investment
GROUP BY county;