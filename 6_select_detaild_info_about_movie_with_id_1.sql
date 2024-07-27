WITH MovieDetails AS (
    SELECT
        m.id AS "ID",
        m.title AS "Title",
        m.release_date AS "Release date",
        m.duration AS "Duration",
        m.description AS "Description",
        json_build_object(
            'id', f.id,
            'file_name', f.file_name,
            'mime_type', f.mime_type,
            'key', f.key,
            'url', f.url
        ) AS "Poster",
        json_build_object(
            'id', p.id,
            'first_name', p.first_name,
            'last_name', p.last_name,
            'photo', json_build_object(
                'id', pf.id,
                'file_name', pf.file_name,
                'mime_type', pf.mime_type,
                'key', pf.key,
                'url', pf.url
            )
        ) AS "Director"
    FROM
        movies m
    LEFT JOIN
        files f ON m.poster_file_id = f.id
    JOIN
        persons p ON m.director_id = p.id
    LEFT JOIN
        files pf ON p.primary_photo_file_id = pf.id
    WHERE
        m.id = 1
),
Actors AS (
    SELECT
        c.movie_id,
        json_agg(
            json_build_object(
                'id', p.id,
                'first_name', p.first_name,
                'last_name', p.last_name,
                'photo', json_build_object(
                    'id', pf.id,
                    'file_name', pf.file_name,
                    'mime_type', pf.mime_type,
                    'key', pf.key,
                    'url', pf.url
                )
            )
        ) AS "Actors"
    FROM
        characters c
    JOIN
        persons p ON c.actor_id = p.id
    LEFT JOIN
        files pf ON p.primary_photo_file_id = pf.id
    WHERE
        c.movie_id = 1
    GROUP BY
        c.movie_id
),
Genres AS (
    SELECT
        mg.movie_id,
        json_agg(
            json_build_object(
                'id', g.id,
                'name', g.name
            )
        ) AS "Genres"
    FROM
        movies_genres mg
    JOIN
        genres g ON mg.genre_id = g.id
    WHERE
        mg.movie_id = 1
    GROUP BY
        mg.movie_id
)
SELECT
    md."ID",
    md."Title",
    md."Release date",
    md."Duration",
    md."Description",
    md."Poster",
    md."Director",
    a."Actors",
    g."Genres"
FROM
    MovieDetails md
LEFT JOIN
    Actors a ON md."ID" = a.movie_id
LEFT JOIN
    Genres g ON md."ID" = g.movie_id;
