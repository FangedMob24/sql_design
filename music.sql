-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT,
  duration_in_seconds INTEGER,
  release_date DATE,
  album_id INTEGER REFERENCES album (id)
);

CREATE TABLE artist_song
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id),
  artist_id INTEGER REFERENCES artists (id)
);

CREATE TABLE producer_song
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs (id),
  producer_id INTEGER REFERENCES producers (id)
);

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

INSERT INTO artists
  (name)
VALUES
  ('Hanson'),--1
  ('Quen'),--2
  ('Mariah Cary'),--3
  ('Boyz II Men'),--4
  ('Lady Gaga'),--5
  ('Bradley Cooper'),--6
  ('Nickelback'),--7
  ('Jay Z'),--8
  ('Alicia Keys'),--9
  ('Katy Perry'),--10
  ('Juicy J'),--11
  ('Maroon 5'),--12
  ('Christina Aguilaera'),--13
  ('Avril Lavigne'),--14
  ('Destiny''s Child');--15

INSERT INTO album
  (name)
VALUES
  ('Middle of Nowhere'),--1
  ('A Night at the Opera'),--2
  ('Daydream'),--3
  ('A Star Is Born'),--4
  ('Silver Side Up'),--5
  ('The Blueprint 3'),--6
  ('Prism'),--7
  ('Hands All Over'),--8
  ('Let Go'),--9
  ('The Writing''s on the Wall');--10

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'),--1
  ('Stephen Lironi'),--2
  ('Roy Thomas Baker'),--3
  ('Walter Afanasieff'),--4
  ('Benjamin Rice'),--5
  ('Rick Parashar'),--6
  ('Al Shux'),--7
  ('Max Martin'),--8
  ('Cirkut'),--9
  ('Shellback'),--10
  ('Benny Blanco'),--11
  ('The Matrix'),--12
  ('Darkchild');--13

INSERT INTO songs
  (title, duration_in_seconds, release_date, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2),
  ('One Sweet Day', 282, '11-14-1995', 3),
  ('Shallow', 216, '09-27-2018', 4),
  ('How You Remind Me', 223, '08-21-2009', 5),
  ('New York State of Mind', 276, '10-20-2009', 6),
  ('Dark Horse', 215, '12-17-2013', 7),
  ('Moves Like Jagger', 201, '06-21-2011', 8),
  ('Complicated', 244, '05-14-2002', 9),
  ('Say My Name', 240, '11-07-1999', 10);

INSERT INTO artist_song
  (song_id, artist_id)
VALUES
  (1,1),
  (2,2),
  (3,3),(3,4),
  (4,5),(4,6),
  (5,7),
  (6,8),(6,9),
  (7,10),(7,11),
  (8,12),(8,13),
  (9,14),
  (10,15);

INSERT INTO producer_song
  (song_id, producer_id)
VALUES
  (1,1),(1,2),
  (2,3),
  (3,4),
  (4,5),
  (5,6),
  (6,7),
  (7,8),(7,9),
  (8,10),(8,11),
  (9,12),
  (10,13);
