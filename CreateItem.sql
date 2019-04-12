USE srdb; -- All queries will be used on "srdb" database (must be created first)
DROP TABLE IF EXISTS ITEM; -- if table has already been made, it will be deleted
CREATE TABLE ITEM -- make new table (or replace the one just dropped)
(
	Name			varchar(80) 	NOT NULL, 	-- unique name for item
	Description		varchar(1000), 				-- what the item does
	Availability	integer,					-- how hard to find item
	Cost			integer,					-- amount needed to purchase
	Legality		varchar(1)					-- Legal (L), Illegal (I), Requires License (R),
	/* This doesn't seem to work with mySQL?
	,CONSTRAINT check_Legal CHECK (Legality IN ('L', 'I', 'R')) -- only these values can be used
	*/
);