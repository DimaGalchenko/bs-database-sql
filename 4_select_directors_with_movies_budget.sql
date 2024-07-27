SELECT d.id as "Director ID", CONCAT(d.first_name, ' ', d.last_name), SUM(m.budget) as "Average budget"
from persons d
         RIGHT JOIN movies m ON d.id = m.director_id
GROUP BY d.id, d.first_name, d.last_name;