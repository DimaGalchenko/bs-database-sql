CREATE TABLE users
(
    id             SERIAL PRIMARY KEY,
    username       VARCHAR(50) UNIQUE  NOT NULL,
    first_name     VARCHAR(50)         NOT NULL,
    last_name      VARCHAR(50)         NOT NULL,
    email          VARCHAR(320) UNIQUE NOT NULL,
    password       VARCHAR(128)        NOT NULL,
    avatar_file_id INTEGER
);

CREATE TABLE files
(
    id        SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(50)  NOT NULL,
    key       VARCHAR(255) NOT NULL UNIQUE,
    url       VARCHAR(255) NOT NULL
);

ALTER TABLE users
    ADD FOREIGN KEY (avatar_file_id) REFERENCES files (id);

CREATE TABLE countries
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE genres
(
    id   SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL
);

CREATE TABLE movies
(
    id             SERIAL PRIMARY KEY,
    title          VARCHAR(255) NOT NULL,
    description    TEXT,
    budget         INTEGER,
    release_date   DATE         NOT NULL,
    duration       INTEGER,
    director_id    INTEGER,
    country_id     INTEGER,
    poster_file_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES countries (id),
    FOREIGN KEY (poster_file_id) REFERENCES files (id)
);

CREATE TABLE movies_genres
(
    movie_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id)
);

CREATE TABLE persons
(
    id                    SERIAL PRIMARY KEY,
    first_name            VARCHAR(50) NOT NULL,
    last_name             VARCHAR(50) NOT NULL,
    biography             TEXT,
    date_of_birth         DATE        NOT NULL,
    gender                VARCHAR(10) NOT NULL,
    country_id            INTEGER     NOT NULL,
    primary_photo_file_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES countries (id),
    FOREIGN KEY (primary_photo_file_id) REFERENCES files (id)
);

ALTER TABLE movies
    ADD FOREIGN KEY (director_id) REFERENCES persons (id);

CREATE TABLE characters
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100)                                                          NOT NULL,
    description TEXT,
    role        VARCHAR(20) CHECK ( role in ('leading', 'supporting', 'background') ) NOT NULL,
    movie_id    INTEGER                                                               NOT NULL,
    actor_id    INTEGER                                                               NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies (id),
    FOREIGN KEY (actor_id) REFERENCES persons (id)
);

CREATE TABLE persons_photos
(
    person_id INTEGER,
    file_id   INTEGER,
    PRIMARY KEY (person_id, file_id),
    FOREIGN KEY (person_id) REFERENCES persons (id),
    FOREIGN KEY (file_id) REFERENCES files (id)
);

CREATE TABLE favorite_movies
(
    user_id  INTEGER,
    movie_id INTEGER,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (movie_id) REFERENCES movies (id)
);