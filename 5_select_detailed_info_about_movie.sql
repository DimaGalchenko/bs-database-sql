SELECT m.id           AS "ID",
       m.title        AS "Title",
       m.release_date AS "Release date",
       m.duration     AS "Duration",
       m.description  AS "Description",
       json_build_object(
               'id', f.id,
               'file_name', f.file_name,
               'mime_type', f.mime_type,
               'key', f.key,
               'url', f.url
       )              AS "Poster",
       json_build_object(
               'id', p.id,
               'first_name', p.first_name,
               'last_name', p.last_name
       )              AS "Director"
FROM movies m
         JOIN
     countries c ON m.country_id = c.id
         JOIN
     movies_genres mg ON m.id = mg.movie_id
         JOIN
     genres g ON mg.genre_id = g.id
         JOIN
     persons p ON m.director_id = p.id
         LEFT JOIN
     files f ON m.poster_file_id = f.id
WHERE c.id = 1
  AND m.release_date >= '2022-01-01'
  AND m.duration > 135
  AND (g.name = 'Action' OR g.name = 'Drama')
GROUP BY m.id;
