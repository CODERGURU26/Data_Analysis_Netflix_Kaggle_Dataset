# Netflix Data Analysis Project

![Netflix Logo](netflix-logo.png)

## 📊 Project Overview

This project contains SQL queries for analyzing Netflix's content catalog. It explores various aspects of Netflix's movies and TV shows including content distribution, ratings, geographic trends, and content characteristics.

## 🗄️ Database Schema

The Netflix table contains the following columns:

- `show_id` - Unique identifier for each show/movie
- `type` - Content type (Movie or TV Show)
- `title` - Title of the content
- `director` - Director(s) of the content
- `castS` - Cast members
- `country` - Country/countries of production
- `date_added` - Date content was added to Netflix
- `release_year` - Year of release
- `rating` - Content rating (TV-MA, PG-13, etc.)
- `duration` - Duration (minutes for movies, seasons for TV shows)
- `listed_in` - Genres/categories
- `description` - Content description

## 🔍 Analysis Questions

### Q1: Movies vs TV Shows Distribution
Count and compare the number of movies versus TV shows in the catalog.

### Q2: Most Common Ratings
Identify the most frequently occurring rating for both movies and TV shows.

### Q3: Movies by Release Year
Filter and list all movies released in a specific year (e.g., 2020).

### Q4: Top 5 Countries
Determine which countries produce the most content available on Netflix.

### Q5: Longest Movie
Find the movie with the longest duration in the catalog.

### Q6: Recently Added Content
Retrieve content added to Netflix in the last 15 years.

### Q7: Content by Specific Director
List all movies and TV shows directed by a specific director (e.g., Rajiv Chilaka).

### Q8: TV Shows with Multiple Seasons
Find TV shows with more than 5 seasons.

### Q9: Content by Genre
Count the number of content items in each genre category.

### Q10: India Content Analysis
Analyze the yearly distribution of content produced in India.

### Q11: Documentary Films
List all movies categorized as documentaries.

### Q12: Actor Filmography
Track appearances of specific actors (e.g., Salman Khan) in recent years.

### Q13: Top Indian Actors
Identify the top 10 actors who have appeared in the most movies produced in India.

### Q14: Content Categorization
Categorize content as 'Adult' or 'Family' based on keywords in descriptions.

## 🛠️ Technologies Used

- **Database**: PostgreSQL
- **SQL Features**: 
  - Window Functions (RANK)
  - String Functions (STRING_TO_ARRAY, UNNEST)
  - Common Table Expressions (CTEs)
  - Aggregate Functions
  - Date/Time Functions

## 📝 Setup Instructions

1. Create the Netflix table using the schema provided in `Netflix_Table.sql`
2. Import your Netflix dataset into the table
3. Run the queries in `Netflix_Query.sql` to perform the analysis

## 💡 Key Insights

This analysis helps answer important business questions such as:
- Content strategy across different regions
- Popular content ratings and genres
- Production trends over time
- Key contributors (directors, actors) to the platform

## 📄 Files

- `Netflix_Table.sql` - Database schema and table creation
- `Netflix_Query.sql` - Analysis queries for business questions

## 🤝 Contributing

Feel free to fork this project and add your own analysis queries or improvements!

## 📧 Contact

For questions or suggestions, please open an issue in this repository.

---

**Note**: This is an educational project for SQL practice and data analysis learning purposes.
