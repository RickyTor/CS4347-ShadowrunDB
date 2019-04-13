USE srdb; -- All queries will be used on "srdb" database (must be created first)
DROP TABLE IF EXISTS INVENTORY; -- if table has already been made, it will be deleted
CREATE TABLE INVENTORY -- make new table (or replace the one just dropped)
(
	Character_FK	varchar(160) 	NOT NULL, -- Character's key is charactername(80) + username(80)
	Item_FK			varchar(80) 	NOT NULL, -- Item name
	PRIMARY KEY	(Character_FK, Item_FK) -- inventory will link 1 character with N items
	/*, TODO: Finish character table */
	-- FOREIGN KEY (Character_FK) REFERENCES CHARACTER(Username, Name);
	-- FOREIGN KEY (Item_FK) REFERENCES ITEM(Name);
);

DROP TABLE IF EXISTS ITEM; -- if table has already been made, it will be deleted
CREATE TABLE ITEM -- make new table (or replace the one just dropped)
(
	Name			varchar(80) 	NOT NULL, 	-- unique name for item
	Description		varchar(1000), 				-- what the item does
	Availability	integer,					-- how hard to find item
	Cost			integer,					-- amount needed to purchase
	Legality		varchar(1),					-- Legal (L), Illegal (I), Requires License (R),
	PRIMARY KEY (Name),
	/* Works if you put the , after Primary Key above*/
	CONSTRAINT check_Legal CHECK (Legality IN ('L', 'I', 'R')) -- only these values can be used
);

DROP TABLE IF EXISTS MELEE;
CREATE TABLE MELEE
(
	Name			varchar(80) 	NOT NULL, 	-- unique name for item
	Description		varchar(1000), 				-- what the item does
	Availability	integer,					-- how hard to find item
	Cost			integer,					-- amount needed to purchase
	Legality		varchar(1),					-- Legal (L), Illegal (I), Requires License (R),
	/*TODO: Constrain to L,I,R*/
	SkillUsed		varchar(1),
	/*TODO: Constrain to R, A, B, C, E, G, H, L, P, T, U, N*/
	Damage			integer,
	Accuracy		integer,
	ArmorPiercing	integer,
	Reach			integer,
	PRIMARY KEY (Name)	
);

DROP TABLE IF EXISTS RANGED;
CREATE TABLE RANGED
(
	Name			varchar(80) 	NOT NULL, 	-- unique name for item
	Description		varchar(1000), 				-- what the item does
	Availability	integer,					-- how hard to find item
	Cost			integer,					-- amount needed to purchase
	Legality		varchar(1),					-- Legal (L), Illegal (I), Requires License (R),
	/*TODO: Constrain to L,I,R*/
	SkillUsed		varchar(1),
	/*TODO: Constrain to R, A, B, C, E, G, H, L, P, T, U, N*/
	Damage			integer,
	Accuracy		integer,
	ArmorPiercing	integer,
	Reach			integer,
	Mode			integer,
	BlastRadius		integer,
	Recoil			integer,
	Rating			integer,
	Ammo			integer,
	AmmoHolder		varchar(1),
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS DRONE;
CREATE TABLE DRONE
(
	Name			varchar(80)		NOT NULL,
	/*TODO: Weapon_FK	varchar(80)??*/
	Legality		varchar(1),
	Description		varchar(1000),
	Availability	integer,
	Cost			integer,
	Pilot			integer,		
	Armor			integer,
	Body			integer,
	Acceleration	integer,
	Speed			integer,		
	Handling		integer,
	Sensor			integer,				-- Sensor stat	
	Seats			integer DEFAULT 0, 		-- Number of seats drone has (if > 1 it is a vehicle)
	Damage			integer DEFAULT 0,		-- Amount of damage taken by drone
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS UNIQUE_ITEM;		-- A character's own version of another item
CREATE TABLE UNIQUE_ITEM
(
	Item_FK			varchar(80),		-- Item the unique item is based off
	Character_FK	varchar(160),		-- Owner of unique item, made of character name and creator's username
	Rating			integer,			-- how powerful or useful
	Capacity		integer,			-- a measurement of how many subitems can be held
	CapacityType	Varchar(10)			
	Notes			varchar(500)		-- notes on that particular item
	PRIMARY KEY (Item_FK, Character_FK)
	-- FOREIGN KEY (Character_FK) REFERENCES CHARACTER(Username, Name);
	-- FOREIGN KEY (Item_FK) REFERENCES ITEM(Name);
);



