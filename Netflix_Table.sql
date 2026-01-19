--Advanced SQL Project -- Netflix
DROP TABLE IF EXISTS Netflix;
CREATE TABLE Netflix(
	show_id	VARCHAR(10),
	type	VARCHAR(55),
	title	VARCHAR(255),
	director	VARCHAR(255),
	castS TEXT,
	country	VARCHAR(255),
	date_added	DATE,
	release_year INT,
	rating	VARCHAR(15),
	duration VARCHAR(55),
	listed_in TEXT,	
	description TEXT
);

--EDA(Exploratory Data Analysis)

SELECT * FROM Netflix;

SELECT COUNT(*) FROM Netflix;

SELECT DISTINCT type FROM Netflix;

SELECT DISTINCT title FROM Netflix;

SELECT DISTINCT director FROM Netflix;

DELETE FROM Netflix 
WHERE director IS  NULL;

SELECT DISTINCT castS FROM Netflix;

SELECT DISTINCT country FROM Netflix;


