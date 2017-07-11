DROP TABLE IF EXISTS space_cowboys;

CREATE TABLE space_cowboys
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  danger_level VARCHAR(255),
  bounty INT2
);

