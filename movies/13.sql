select name from people join stars on people.id = stars.person_id join movies on stars.movie_id = movies.id
where movies.id IN (
select movies.id from movies join stars on movies.id = stars.movie_id join people on stars.person_id = people.id
where people.name = 'Kevin Bacon' and people.birth = 1958) and name != 'Kevin Bacon';

