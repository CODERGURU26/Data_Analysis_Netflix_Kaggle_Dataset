# 🎬 Netflix Content Analysis SQL Project

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Status](https://img.shields.io/badge/Status-Complete-success)
![Netflix](https://img.shields.io/badge/Platform-Netflix-red)

A comprehensive SQL project analyzing Netflix's content catalog to uncover insights about movies, TV shows, ratings, and global content distribution through advanced querying techniques.

---

## 📑 Table of Contents

- [Project Overview](#-project-overview)
- [Database Schema](#-database-schema)
- [Project Structure](#-project-structure)
- [Installation & Setup](#-installation--setup)
- [Data Analysis](#-data-analysis)
- [Key Business Questions](#-key-business-questions)
- [Technologies Used](#-technologies-used)
- [SQL Concepts Covered](#-sql-concepts-covered)
- [Results & Insights](#-results--insights)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

---

## 🎯 Project Overview

This project demonstrates end-to-end SQL data analysis on Netflix's content dataset. It showcases skills in:

- Database design and table creation
- Data cleaning and quality assurance
- Exploratory data analysis (EDA)
- Writing complex SQL queries to solve business problems
- Deriving actionable insights from streaming content data

The analysis answers 14 critical business questions that help understand content distribution, viewer ratings, geographic trends, and content categorization strategies.

---

## 🗄️ Database Schema

### Table: `netflix`

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| `show_id` | VARCHAR(10) | Primary key, unique identifier for each show/movie |
| `type` | VARCHAR(55) | Content type (Movie or TV Show) |
| `title` | VARCHAR(255) | Title of the content |
| `director` | VARCHAR(255) | Director(s) of the content |
| `castS` | TEXT | Cast members (comma-separated) |
| `country` | VARCHAR(255) | Country/countries of production |
| `date_added` | DATE | Date content was added to Netflix |
| `release_year` | INT | Year of original release |
| `rating` | VARCHAR(15) | Content rating (TV-MA, PG-13, etc.) |
| `duration` | VARCHAR(55) | Duration (minutes for movies, seasons for TV shows) |
| `listed_in` | TEXT | Genres/categories (comma-separated) |
| `description` | TEXT | Brief description of the content |

---

## 📂 Project Structure

```
netflix-content-analysis/
│
├── Netflix_Table.sql             # Database schema and table creation
├── Netflix_Query.sql             # Main SQL file with all analysis queries
├── README.md                     # Project documentation
├── data/                         # Sample data files (if applicable)
└── results/                      # Query results and visualizations (optional)
```

---

## 🚀 Installation & Setup

### Prerequisites

- PostgreSQL 12+ (or any SQL database)
- pgAdmin, DBeaver, or any SQL client
- Basic understanding of SQL

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/netflix-content-analysis.git
   cd netflix-content-analysis
   ```

2. **Create the database**
   ```sql
   CREATE DATABASE netflix_db;
   ```

3. **Execute the table creation script**
   ```bash
   psql -U your_username -d netflix_db -f Netflix_Table.sql
   ```

4. **Load your data** (if you have a CSV file)
   ```sql
   COPY netflix FROM '/path/to/netflix_data.csv' 
   DELIMITER ',' CSV HEADER;
   ```

5. **Run analysis queries**
   ```bash
   psql -U your_username -d netflix_db -f Netflix_Query.sql
   ```

---

## 🔍 Data Analysis

### Phase 1: Data Cleaning

- Identified and removed records with NULL values in critical fields
- Deleted entries where director information was missing
- Ensured data integrity across all columns
- Validated data types and formats

### Phase 2: Data Exploration (EDA)

- **Total Content Count**: Analyzed overall catalog size
- **Content Types**: Identified distribution of Movies vs TV Shows
- **Unique Titles**: Verified content uniqueness
- **Directors & Cast**: Explored contributor database
- **Geographic Distribution**: Analyzed country-wise content availability

### Phase 3: Business Intelligence

Answered 14 strategic business questions using advanced SQL queries (see below)

---

## 💼 Key Business Questions

### Q1: Content Distribution Analysis
Count the number of Movies vs TV Shows in the Netflix catalog

### Q2: Rating Popularity
Find the most common rating for Movies and TV Shows separately

### Q3: Year-Specific Releases
List all movies released in a specific year (e.g., 2020)

### Q4: Geographic Content Leaders
Identify the top 5 countries with the most content on Netflix

**Sample Query:**
```sql
SELECT 
    UNNEST(STRING_TO_ARRAY(country, ',')) AS country, 
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

### Q5: Duration Analysis
Identify the longest movie in the catalog

### Q6: Recent Additions
Find content added in the last 5 years

### Q7: Director Filmography
Find all movies/TV shows by a specific director (e.g., 'Rajiv Chilaka')

### Q8: Long-Running Series
List all TV shows with more than 5 seasons

### Q9: Genre Distribution
Count the number of content items in each genre

### Q10: India Content Trends
Analyze yearly distribution and average release rate of Indian content

### Q11: Documentary Collection
List all movies categorized as Documentaries

### Q12: Actor Tracking
Find movies featuring specific actors (e.g., Salman Khan) in the last 10 years

### Q13: Top Indian Actors
Identify the top 10 actors with the most appearances in Indian productions

### Q14: Content Categorization
Categorize content as 'Adult' or 'Family' based on keywords ('Kill', 'Violence') in descriptions

**Sample Query:**
```sql
WITH content_table AS (
    SELECT  
        title,
        description,
        CASE 
            WHEN description ILIKE '%kill%' 
                OR description ILIKE '%Violence%' 
            THEN 'Adult_film' 
            ELSE 'Family_film' 
        END AS content
    FROM netflix
)
SELECT 
    content,
    COUNT(*) AS total_content
FROM content_table
GROUP BY 1;
```

---

## 🛠️ Technologies Used

- **Database**: PostgreSQL
- **Language**: SQL
- **Tools**: pgAdmin / DBeaver
- **Concepts**: DDL, DML, Aggregations, Window Functions, CTEs, String Functions

---

## 📚 SQL Concepts Covered

- ✅ Database and table creation (DDL)
- ✅ Data insertion and deletion (DML)
- ✅ SELECT queries with complex filtering (WHERE, LIKE, ILIKE)
- ✅ Aggregate functions (COUNT, MAX, AVG)
- ✅ GROUP BY and ORDER BY clauses
- ✅ Window functions (RANK, PARTITION BY)
- ✅ Common Table Expressions (CTEs)
- ✅ CASE statements for conditional logic
- ✅ String manipulation (STRING_TO_ARRAY, UNNEST)
- ✅ Date/Time functions (CURRENT_DATE, INTERVAL, EXTRACT)
- ✅ Subqueries and nested queries
- ✅ Type casting (::numeric)
- ✅ LIMIT for result set restriction
- ✅ Handling comma-separated values in columns

---

## 📊 Results & Insights

This analysis provides valuable insights into:

- 🎭 **Content Strategy**: Distribution patterns between movies and TV shows
- 🌍 **Global Reach**: Geographic content production trends
- ⭐ **Rating Patterns**: Content rating preferences across categories
- 📺 **Long-form Content**: Analysis of multi-season TV shows
- 🎬 **Industry Players**: Top directors and actors in Netflix's catalog
- 👨‍👩‍👧‍👦 **Audience Segmentation**: Family-friendly vs adult content distribution
- 📅 **Temporal Trends**: Content addition and release patterns over time

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/NewAnalysis`)
3. Commit your changes (`git commit -m 'Add new query analysis'`)
4. Push to the branch (`git push origin feature/NewAnalysis`)
5. Open a Pull Request

### Ideas for Contribution
- Add data visualization scripts
- Optimize existing queries
- Add more business questions
- Create dashboard integration
- Add performance benchmarking

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Your Name**

- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)
- Project Link: [Netflix Content Analysis](https://github.com/yourusername/netflix-content-analysis)

---

## 🌟 Acknowledgments

- Dataset inspired by Netflix's public catalog information
- Built as a portfolio project to demonstrate advanced SQL proficiency
- Special thanks to the SQL community for best practices
- Open for feedback and improvements

---

## 📞 Contact

For questions, suggestions, or collaboration opportunities:
- 📧 Email: your.email@example.com
- 💬 Open an issue in this repository

---

⭐ **If you found this project helpful, please consider giving it a star!** ⭐

---

**Happy Analyzing! 🎬📊✨**
