-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries (id)
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines (id),
  from_city INTEGER REFERENCES cities (id),
  departure TIMESTAMP,
  arrival TIMESTAMP,
  to_city INTEGER REFERENCES cities (id)
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  passenger_id INTEGER REFERENCES passengers (id),
  flights_id INTEGER REFERENCES flights (id)
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jenifer','Finch'),      --1
  ('Thadeus','Gathercoal'), --2
  ('Sonja','Pauley'),       --3
  ('Waneta','Skeleton'),    --4
  ('Berkie','Wycliff'),     --5
  ('Alvin','Leathes'),      --6
  ('Cory','Squibbes');      --7

INSERT INTO airlines
  (name)
VALUES
  ('United'),            --1
  ('British Airways'),   --2
  ('Delta'),             --3
  ('TUI Fly Belgium'),   --4
  ('Air China'),         --5
  ('American Airlines'), --6
  ('Avianca Brasil');    --7

INSERT INTO countries
  (name)
VALUES
  ('United States'),  --1
  ('United Kingdom'), --2
  ('Mexico'),         --3
  ('Morocco'),        --4
  ('China'),          --5
  ('Chile'),          --6
  ('Brazil'),         --7
  ('UAE'),            --8
  ('France'),         --9
  ('Japan');          --10

INSERT INTO cities
  (name, country_id)
VALUES
  ('Washington DC', 1), --1
  ('Seattle', 1),       --2
  ('Tokyo', 10),        --3
  ('London', 2),        --4
  ('Los Angeles', 1),   --5
  ('Las Vegas', 1),     --6
  ('Mexico City', 3),   --7
  ('Paris', 9),         --8
  ('Casablanca', 4),    --9
  ('Dubai', 8),         --10
  ('Beijing', 5),       --11
  ('New York', 1),      --12
  ('Charlotte', 1),     --13
  ('Cedar Rapids', 1),  --14
  ('Chicago', 1),       --15
  ('New Orleans', 1),   --16
  ('Sao Paolo', 7),     --17
  ('Santiago', 6);      --18

INSERT INTO flights
  (airline_id, from_city, departure, arrival, to_city)
VALUES
  (1, 1,'2018-04-08 09:00:00', '2018-04-08 12:00:00', 2),
  (2, 3,'2018-12-19 12:45:00', '2018-12-19 16:15:00', 4),
  (3, 5,'2018-01-02 07:00:00', '2018-01-02 08:03:00', 6),
  (3, 2,'2018-04-15 16:50:00', '2018-04-15 21:00:00', 7),
  (4, 9,'2018-08-01 18:30:00', '2018-08-01 21:50:00', 9),
  (5, 8,'2018-10-31 01:15:00', '2018-10-31 12:55:00', 11),
  (1, 12,'2019-02-06 06:00:00', '2019-02-06 07:47:00', 13),
  (6, 14,'2018-12-22 14:42:00', '2018-12-22 15:56:00', 15),
  (6, 13,'2019-02-06 16:28:00', '2019-02-06 19:18:00', 16),
  (7, 17,'2019-01-20 19:30:00', '2019-01-20 22:45:00', 18);

INSERT INTO tickets
  (seat, passenger_id, flight_times_id)
VALUES
  ('33B', 1, 1),
  ('8A', 2, 2),
  ('12A', 3, 3),
  ('20A', 1, 4),
  ('23D', 4, 5),
  ('18C', 2, 6),
  ('9E', 5, 7),
  ('1A', 6, 8),
  ('32B', 5, 9),
  ('10D', 7, 10);