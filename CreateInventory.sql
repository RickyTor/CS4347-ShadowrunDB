USE srdb; -- All queries will be used on "srdb" database (must be created first)
DROP TABLE IF EXISTS inventory; -- if table has already been made, it will be deleted
CREATE TABLE inventory -- make new table (or replace the one just dropped)
(
	character_FK	varchar(160) NOT NULL, -- Character's key is charactername(80) + username(80)
	item_FK			varchar(80) NOT NULL, -- Item name
	PRIMARY KEY	(character_FK, item_FK) -- inventory will link 1 character with N items
);