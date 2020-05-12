CREATE DATABASE novels;

CREATE USER 'novels'@'localhost' IDENTIFIED WITH mysql_native_password BY 'n0v3L$';

GRANT ALL ON novels.* TO 'novels'@'localhost';

USE novels;

CREATE TABLE authors (
  Id INT auto_increment,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
  deletedAt DATETIME,
  PRIMARY KEY (Id)
);

CREATE TABLE novels (
  Id INT auto_increment,
  Title VARCHAR(255),
  authorId INT,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
  deletedAt DATETIME,
  PRIMARY KEY (Id),
  FOREIGN KEY (authorId) REFERENCES authors(Id)
);

CREATE TABLE genres (
  Id INT auto_increment,
  name VARCHAR(255),
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
  deletedAt DATETIME,
  PRIMARY KEY (Id)
);

CREATE TABLE novelsGenres (
  novelId INT,
  genreId INT,
  createdAt DATETIME DEFAULT NOW(),
  updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
  deletedAt DATETIME,
  FOREIGN KEY (novelId) REFERENCES novels(Id),
  FOREIGN KEY (genreId) REFERENCES genres(Id)
);

INSERT INTO authors (firstName, lastName) VALUES ('Bram', 'Stoker');
INSERT INTO authors (firstName, lastName) VALUES ('Oscar', 'Wilde');
INSERT INTO authors (firstName, lastName) VALUES ('Alice', 'Walker');
INSERT INTO authors (firstName, lastName) VALUES ('Leo', 'Tolstoy');
INSERT INTO authors (firstName, lastName) VALUES ('Charles', 'Dickens');
INSERT INTO authors (firstName, lastName) VALUES ('Arthur', 'Miller');
INSERT INTO authors (firstName, lastName) VALUES ('Alexandre', 'Dumas');
INSERT INTO authors (firstName, lastName) VALUES ('Arthur', 'Conan Doyle');
INSERT INTO authors (firstName, lastName) VALUES ('Robert Louis', 'Stevenson');
INSERT INTO authors (firstName, lastName) VALUES ('Fyodor', 'Dostoyevsky');
INSERT INTO authors (firstName, lastName) VALUES ('Agatha', 'Christie');
INSERT INTO authors (firstName, lastName) VALUES ('Ray', 'Bradbury');
INSERT INTO authors (firstName, lastName) VALUES ('George', 'Orwell');
INSERT INTO authors (firstName, lastName) VALUES ('H.G.', 'Wells');
INSERT INTO authors (firstName, lastName) VALUES ('Chinua', 'Achebe');

INSERT INTO novels (Title, authorId) VALUES ('Dracula', (SELECT Id FROM authors WHERE lastName = 'Stoker'));
INSERT INTO novels (Title, authorId) VALUES ('The Picture of Dorian Gray', (SELECT Id FROM authors WHERE lastName = 'Wilde'));
INSERT INTO novels (Title, authorId) VALUES ('The Color Purple', (SELECT Id FROM authors WHERE lastName = 'Walker'));
INSERT INTO novels (Title, authorId) VALUES ('War and Peace', (SELECT Id FROM authors WHERE lastName = 'Tolstoy'));
INSERT INTO novels (Title, authorId) VALUES ('A Tale of Two Cities', (SELECT Id FROM authors WHERE lastName = 'Dickens'));
INSERT INTO novels (Title, authorId) VALUES ('The Crucible', (SELECT Id FROM authors WHERE lastName = 'Miller'));
INSERT INTO novels (Title, authorId) VALUES ('The Three Musketeers', (SELECT Id FROM authors WHERE lastName = 'Dumas'));
INSERT INTO novels (Title, authorId) VALUES ('The Hound of the Baskervilles', (SELECT Id FROM authors WHERE lastName = 'Conan Doyle'));
INSERT INTO novels (Title, authorId) VALUES ('The Strange Case of Dr. Jekyll and Mr. Hyde', (SELECT Id FROM authors WHERE lastName = 'Stevenson'));
INSERT INTO novels (Title, authorId) VALUES ('Crime and Punishment', (SELECT Id FROM authors WHERE lastName = 'Dostoyevsky'));
INSERT INTO novels (Title, authorId) VALUES ('Murder on the Orient Express', (SELECT Id FROM authors WHERE lastName = 'Christie'));
INSERT INTO novels (Title, authorId) VALUES ('Fahrenheit 451', (SELECT Id FROM authors WHERE lastName = 'Bradbury'));
INSERT INTO novels (Title, authorId) VALUES ('Animal Farm', (SELECT Id FROM authors WHERE lastName = 'Orwell'));
INSERT INTO novels (Title, authorId) VALUES ('The Time Machine', (SELECT Id FROM authors WHERE lastName = 'Wells'));
INSERT INTO novels (Title, authorId) VALUES ('Things Fall Apart', (SELECT Id FROM authors WHERE lastName = 'Achebe'));

INSERT INTO genres (name) VALUES ('Adventure');
INSERT INTO genres (name) VALUES ('African Literature');
INSERT INTO genres (name) VALUES ('Crime');
INSERT INTO genres (name) VALUES ('Drama');
INSERT INTO genres (name) VALUES ('Dystopia');
INSERT INTO genres (name) VALUES ('Fantasy');
INSERT INTO genres (name) VALUES ('Fiction'); 
INSERT INTO genres (name) VALUES ('French Literature');
INSERT INTO genres (name) VALUES ('Gothic'); 
INSERT INTO genres (name) VALUES ('Historical Fiction'); 
INSERT INTO genres (name) VALUES ('Horror');   
INSERT INTO genres (name) VALUES ('Mystery');
INSERT INTO genres (name) VALUES ('Plays'); 
INSERT INTO genres (name) VALUES ('Russian Literature'); 
INSERT INTO genres (name) VALUES ('Science Fiction'); 
INSERT INTO genres (name) VALUES ('Thriller');
INSERT INTO genres (name) VALUES ('Time Travel');
INSERT INTO genres (name) VALUES ('War');

INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Dracula'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Dracula'), (SELECT Id FROM genres WHERE name = 'Horror'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Dracula'), (SELECT Id FROM genres WHERE name = 'Fantasy'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Picture of Dorian Gray'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Picture of Dorian Gray'), (SELECT Id FROM genres WHERE name = 'Horror'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Picture of Dorian Gray'), (SELECT Id FROM genres WHERE name = 'Gothic'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Picture of Dorian Gray'), (SELECT Id FROM genres WHERE name = 'Fantasy'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Color Purple'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Color Purple'), (SELECT Id FROM genres WHERE name = 'Historical Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'War and Peace'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'War and Peace'), (SELECT Id FROM genres WHERE name = 'Historical Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'War and Peace'), (SELECT Id FROM genres WHERE name = 'War'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'War and Peace'), (SELECT Id FROM genres WHERE name = 'Russian Literature'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'A Tale of Two Cities'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'A Tale of Two Cities'), (SELECT Id FROM genres WHERE name = 'Historical Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Crucible'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Crucible'), (SELECT Id FROM genres WHERE name = 'Historical Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Crucible'), (SELECT Id FROM genres WHERE name = 'Drama'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Crucible'), (SELECT Id FROM genres WHERE name = 'Plays'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Three Musketeers'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Three Musketeers'), (SELECT Id FROM genres WHERE name = 'Historical Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Three Musketeers'), (SELECT Id FROM genres WHERE name = 'Adventure'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Three Musketeers'), (SELECT Id FROM genres WHERE name = 'French Literature'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Hound of the Baskervilles'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Hound of the Baskervilles'), (SELECT Id FROM genres WHERE name = 'Mystery'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Hound of the Baskervilles'), (SELECT Id FROM genres WHERE name = 'Crime'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Hound of the Baskervilles'), (SELECT Id FROM genres WHERE name = 'Thriller'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Strange Case of Dr. Jekyll and Mr. Hyde'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Strange Case of Dr. Jekyll and Mr. Hyde'), (SELECT Id FROM genres WHERE name = 'Mystery'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Strange Case of Dr. Jekyll and Mr. Hyde'), (SELECT Id FROM genres WHERE name = 'Science Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Strange Case of Dr. Jekyll and Mr. Hyde'), (SELECT Id FROM genres WHERE name = 'Horror'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Crime and Punishment'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Crime and Punishment'), (SELECT Id FROM genres WHERE name = 'Russian Literature'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Crime and Punishment'), (SELECT Id FROM genres WHERE name = 'Mystery'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Murder on the Orient Express'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Murder on the Orient Express'), (SELECT Id FROM genres WHERE name = 'Mystery'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Fahrenheit 451'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Fahrenheit 451'), (SELECT Id FROM genres WHERE name = 'Science Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Fahrenheit 451'), (SELECT Id FROM genres WHERE name = 'Dystopia'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Animal Farm'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Animal Farm'), (SELECT Id FROM genres WHERE name = 'Science Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Animal Farm'), (SELECT Id FROM genres WHERE name = 'Dystopia'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Time Machine'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Time Machine'), (SELECT Id FROM genres WHERE name = 'Science Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'The Time Machine'), (SELECT Id FROM genres WHERE name = 'Time Travel'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Things Fall Apart'), (SELECT Id FROM genres WHERE name = 'Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Things Fall Apart'), (SELECT Id FROM genres WHERE name = 'Historical Fiction'));
INSERT INTO novelsGenres (novelId, genreId) VALUES ((SELECT Id FROM novels WHERE Title = 'Things Fall Apart'), (SELECT Id FROM genres WHERE name = 'African Literature'));
