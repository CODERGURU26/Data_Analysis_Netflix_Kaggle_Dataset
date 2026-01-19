--Netflix Business Problems 

--Q1. Count the Number of Movies vs TV Shows
SELECT 
	type,
	COUNT(*)
FROM Netflix
GROUP BY 1;

--Q2. Find the Most Common Rating for Movies and TV Shows
SELECT 
	type, 
	rating
FROM
(
SELECT 
	type,
	rating,
	COUNT(*),
	RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM Netflix
GROUP BY 1 , 2 
)
WHERE ranking  = 1;

--Q3. List All Movies Released in a Specific Year (e.g., 2020)
SELECT title , release_year
FROM Netflix
WHERE 
	type = 'Movie' 
	AND
	release_year = 2020;

--Q4. Find the Top 5 Countries with the Most Content on Netflix
SELECT 
	UNNEST(STRING_TO_ARRAY(country , ',')) AS country, 
	COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--Q5. Identify the Longest Movie
SELECT 
	title,
	duration
FROM Netflix
WHERE 
	type = 'Movie'
	AND
	duration = (SELECT MAX(duration) FROM netflix)

--Q6.  Find Content Added in the Last 15 Years
SELECT 
	title AS content,
	date_added
FROM netflix
WHERE date_added >= CURRENT_DATE - INTERVAL '5 Years';

--Q7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'
SELECT 
	title , 
	type ,
	UNNEST(STRING_TO_ARRAY(director ,','))
FROM Netflix
WHERE director = 'Rajiv Chilaka';

--Q8. List All TV Shows with More Than 5 Seasons
SELECT 
	title ,
	type ,
	duration
FROM Netflix
WHERE 
	type = 'TV Show'
	AND 
	duration >= '5 Season';

--Q9. Count the Number of Content Items in Each Genre

SELECT
	UNNEST(STRING_TO_ARRAY(listed_in , ',')) AS genre,
	COUNT(show_id) AS number_of_content
FROM Netflix
GROUP BY 1
ORDER BY 2 DESC;

--Q10. Find each year and the average numbers of content release in India on netflix.
SELECT 
	UNNEST(STRING_TO_ARRAY(country , ',')),
	release_year,
	COUNT(*)::numeric/(SELECT COUNT(*) FROM Netflix WHERE country = 'India')::numeric * 100 AS avg_number_of_contents
FROM Netflix
WHERE country = 'India'
GROUP BY 1 , 2
ORDER BY 3 DESC;

--Q11. List All Movies that are Documentaries
SELECT 
	title ,
	UNNEST(STRING_TO_ARRAY(listed_in , ',')) AS Genre 
FROM Netflix
WHERE listed_in LIKE 'Documentaries'

--Q12. Find How Many Movies Actor 'Salman Khan' Appeared in the Last 10 Years
SELECT 
	title,
	release_year,
	castS
FROM Netflix
WHERE 
	castS LIKE'%Salman Khan%'
	AND 
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;

--Q14. Find the Top 10 Actors Who Have Appeared in the Highest Number of Movies Produced in India
SELECT 
	UNNEST(STRING_TO_ARRAY(castS , ',')) AS Actors,
	COUNT(*) AS movies_produced
	FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
 /*
Q14. Categorize Content Based on the Presence of 'Kill' and 'Violence' Keywords in 
the description field .
Label content containing these keywords as 'Adult' and all other content as 'Family'
Count How many items fall into each category.
*/
WITH content_table
AS
(
SELECT  
	title,
	description,
	CASE 
	WHEN 
	description ILIKE '%kill%' 
	OR description 
	ILIKE '%Violence%' 
	THEN 'Adult_film' 
	ELSE 'Family_film' 
	END content
FROM NETFLIX
)
SELECT 
	content,
	COUNT(*) AS total_content
FROM content_table
GROUP BY 1;



