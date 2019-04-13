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
	CapacityType	Varchar(10),			
	Notes			varchar(500),		-- notes on that particular item
	PRIMARY KEY (Item_FK, Character_FK)
	-- FOREIGN KEY (Character_FK) REFERENCES CHARACTER(Username, Name);
	-- FOREIGN KEY (Item_FK) REFERENCES ITEM(Name);
);

DROP TABLE IF EXISTS AUGMENTATION;
CREATE TABLE AUGMENTATION
(
	Item_FK			varchar(80),		-- Item the augmentation is based off
	Character_FK	varchar(160),		-- Owner of aug, made of character name and creator's username
	Rating			integer,			-- how powerful or useful
	Capacity		integer,			-- a measurement of how many subitems can be held
	CapacityType	varchar(10),			
	Notes			varchar(500),		-- notes on that particular item
	EssenceCost		float,				-- cost for augmentation
	Grade			varchar(10),		-- tier of aug, which effects essence cost
	PRIMARY KEY (Item_FK, Character_FK)
	-- FOREIGN KEY (Character_FK) REFERENCES CHARACTER(Username, Name);
	-- FOREIGN KEY (Item_FK) REFERENCES ITEM(Name);
);

DROP TABLE IF EXISTS SUBITEM;
CREATE TABLE SUBITEM
(
	Name			varchar(80)		NOT NULL,
	Legality		varchar(1),
	/* TO DO: CONSTRAINT*/
	Description		varchar(1000),
	Availability	integer,
	Cost			integer,
	CapacityUsed	integer,
	CapacityType	varchar(10),
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS PERSONAL_CYBERDECK; -- Inherits from Unique Item
CREATE TABLE PERSONAL_CYBERDECK
(
	Name						varchar(80)		NOT NULL,
	Character_FK				varchar(160),	-- Owner of aug, made of character name and creator's username
	Rating						integer, 
	Capacity					integer,
	CapacityType				varchar(10),
	Notes						varchar(500),
	MatrixPersonaDescription	varchar(500),
	ModelName_FK				varchar(80),	-- Reference to Cyberdeck Model
	PRIMARY KEY (Name)
	-- FOREIGN KEY (ModelName_FK) REFERENCES CYBERDECK_MODEL
);

DROP TABLE IF EXISTS CYBERDECK_MODEL;
CREATE TABLE CYBERDECK_MODEL
(
	Name				varchar(80)		NOT NULL,
	Legality			varchar(1),
	Description			varchar(1000),				-- What the item does
	Availability		integer,
	Cost				integer,
	Array				varchar(4),					-- 4 numbers for attack, sleaze, firewall, or data processing
	CyberdeckRating		integer,
	ProgramCapacity		integer,
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS CONFIGURATOR;
CREATE TABLE CONFIGURATOR
(
	Number			integer			NOT NULL,		-- order in which configurator programs were added
	Character_FK	varchar(160)	NOT NULL,		
	PRIMARY KEY (Number, Character_FK)
	-- ,FOREIGN KEY (Character_FK) REFERENCES CHARACTER(Username, Name);
);


