USE srdb; -- All queries will be used on "srdb" database (must be created first)
DROP TABLE IF EXISTS INVENTORY; -- if table has already been made, it will be deleted
CREATE TABLE INVENTORY -- make new table (or replace the one just dropped)
(
	Character_FK	varchar(160) 	NOT NULL, -- Character's key is charactername(80) + username(80)
	Item_FK			varchar(80) 	NOT NULL, -- Item name
	PRIMARY KEY	(character_FK, item_FK) -- inventory will link 1 character with N items
	/*, TODO: Finish character table */
	-- FOREIGN KEY (Character_FK) REFERENCES PLAYER_CHARACTER(Username, Name);
	-- FOREIGN KEY (Item_FK) REFERENCES ITEM(Name);
);

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

DROP TABLE IF EXISTS MELEE;
CREATE TABLE MELEE
(
	Name			varchar(80)
);