-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id  INTEGER REFERENCES galaxies,
  orbital_period_in_years FLOAT,
  orbits_around TEXT
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets
);

INSERT INTO galaxies 
  (name) 
VALUES 
  ('Milky Way');

INSERT INTO planets
  (name, galaxy_id, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1, 1.00, 'The Sun'),
  ('Mars', 1, 1.88, 'The Sun'),
  ('Venus', 1, 0.62, 'The Sun'),
  ('Neptune', 1, 164.8, 'The Sun'),
  ('Proxima Centauri b', 1, 0.03, 'Proxima Centauri'),
  ('Gliese 876 b', 1, 0.23, 'Gliese 876');

INSERT INTO moons
  (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);