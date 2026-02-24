use project_movie_database;

--  ques 1 --

select * 
from movies;

-- ques 2 --
select *
from directors;

-- ques 3 --
select count(*) as total_movies_IMDB
from movies;

-- ques 4 --
select *
from directors
where name IN('James Cameron','Luc Besson','John Woo');

-- ques 5 --
select *
from directors
where name like 's%';

-- ques 6 --
select count(*) as total_female_count
from directors
where gender = 1;

-- ques 7 --
select name
from directors
where gender = 1
order by id 
limit 1 offset 9;

-- ques 8 --
select original_title,popularity
from movies
order by popularity desc
limit 3;

-- ques 9 --
select original_title , revenue
from movies
order by revenue desc
limit 3;

-- ques 10 --
select original_title,vote_average
from movies
where release_date >= '2000-01-01'
order by vote_average desc
limit 1;

-- ques 11 --
select m.original_title
from movies as m
join directors as d 
on m.director_id = d.id
where d.name ='Brenda Chapman';

-- ques 12 --
select d.name,count(m.id) as movie_count
from directors as d 
join movies as m
on m.director_id = d.id
group by d.id , d.name
order by movie_count desc
limit 1;

-- ques 13 --
select d.name,SUM(m.revenue) as total_revenue
from directors as d 
join movies as m
on m.director_id = d.id
group by d.id , d.name
order by total_revenue desc
limit 1;
