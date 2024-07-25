SELECT m.id as "ID", m.title as "Title", count(c.id) as "Actors count"
from movies m
         JOIN characters c on m.id = c.movie_id
WHERE extract(YEAR  from current_date) - extract(YEAR from m.release_date) <= 5
GROUP BY m.id
