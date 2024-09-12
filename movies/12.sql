WITH bradley_movies AS (
    select title, movie_id from movies
join stars on stars.movie_id = movies.id
join people on people.id = stars.person_id
where name = 'Bradley Cooper'),

jennifer_movies AS (
    select title, movie_id from movies
join stars on stars.movie_id = movies.id
join people on people.id = stars.person_id
where name = 'Jennifer Lawrence')

select bradley_movies.title from bradley_movies join jennifer_movies on bradley_movies.movie_id = jennifer_movies.movie_id;


