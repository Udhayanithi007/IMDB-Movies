# 🎬 IMDB Movies Database - SQL Analysis Project

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Database](https://img.shields.io/badge/Database-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

<img width="900" height="500" alt="image" src="https://github.com/user-attachments/assets/257051d3-0ceb-45d9-a95a-831c6cefee65" />


![Movies](https://img.shields.io/badge/Movies-47-blue)
![Directors](https://img.shields.io/badge/Directors-2,349-green)
![Revenue](https://img.shields.io/badge/Total_Revenue-$38.5B-gold)
![Status](https://img.shields.io/badge/Status-Complete-success)

## 📊 Project Overview

This project demonstrates SQL proficiency through comprehensive analysis of an IMDB movies database. The database contains **47 blockbuster movies** and **2,349 directors**, spanning from 1997 to 2016, with a combined box office revenue of **$38.5 billion**.

As a Data Analyst, I've written SQL queries to extract meaningful insights about movie performance, director statistics, revenue analysis, and voting patterns using advanced SQL techniques including JOINs, aggregations, filtering, and sorting.

## 🎯 Key Database Statistics

### 💰 Financial Performance

| Metric | Value |
|--------|-------|
| **Total Box Office Revenue** | $38.50 Billion |
| **Average Movie Budget** | $217.57 Million |
| **Highest Grossing Film** | Avatar ($2.79B) |
| **Average Revenue per Movie** | $819.25 Million |

### 🎬 Movies Dataset

| Attribute | Value |
|-----------|-------|
| **Total Movies** | 47 |
| **Time Period** | 1997 - 2016 |
| **Average Rating** | 6.57/10 |
| **Highest Rating** | 7.6/10 |
| **Total Votes** | 215,097 |
| **Average Votes per Movie** | 4,577 |

### 🎥 Directors Dataset

| Attribute | Value |
|-----------|-------|
| **Total Directors** | 2,349 |
| **Male Directors** | 1,574 (67.0%) |
| **Female Directors** | 150 (6.4%) |
| **Unknown/Other** | 625 (26.6%) |
| **Directors Starting with 'S'** | 173 |

## 🏆 Top Performers

### 💎 Highest Grossing Movies

| Rank | Movie Title | Revenue | Year |
|------|-------------|---------|------|
| 1 | **Avatar** | $2,787,965,087 | 2009 |
| 2 | **Titanic** | $1,845,034,188 | 1997 |
| 3 | **The Avengers** | $1,519,557,910 | 2012 |

### ⭐ Highest Rated Movies

| Rank | Movie Title | Rating | Votes |
|------|-------------|--------|-------|
| 1 | **The Dark Knight Rises** | 7.6/10 | 9,106 |
| 2 | **The Hobbit: The Desolation of Smaug** | 7.6/10 | 3,936 |
| 3 | **Toy Story 3** | 7.6/10 | 5,378 |

## 📁 Repository Contents

```
IMDB-Movies-SQL-Project/
│
├── IMDB_movies_project.sql        # SQL queries (13 analysis questions)
├── movies.json                    # Movies dataset (47 records)
├── directors.json                 # Directors dataset (2,349 records)
├── README.md                      # Project documentation
└── database_schema/               # Database design documentation
```

## 🗄️ Database Schema

### Movies Table

| Column | Type | Description |
|--------|------|-------------|
| `id` | INT | Primary key |
| `original_title` | VARCHAR | Movie title |
| `budget` | BIGINT | Production budget (USD) |
| `popularity` | INT | Popularity score |
| `release_date` | DATE | Release date |
| `revenue` | BIGINT | Box office revenue (USD) |
| `vote_average` | DECIMAL | Average rating (0-10) |
| `vote_count` | INT | Number of votes |
| `overview` | TEXT | Movie description |
| `tagline` | VARCHAR | Movie tagline |
| `director_id` | INT | Foreign key to directors |

### Directors Table

| Column | Type | Description |
|--------|------|-------------|
| `id` | INT | Primary key |
| `name` | VARCHAR | Director's name |
| `gender` | INT | Gender (0=Unknown, 1=Female, 2=Male) |
| `uid` | INT | Unique identifier |
| `department` | VARCHAR | Department (Directing) |

**Relationship**: `movies.director_id` → `directors.id` (Many-to-One)

## 📋 SQL Queries & Analysis

This project includes 13 comprehensive SQL queries covering:

### 1️⃣ **Basic Data Retrieval**
```sql
-- View all movies
SELECT * FROM movies;

-- View all directors
SELECT * FROM directors;

-- Count total movies
SELECT COUNT(*) as total_movies_IMDB FROM movies;
```

### 2️⃣ **Filtering & Pattern Matching**
```sql
-- Find specific directors (James Cameron, Luc Besson, John Woo)
SELECT * FROM directors 
WHERE name IN('James Cameron','Luc Besson','John Woo');

-- Directors with names starting with 'S'
SELECT * FROM directors 
WHERE name LIKE 's%';
```

### 3️⃣ **Gender Analysis**
```sql
-- Count female directors
SELECT COUNT(*) as total_female_count 
FROM directors 
WHERE gender = 1;

-- Get 10th female director
SELECT name FROM directors 
WHERE gender = 1 
ORDER BY id 
LIMIT 1 OFFSET 9;
```

### 4️⃣ **Popularity & Performance Analysis**
```sql
-- Top 3 most popular movies
SELECT original_title, popularity 
FROM movies 
ORDER BY popularity DESC 
LIMIT 3;

-- Top 3 highest revenue movies
SELECT original_title, revenue 
FROM movies 
ORDER BY revenue DESC 
LIMIT 3;
```

### 5️⃣ **Rating Analysis with Date Filters**
```sql
-- Highest rated movie since 2000
SELECT original_title, vote_average 
FROM movies 
WHERE release_date >= '2000-01-01' 
ORDER BY vote_average DESC 
LIMIT 1;
```

### 6️⃣ **JOIN Operations**
```sql
-- Movies directed by Brenda Chapman
SELECT m.original_title 
FROM movies AS m 
JOIN directors AS d ON m.director_id = d.id 
WHERE d.name = 'Brenda Chapman';
```

### 7️⃣ **Aggregation & GROUP BY**
```sql
-- Director with most movies
SELECT d.name, COUNT(m.id) as movie_count 
FROM directors AS d 
JOIN movies AS m ON m.director_id = d.id 
GROUP BY d.id, d.name 
ORDER BY movie_count DESC 
LIMIT 1;

-- Director with highest total revenue
SELECT d.name, SUM(m.revenue) as total_revenue 
FROM directors AS d 
JOIN movies AS m ON m.director_id = d.id 
GROUP BY d.id, d.name 
ORDER BY total_revenue DESC 
LIMIT 1;
```

## 🔍 Key Insights & Findings

### 💡 Business Insights

1. **Revenue Leaders**: James Cameron dominates with Avatar and Titanic generating $4.6B combined
2. **Quality vs. Popularity**: High ratings don't always correlate with high revenue
3. **Budget Efficiency**: Average budget of $217M generates $819M revenue (3.8x ROI)
4. **Gender Gap**: Only 6.4% female directors in the database, highlighting industry disparity
5. **Voting Patterns**: Movies with 4,577+ average votes indicate strong audience engagement
6. **Modern Dominance**: 98% of movies (46/47) are from 2000 onwards

### 📊 Statistical Findings

- **ROI Analysis**: Movies generate an average 376% return on investment
- **Rating Distribution**: Average rating of 6.57/10 suggests selective high-quality dataset
- **Popularity Metrics**: Maximum popularity score of 418 (exceptional engagement)
- **Director Productivity**: Most prolific directors have multiple blockbusters in portfolio

## 🚀 Getting Started

### Prerequisites
- MySQL Server 8.0+ or MariaDB 10.5+
- MySQL Workbench (optional, for GUI)
- Basic SQL knowledge

### Installation & Setup

1. **Clone the repository**:
```bash
git clone https://github.com/yourusername/imdb-movies-sql-project.git
cd imdb-movies-sql-project
```

2. **Create the database**:
```sql
CREATE DATABASE project_movie_database;
USE project_movie_database;
```

3. **Import the data**:
```bash
# Import movies data
mysql -u username -p project_movie_database < movies.json

# Import directors data
mysql -u username -p project_movie_database < directors.json
```

4. **Run the queries**:
```bash
# Execute all queries
mysql -u username -p project_movie_database < IMDB_movies_project.sql
```

### Alternative: Manual Import

```sql
-- Create movies table
CREATE TABLE movies (
    id INT PRIMARY KEY,
    original_title VARCHAR(255),
    budget BIGINT,
    popularity INT,
    release_date DATE,
    revenue BIGINT,
    title VARCHAR(255),
    vote_average DECIMAL(3,1),
    vote_count INT,
    overview TEXT,
    tagline VARCHAR(255),
    uid INT,
    director_id INT
);

-- Create directors table
CREATE TABLE directors (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    gender INT,
    uid INT,
    department VARCHAR(100)
);

-- Import JSON data using MySQL's JSON functions or external tools
```

## 🛠️ Technologies Used

- **Database**: MySQL 8.0
- **Query Language**: SQL
- **Data Format**: JSON
- **Tools**: MySQL Workbench, Command Line Interface
- **Version Control**: Git

## 🎓 SQL Skills Demonstrated

### Core Competencies
- ✅ **SELECT Statements** - Data retrieval and projection
- ✅ **WHERE Clauses** - Filtering with multiple conditions
- ✅ **Pattern Matching** - LIKE operator with wildcards
- ✅ **Sorting** - ORDER BY with ASC/DESC
- ✅ **Limiting Results** - LIMIT and OFFSET
- ✅ **Aggregation Functions** - COUNT, SUM, AVG
- ✅ **JOIN Operations** - INNER JOIN for relational queries
- ✅ **GROUP BY** - Data aggregation and grouping
- ✅ **Subqueries** - Nested SELECT statements
- ✅ **Date Filtering** - Working with DATE data types
- ✅ **Aliases** - Table and column aliasing
- ✅ **IN Operator** - Multiple value filtering

### Advanced Techniques
- Data normalization (separate movies and directors tables)
- Foreign key relationships
- Complex multi-table joins
- Aggregate analysis with grouping
- Date-based filtering and comparisons
- Performance optimization with proper indexing

## 📈 Query Performance Optimization

### Indexes Recommended
```sql
-- For faster lookups
CREATE INDEX idx_director_name ON directors(name);
CREATE INDEX idx_movie_director ON movies(director_id);
CREATE INDEX idx_release_date ON movies(release_date);
CREATE INDEX idx_revenue ON movies(revenue);
CREATE INDEX idx_popularity ON movies(popularity);
```

### Query Optimization Tips
1. Use `LIMIT` to restrict result sets
2. Index foreign keys for faster JOINs
3. Filter early with WHERE before aggregating
4. Use appropriate data types (INT vs BIGINT)
5. Avoid SELECT * in production queries

## 🔄 Future Enhancements

- [ ] Add genres table for multi-genre classification
- [ ] Include actors and cast information
- [ ] Add movie studios and production companies
- [ ] Implement stored procedures for complex queries
- [ ] Create views for frequently accessed data
- [ ] Add triggers for data validation
- [ ] Develop a web-based query interface
- [ ] Integrate with visualization tools (Tableau, Power BI)
- [ ] Add temporal analysis (decades, trends)
- [ ] Implement full-text search on overviews

## 📊 Sample Query Results

### Most Prolific Director
```
Name: [Director Name]
Movies Directed: [Count]
Total Revenue: $[Amount]
```

### Revenue by Director (Top 5)
```
1. James Cameron - $4,633,000,000+
2. [Director 2] - $[Amount]
3. [Director 3] - $[Amount]
...
```

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Add new analysis queries
- Optimize existing queries
- Expand the dataset
- Improve documentation
- Report bugs or issues

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💼 About the Analyst

**Data Analyst** | SQL & Database Analytics Specialist

- **GitHub**: [@Udhayanithi007](https://github.com/Udhayanithi007)
- **LinkedIn**: [Connect with me](https://www.linkedin.com/in/yourprofile)
- **Email**: nithiudhaya56@gmail.com

## 📧 Contact

For questions, collaboration, or consulting opportunities:
- Open an issue in this repository
- Email: nithiudhaya56@gmail.com
- LinkedIn: [Your Profile](https://linkedin.com/in/yourprofile)

## 🌟 Acknowledgments

- IMDB for movie data
- SQL community for best practices
- Open-source database tools
- Fellow data analysts and contributors

---

**⭐ If you find this SQL project useful, please give it a star!**

*Last Updated: February 2026*

## 📚 Additional Resources

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [SQL Tutorial](https://www.w3schools.com/sql/)
- [Database Normalization Guide](https://www.guru99.com/database-normalization.html)
- [SQL Performance Tuning](https://use-the-index-luke.com/)
