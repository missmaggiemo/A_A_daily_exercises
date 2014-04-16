CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL
);


CREATE TABLE question_followers (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL
);

CREATE TABLE tags (
  id INTEGER PRIMARY KEY,
  tag varchar(255)
);

CREATE TABLE question_tags (
  id INTEGER PRIMARY KEY,
  tag_id INTEGER,
  question_id INTEGER
);

INSERT INTO
users (fname, lname)
VALUES
('Barney', 'Rubble'), ('Fred', 'Flintstone'), ('Hoppy', 'Rubble'),
('Dino', 'Flintstone');

INSERT INTO
questions (title, body, user_id)
VALUES
('What times does the factory close today?', "I don't want to be late for work!", 2),
('Is there a Water Buffaloes meeting today?', "The boys wanted to go bowling", 1),
("What kind of food does Dino like to eat?", "I want what he's having.", 3);

INSERT INTO
question_followers (user_id, question_id)
VALUES
(2, 1), (1, 2), (3, 3);

INSERT INTO
replies (question_id, reply_id, user_id, body)
VALUES
(1, NULL, 1, "6pm, just in time for the Water Buffalo meeting."),
(3, NULL, 2, "I don't know. Dino's a vegetarian, so some kind of fern."),
(3, 2, 3, "Yuck!");

INSERT INTO
question_likes(user_id, question_id)
VALUES
(4, 1), (4, 2), (4, 3), (2, 1), (1, 3);

INSERT INTO
tags(tag)
VALUES
('water buffaloes'), ('dinosaur food'), ('pet care'), ('bowling'), ('work/notwork'), ('playtime');

INSERT INTO
question_tags(tag_id, question_id)
VALUES
(1, 2), (2, 3), (3, 3), (4, 2), (5, 1), (6, 2);
