USE test; -- all queries will be used on test database
DROP TABLE IF EXISTS users; -- if table has already been made, it will be deleted
CREATE TABLE users -- make new table (or replace the one just dropped)
(
	username	varchar(100) NOT NULL, -- Unique name for each user
	password	varchar(100) NOT NULL, -- Used to authorize access
	PRIMARY KEY	(id)
);

# Comments can be like this
-- Or like this
/* Or even
this */
-- Just remember to watch for spaces
