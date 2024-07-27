SELECT u.id as "ID", u.username as "Username", array_agg(m.id)
From users u
         LEFT JOIN favorite_movies fm ON u.id = fm.user_id
         LEFT JOIN movies m ON u.id = m.id
GROUP BY u.id, u.username;
