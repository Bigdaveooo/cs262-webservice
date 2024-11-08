--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
  FROM Game
  ;

-- Get the player records.
SELECT * 
  FROM Player
  ;

-- Get all the users with Calvin email addresses.
SELECT *
  FROM Player
 WHERE emailAddress LIKE '%calvin%'
 ;

-- Get the highest score ever recorded.
  SELECT cash
    FROM PlayerGameLocation
ORDER BY cash DESC
   LIMIT 1
   ;

-- Get the cross-product of all the tables.
SELECT *
  FROM Player, PlayerGameLocation, Game
  ;

-- Return number of records in the given table
SELECT COUNT(*)
    FROM Player
    ;

                                        -- LAB 8 QUERIES --

-- Retrieve a list of all the games, ordered by date with the most recent game coming first
SELECT *
FROM Game
ORDER BY time DESC
;

-- Retrieve all the games that occurred in the past week
SELECT *
FROM Game
WHERE time > NOW() - INTERVAL '7 DAYS'
;