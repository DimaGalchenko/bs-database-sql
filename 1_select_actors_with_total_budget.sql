SELECT p.id as "ID", p.first_name AS "First name", p.last_name AS "Last name", sum(m.budget) AS "Total movies budget"
FROM persons p
         INNER JOIN characters c ON p.id = c.actor_id
         INNER JOIN movies m ON m.id = c.movie_id
GROUP BY p.id, p.first_name, p.last_name