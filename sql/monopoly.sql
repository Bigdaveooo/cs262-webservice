--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGameLocation CASCADE;
DROP TABLE IF EXISTS Game CASCADE;
DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Location CASCADE;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp,
	isFinished boolean DEFAULT false
	);

CREATE TABLE Player ( 
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Location (
	ID integer PRIMARY KEY,
	name varchar(50),
	position integer NOT NULL
);

CREATE TABLE PlayerGameLocation (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	cash decimal(10,2) DEFAULT 1500.00,
	currentLocation integer REFERENCES Location(ID),
	houses integer DEFAULT 0,
	hotels integer DEFAULT 0,
	PRIMARY KEY (gameID, playerID)
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGameLocation TO PUBLIC;
GRANT SELECT ON Location TO PUBLIC;

-- Add sample records.
INSERT INTO Location VALUES (1, 'Go', 0);
INSERT INTO Location VALUES (2, 'Community Chest', 1);
INSERT INTO Location VALUES (3, 'American Avenue', 2);
INSERT INTO Location VALUES (4, 'Chance', 3);

INSERT INTO Game (ID, time, isFinished) VALUES (1, '2016-10-01 10:00:00', true);
INSERT INTO Game (ID, time, isFinished) VALUES (2, '2016-12-16 08:30:00', false);
INSERT INTO Game (ID, time, isFinished) VALUES (3, '2016-04-05 12:22:30', true);
INSERT INTO Game (ID, time, isFinished) VALUES (4, '2016-07-23 06:45:00', false);
INSERT INTO Game (ID, time, isFinished) VALUES (5, '2024-10-30 10:00:00', true);
INSERT INTO Game (ID, time, isFinished) VALUES (6, '2006-06-28 13:20:00', true);


INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGameLocation VALUES (1, 1, 1500.00, 1, 0, 0); 
INSERT INTO PlayerGameLocation VALUES (2, 2, 1500.00, 2, 0, 0); 
INSERT INTO PlayerGameLocation VALUES (3, 3, 2200.00, 3, 0, 0);
INSERT INTO PlayerGameLocation VALUES (4, 2, 2500.00, 3, 1, 1);
INSERT INTO PlayerGameLocation VALUES (5, 3, 4500.00, 3, 1, 1);
INSERT INTO PlayerGameLocation VALUES (6, 2, 6500.00, 2, 4, 1);