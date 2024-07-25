-- Insert into File
INSERT INTO files (file_name, mime_type, key, url)
VALUES 
('avatar1.png', 'image/png', 'avatars/avatar1.png', 'http://example.com/avatars/avatar1.png'),
('avatar2.png', 'image/png', 'avatars/avatar2.png', 'http://example.com/avatars/avatar2.png'),
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'http://example.com/posters/poster1.jpg'),
('poster2.jpg', 'image/jpeg', 'posters/poster2.jpg', 'http://example.com/posters/poster2.jpg'),
('photo1.jpg', 'image/jpeg', 'photos/photo1.jpg', 'http://example.com/photos/photo1.jpg'),
('photo2.jpg', 'image/jpeg', 'photos/photo2.jpg', 'http://example.com/photos/photo2.jpg'),
('file7.jpg', 'image/jpeg', 'files/file7.jpg', 'http://example.com/files/file7.jpg'),
('file8.jpg', 'image/jpeg', 'files/file8.jpg', 'http://example.com/files/file8.jpg'),
('file9.jpg', 'image/jpeg', 'files/file9.jpg', 'http://example.com/files/file9.jpg'),
('file10.jpg', 'image/jpeg', 'files/file10.jpg', 'http://example.com/files/file10.jpg');

-- Insert into Country
INSERT INTO countries (name)
VALUES 
('USA'),
('Canada'),
('UK'),
('France'),
('Germany'),
('Italy'),
('Spain'),
('Australia'),
('Japan'),
('South Korea');

-- Insert into Genre
INSERT INTO genres (name)
VALUES 
('Action'),
('Comedy'),
('Drama'),
('Thriller'),
('Horror'),
('Sci-Fi'),
('Romance'),
('Adventure'),
('Fantasy'),
('Documentary');

-- Insert into Person (Directors and Actors)
INSERT INTO persons (first_name, last_name, biography, date_of_birth, gender, country_id, primary_photo_file_id)
VALUES 
('Christopher', 'Nolan', 'A famous director', '1970-07-30', 'Male', 1, 5),
('Quentin', 'Tarantino', 'A famous director', '1963-03-27', 'Male', 1, 6),
('Leonardo', 'DiCaprio', 'An award-winning actor', '1974-11-11', 'Male', 1, 7),
('Joseph', 'Gordon-Levitt', 'An actor known for versatile roles', '1981-02-17', 'Male', 1, 8),
('Elliot', 'Page', 'An actor and advocate', '1987-02-21', 'Male', 2, 9),
('Brad', 'Pitt', 'A well-known actor and producer', '1963-12-18', 'Male', 1, 10),
('Margot', 'Robbie', 'An award-winning actress', '1990-07-02', 'Female', 2, 1),
('Tom', 'Hanks', 'A beloved actor and filmmaker', '1956-07-09', 'Male', 1, 2),
('Emma', 'Watson', 'An actress and activist', '1990-04-15', 'Female', 3, 3),
('Denzel', 'Washington', 'A renowned actor and director', '1954-12-28', 'Male', 1, 4);

-- Insert into Movie
INSERT INTO movies (title, description, budget, release_date, duration, director_id, country_id, poster_file_id)
VALUES 
('Inception', 'A mind-bending thriller', 160000000, '2010-07-16', 148, 1, 1, 3),
('Django Unchained', 'A western drama', 100000000, '2012-12-25', 165, 2, 1, 4),
('Titanic', 'A tragic love story', 200000000, '1997-12-19', 195, 1, 1, 3),
('The Dark Knight', 'A superhero thriller', 185000000, '2008-07-18', 152, 1, 1, 4),
('The Revenant', 'A survival drama', 135000000, '2015-12-25', 156, 2, 2, 3),
('Fight Club', 'A psychological thriller', 63000000, '1999-10-15', 139, 2, 1, 4),
('Interstellar', 'A sci-fi adventure', 165000000, '2014-11-07', 169, 1, 1, 3),
('Catch Me If You Can', 'A crime drama', 52000000, '2002-12-25', 141, 2, 1, 4),
('The Matrix', 'A sci-fi action', 63000000, '1999-03-31', 136, 1, 1, 3),
('The Godfather', 'A crime saga', 6000000, '1972-03-24', 175, 2, 1, 4);

-- Insert into MovieGenre
INSERT INTO movies_genres (movie_id, genre_id)
VALUES 
(1, 1), (1, 4), (1, 6),
(2, 1), (2, 3), (2, 4),
(3, 3), (3, 7),
(4, 1), (4, 4),
(5, 3), (5, 4),
(6, 3), (6, 4),
(7, 1), (7, 6),
(8, 1), (8, 3),
(9, 1), (9, 6),
(10, 1), (10, 3);

-- Insert into Character
INSERT INTO characters (name, description, role, movie_id, actor_id)
VALUES 
('Dom Cobb', 'A skilled thief who steals corporate secrets', 'leading', 1, 3),
('Dr. King Schultz', 'A German bounty hunter', 'leading', 2, 4),
('Jack Dawson', 'A poor artist who falls in love with a rich girl', 'leading', 3, 3),
('Bruce Wayne', 'A billionaire who fights crime as Batman', 'leading', 4, 3),
('Hugh Glass', 'A frontiersman on a quest for survival', 'leading', 5, 4),
('Tyler Durden', 'A soap salesman with a dark side', 'leading', 6, 4),
('Cooper', 'A former pilot on a space mission', 'leading', 7, 3),
('Frank Abagnale Jr.', 'A young con artist', 'leading', 8, 3),
('Neo', 'A hacker who discovers the truth about his reality', 'leading', 9, 3),
('Vito Corleone', 'The head of a powerful crime family', 'leading', 10, 4);

INSERT INTO users (username, first_name, last_name, email, password, avatar_file_id)
VALUES
('johndoe', 'John', 'Doe', 'john.doe@example.com', 'securepassword', 1),
('janedoe', 'Jane', 'Doe', 'jane.doe@example.com', 'securepassword', 2),
('alice', 'Alice', 'Smith', 'alice.smith@example.com', 'securepassword', 3),
('bob', 'Bob', 'Brown', 'bob.brown@example.com', 'securepassword', 4),
('charlie', 'Charlie', 'Davis', 'charlie.davis@example.com', 'securepassword', 5),
('david', 'David', 'Wilson', 'david.wilson@example.com', 'securepassword', 6),
('eve', 'Eve', 'Johnson', 'eve.johnson@example.com', 'securepassword', 7),
('frank', 'Frank', 'Miller', 'frank.miller@example.com', 'securepassword', 8),
('grace', 'Grace', 'Taylor', 'grace.taylor@example.com', 'securepassword', 9),
('heidi', 'Heidi', 'Anderson', 'heidi.anderson@example.com', 'securepassword', 10);


-- Insert into FavoriteMovies
INSERT INTO favorite_movies (user_id, movie_id)
VALUES 
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5), (2, 6),
(3, 7), (3, 8), (3, 9),
(4, 10), (4, 1), (4, 2),
(5, 3), (5, 4), (5, 5),
(6, 6), (6, 7), (6, 8),
(7, 9), (7, 10), (7, 1),
(8, 2), (8, 3), (8, 4),
(9, 5), (9, 6), (9, 7),
(10, 8), (10, 9), (10, 10);