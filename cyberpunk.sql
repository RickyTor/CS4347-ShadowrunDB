USE srdb; 
DROP TABLE IF EXISTS USERS; 
CREATE TABLE USERS 
(
	Username	varchar(80) NOT NULL, -- Unique name for each user
	Password	varchar(20) NOT NULL, -- Used to authorize access
	PRIMARY KEY	(Username)
);
DROP TABLE IF EXISTS CHARACTERS;
CREATE TABLE CHARACTERS
(
	Name 			varchar(80) NOT NULL,
	TotalKarma 		integer,
	TotalFunds 		integer,
	FundsSpent 		integer,
	KarmaSpent		integer,
	Backstory 		varchar(1000),
	Personality 	varchar(500),
	Willpower	 	integer CHECK(Willpower >= 1 AND Willpower <= 8),
	Logic 			integer CHECK(Logic >= 1 AND Logic <= 8),
	Intuition 		integer CHECK(Intuition >= 1 AND Intuition <= 8),
	Charisma 		integer CHECK(Charisma >= 1 AND Charisma <= 9),
	Edge 			integer CHECK(Edge >= 1 AND Edge <= 8),
	EdgeAvailable 	integer,
	Essence 		float CHECK(Essence >= 0 AND Essence <= 6),
	PriorityA 		varchar(1),
	CONSTRAINT check_PriorityA CHECK (PriorityA IN ('R', 'A', 'M', 'S', 'N')),
	PriorityB 		varchar(1),
	CONSTRAINT check_PriorityB CHECK (PriorityB IN ('R', 'A', 'M', 'S', 'N')),
	PriorityC 		varchar(1),
	CONSTRAINT check_PriorityC CHECK (PriorityC IN ('R', 'A', 'M', 'S', 'N')),
	PriorityD 		varchar(1),
	CONSTRAINT check_PriorityD CHECK (PriorityD IN ('R', 'A', 'M', 'S', 'N')),
	PriorityE 		varchar(1),
	CONSTRAINT check_PriorityE CHECK (PriorityE IN ('R', 'A', 'M', 'S', 'N')),
	Username_FK 	varchar(80) NOT NULL,
	Primary Key (Name, Username_FK),
	Foreign Key (Username_FK) References USERS(Username)
);
DROP TABLE IF EXISTS RACE;
CREATE TABLE RACE
(
	Name varchar(80) not null,
	RacialAbilities varchar(500),
	StartingBody integer CHECK(StartingBody >= 1),
	StartingAgility integer CHECK(StartingAgility >= 1),
	StartingReaction integer CHECK(StartingReaction >= 1),
	StartingStrength integer CHECK(StartingStrength >= 1),
	StartingWillpower integer CHECK(StartingWillpower >= 1),
	StartingLogic integer CHECK(StartingLogic >= 1),
	StartingIntuition integer CHECK(StartingIntuition >= 1),
	StartingCharisma integer CHECK(StartingCharisma >= 1),
	MaximumBody integer,
	MaximumAgility integer,
	MaximumReaction integer,
	MaximumStrength integer,
	MaximumWillpower integer,
	MaximumLogic integer,
	MaximumIntuition integer,
	MaximumCharisma integer,
	Primary Key(Name)
);
DROP TABLE IF EXISTS ACCESSES;
CREATE TABLE ACCESSES
(
	AccessingUser_FK varchar(100),
	Character_FK varchar(160),
	PRIMARY KEY (Character_FK, AccessingUser_FK),
	Foreign Key (Character_FK) References CHARACTERS(Name),
	Foreign Key (AccessingUser_FK) References USERS(Username)
);
DROP TABLE IF EXISTS AI;
CREATE TABLE AI
(
	MatrixDepth 		integer CHECK(MatrixDepth >= 1), 
	CoreDamage 			integer,
	MatrixPersona 		varchar(500),
	CharacterCreator_FK varchar(80) 	NOT NULL,
	Character_FK 		varchar(80) 	NOT NULL,
	PRIMARY KEY (Character_FK, CharacterCreator_FK),
	FOREIGN KEY (CharacterCreator_FK) REFERENCES CHARACTERS(username_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name)
);
DROP TABLE IF Exists TRADITION;
CREATE TABLE TRADITION
(
	Name varchar(80) NOT NULL,
	Description varchar(1000),
	DrainResistanceAttr varchar(1),
	CONSTRAINT check_DrainResistAttr CHECK (DrainResistanceAttr IN ('L', 'I', 'C')),
	CombatSpiritType varchar(1),
	CONSTRAINT check_CSpiritType CHECK (CombatSpiritType IN ('F','W','A','E','M','N','G','I','T','P')),
	HealthSpiritType varchar(1),
	CONSTRAINT check_HSpiritType CHECK (HealthSpiritType IN ('F','W','A','E','M','N','G','I','T','P')),
	ManipulationSpiritType varchar(1),
	CONSTRAINT check_MSpiritType CHECK (ManipulationSpiritType IN ('F','W','A','E','M','N','G','I','T','P')),
	DetectionSpiritType varchar(1),
	CONSTRAINT check_DSpiritType CHECK (DetectionSpiritType IN ('F','W','A','E','M','N','G','I','T','P')),
	IllusionSpiritType varchar(1),
	CONSTRAINT check_ISpiritType CHECK (IllusionSpiritType IN ('F','W','A','E','M','N','G','I','T','P')),
	PRIMARY KEY (Name)
);	

DROP TABLE IF EXISTS RITUAL;			 
CREATE TABLE RITUAL
(
	Name varchar(80),
	Description varchar(1000),
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS RITUAL_LIST;
CREATE TABLE RITUAL_LIST
(
	CharacterCreator_FK varchar(80),
	Character_FK varchar(80),
	RitualName_FK varchar(80),
	PRIMARY KEY (CharacterCreator_FK, Character_FK, RitualName_FK),
	FOREIGN KEY (CharacterCreator_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (RitualName_FK) REFERENCES RITUAL(Name)
);
DROP TABLE IF EXISTS MAGIC_USER;
CREATE TABLE MAGIC_USER
(
	MagicRating			integer	CHECK(MagicRating >= 1 AND MagicRating <= 6),
	InitiationLevel 	integer,
	Tradition_FK	 	varchar(80) NOT NULL,
	CharacterCreator_FK	varchar(80) NOT NULL,
	Character_FK 		varchar(80) NOT NULL,
	PRIMARY KEY (Character_FK, CharacterCreator_FK, Tradition_FK),
	FOREIGN KEY (CharacterCreator_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Tradition_FK) REFERENCES TRADITION(Name),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name)
);
DROP TABLE IF EXISTS METASAPIENT;
CREATE TABLE METASAPIENT
(
	MagicRating			integer	CHECK(MagicRating >= 1),
	CharacterCreator_FK	varchar(80) NOT NULL,
	Character_FK 		varchar(80) NOT NULL,
	PRIMARY KEY (Character_FK, CharacterCreator_FK),
	FOREIGN KEY (CharacterCreator_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name)
);
DROP TABLE IF EXISTS SUBMERSION_POWER;
CREATE TABLE SUBMERSION_POWER
(
	Name varchar(80) NOT NULL,
	Description varchar(1000),
	PRIMARY KEY (Name)
);
DROP TABLE IF EXISTS SUBMERSION_POWER_LIST;
CREATE TABLE SUBMERSION_POWER_LIST
(
	CharacterCreator_FK	varchar(80) NOT NULL,
	Character_FK 		varchar(80) NOT NULL,
	Submersion_FK varchar(80) NOT NULL,
	PRIMARY KEY (Character_FK, CharacterCreator_FK, Submersion_FK),
	FOREIGN KEY (CharacterCreator_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Submersion_FK) REFERENCES SUBMERSION_POWER(Name),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name)
);
DROP TABLE IF EXISTS TECHNOMANCER;
CREATE TABLE TECHNOMANCER
(
	Resonance integer CHECK(Resonance >= 3 AND Resonance <= 6),
	Submersion integer,
	PersonaDescription varchar(500),
	CharacterCreator_FK varchar(80), 
	PRIMARY KEY (CharacterCreator_FK),
	FOREIGN KEY (CHARACTERCreator_FK) REFERENCES CHARACTERS(Username_FK)
);
					 
DROP TABLE IF EXISTS PHYSICAL_CHARACTER;
CREATE TABLE PHYSICAL_CHARACTER
(
	PhysicalDescription varchar(500),
	Body 				integer CHECK(Body >= 1 AND Body <=12),
	Agility 			integer CHECK(Agility >= 1 AND Agility <=9),
	Reaction			integer CHECK(Reaction >= 1 AND Reaction <=9),
	Strength 			integer CHECK(Strength >= 1 AND Strength <= 12),
	PhysicalDamage 		integer,
	StunDamage			integer,
	OverflowDamage		integer,
	CharacterCreator_FK varchar(80),
	Character_FK 		varchar(80),
	PRIMARY KEY(Character_FK, CharacterCreator_FK),
	FOREIGN KEY (CharacterCreator_FK) References CHARACTERS(Username_FK),
	FOREIGN KEY (Character_FK) References CHARACTERS(Name)
);
DROP TABLE IF EXISTS QUALITY; 
CREATE TABLE QUALITY 
(
	Name			varchar(80) NOT NULL,
	KarmaCost		integer,
	Drawbacks		varchar(500),
	Benefits		varchar(500),
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS QUALITY_LIST; 
CREATE TABLE QUALITY_LIST 
(
	Quality_FK		varchar(80) NOT NULL, -- Unique name for each user
	Character_FK	varchar(80) NOT NULL, -- Used to authorize access
	User_FK			varchar(80) NOT NULL,
	PRIMARY KEY	(Quality_FK, Character_FK, User_FK),
	FOREIGN KEY (Quality_FK) REFERENCES QUALITY(Name),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK)
);

DROP TABLE IF EXISTS SPRITE_TYPE;
CREATE TABLE SPRITE_TYPE
(
	Name				varchar(80)	NOT NULL,
	SleazeModifier		integer,
	AttackModifier		integer,
	FirewallModifier	integer,
	DataProcessingModifier integer,
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS SPRITES;
CREATE TABLE SPRITES
(
	idCode			integer 	NOT NULL, -- randomly generated
	Name			varchar(80),
	Character_FK	varchar(80),
	User_FK			varchar(80),
	TypeID_FK		integer,
	TypeName_FK		varchar(80),	
	Level			integer,
	Services		integer,
	Registered		boolean,
	Damage			integer,
	PRIMARY KEY (idCode),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (TypeName_FK) REFERENCES SPRITE_TYPE(Name)
);

DROP TABLE IF EXISTS ITEM; -- if table has already been made, it will be deleted
CREATE TABLE ITEM -- make new table (or replace the one just dropped)
(
	Name			varchar(80) 	NOT NULL, 	-- unique name for item
	Description		varchar(1000), 				-- what the item does
	Availability	integer,					-- how hard to find item
	Cost			integer,					-- amount needed to purchase
	Legality		varchar(1),					-- Legal (L), Illegal (F), Requires License (R),
	PRIMARY KEY (Name),
	CONSTRAINT check_Item_Legal CHECK (Legality IN ('L', 'F', 'R')) -- only these values can be used
);

DROP TABLE IF EXISTS INVENTORY; -- if table has already been made, it will be deleted
CREATE TABLE INVENTORY -- make new table (or replace the one just dropped)
(
	Character_FK	varchar(80) 	NOT NULL, -- Owning character
	User_FK			varchar(80)		NOT NULL, -- User of character
	Item_FK			varchar(80) 	NOT NULL, -- Item name
	PRIMARY KEY	(Character_FK, Item_FK, User_FK), -- inventory will link 1 character with N items
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Item_FK) REFERENCES ITEM(Name)
);

DROP TABLE IF EXISTS MELEE;
CREATE TABLE MELEE
(
	Name			varchar(80) 	NOT NULL, 	-- unique name for item
	Description		varchar(1000), 				-- what the item does
	Availability	integer,					-- how hard to find item
	Cost			integer,					-- amount needed to purchase
	Legality		varchar(1),					-- Legal (L), Illegal (F), Requires License (R),
	CONSTRAINT check_Melee_Legal CHECK (Legality IN ('L', 'F', 'R')),
	SkillUsed		varchar(1),
	CONSTRAINT check_Melee_Skill CHECK (SkillUsed IN ('B','C','U','E')),
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
	Legality		varchar(1),					-- Legal (L), Illegal (F), Requires License (R),
	CONSTRAINT check_Ranged_Legal CHECK (Legality IN ('L', 'F', 'R')),
	SkillUsed		varchar(1),
	CONSTRAINT check_Ranged_Skill CHECK (SkillUsed IN ('A','L','P','R','G','H','E','T')),
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
	Legality		varchar(1),
	CONSTRAINT check_Drone_Legal CHECK (Legality IN ('L', 'F', 'R')),
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
DROP TABLE IF EXISTS DRONE_MELEE_WEAPONS;
CREATE TABLE DRONE_MELEE_WEAPONS
(
	Drone_FK			varchar(80), 
	Weapon_FK			varchar(80),
	PRIMARY KEY (Drone_FK, Weapon_FK), 
	FOREIGN KEY (Drone_FK) REFERENCES DRONE(Name),
	FOREIGN KEY (Weapon_FK) REFERENCES MELEE(Name)
);

DROP TABLE IF EXISTS DRONE_RANGED_WEAPONS;
CREATE TABLE DRONE_RANGED_WEAPONS
(
	Drone_FK			varchar(80), 
	Weapon_FK			varchar(80),
	PRIMARY KEY (Drone_FK, Weapon_FK), 
	FOREIGN KEY (Drone_FK) REFERENCES DRONE(Name),
	FOREIGN KEY (Weapon_FK) REFERENCES RANGED(Name)
);

DROP TABLE IF EXISTS UNIQUE_ITEM;		-- A character's own version of another item
CREATE TABLE UNIQUE_ITEM
(
	Item_FK			varchar(80),		-- Item the unique item is based off
	Character_FK	varchar(80),		-- Owner of unique item
	User_FK			varchar(80),		-- User that created owning character
	Rating			integer,			-- how powerful or useful
	Capacity		integer,			-- a measurement of how many subitems can be held
	CapacityType	Varchar(10),			
	Notes			varchar(500),		-- notes on that particular item
	PRIMARY KEY (Item_FK, Character_FK, User_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Item_FK) REFERENCES ITEM(Name)
);

DROP TABLE IF EXISTS AUGMENTATION;
CREATE TABLE AUGMENTATION
(
	Item_FK			varchar(80),		-- Item the augmentation is based off
	Character_FK	varchar(80),		-- Owner of aug
	User_FK			varchar(80),
	Rating			integer,			-- how powerful or useful
	Capacity		integer,			-- a measurement of how many subitems can be held
	CapacityType	varchar(10),			
	Notes			varchar(500),		-- notes on that particular item
	EssenceCost		float,				-- cost for augmentation
	Grade			varchar(10),		-- tier of aug, which effects essence cost
	PRIMARY KEY (Item_FK, Character_FK, User_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Item_FK) REFERENCES ITEM(Name)
);

DROP TABLE IF EXISTS SUBITEM;
CREATE TABLE SUBITEM
(
	Name			varchar(80)		NOT NULL,
	Legality		varchar(1),
	CONSTRAINT check_Sub_Legal CHECK (Legality IN ('L', 'F', 'R')),
	Description		varchar(1000),
	Availability	integer,
	Cost			integer,
	CapacityUsed	integer,
	CapacityType	varchar(10),
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS CYBERDECK_MODEL;
CREATE TABLE CYBERDECK_MODEL
(
	Name				varchar(80)		NOT NULL,
	Legality			varchar(1),
	CONSTRAINT check_CD_Legal CHECK (Legality IN ('L', 'F', 'R')),
	Description			varchar(1000),				-- What the item does
	Availability		integer,
	Cost				integer,
	CyberArray			varchar(4),					-- 4 numbers for attack, sleaze, firewall, or data processing
	CyberdeckRating		integer,
	ProgramCapacity		integer,
	PRIMARY KEY (Name)
);

DROP TABLE IF EXISTS PERSONAL_CYBERDECK; -- Inherits from Unique Item
CREATE TABLE PERSONAL_CYBERDECK
(
	Character_FK				varchar(80)	NOT NULL,	-- Owner of aug
	User_FK						varchar(80)	NOT NULL,
	Rating						integer, 
	Capacity					integer,
	CapacityType				varchar(10),
	Notes						varchar(500),
	MatrixPersonaDescription	varchar(500),
	ModelName_FK				varchar(80),	-- Reference to Cyberdeck Model
	PRIMARY KEY (ModelName_FK, Character_FK, User_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (ModelName_FK) REFERENCES CYBERDECK_MODEL(Name)
);

DROP TABLE IF EXISTS DECK_CONFIGURATION;
CREATE TABLE DECK_CONFIGURATION
(
	Number			integer			NOT NULL,		-- order in which configurator programs were added, start at 0 and increment		-- user that created character
	Attack			integer, /*TODO: min is 1*/		-- Attack stat
	Sleaze			integer, /*min is 1*/			-- Sleaze stat
	Firewall		integer, /*min is 1*/			-- Firewall Stat, for defense
	DataProcessing	integer, /*min is 1*/			-- Used for matrix initiative and actions
	PRIMARY KEY (Number)
);

DROP TABLE IF EXISTS CONFIGURATOR;
CREATE TABLE CONFIGURATOR
(
	Number						integer NOT NULL,		-- order in which configurator programs were added
	Deck_Configuration_FK		integer, 
	Character_FK				varchar(80),
	User_FK						varchar(80), 
	ModelName_FK				varchar(80),
	PRIMARY KEY (Deck_Configuration_FK, Character_FK, User_FK, ModelName_FK, Number),
	FOREIGN KEY (Deck_Configuration_FK) REFERENCES DECK_CONFIGURATION(number),
	FOREIGN KEY (ModelName_FK) REFERENCES PERSONAL_CYBERDECK(ModelName_FK),
	FOREIGN KEY (User_FK) REFERENCES PERSONAL_CYBERDECK(User_FK),
	FOREIGN KEY (Character_FK) REFERENCES PERSONAL_CYBERDECK(Character_FK)
);

DROP TABLE IF EXISTS SUBITEM_LIST;
CREATE TABLE SUBITEM_LIST
(
	Item_FK varchar(80),
	Character_FK varchar(80),
	User_FK varchar(80),
	Name_FK varchar(80),
	PRIMARY KEY(Item_FK, Character_FK, Name_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES CHARACTERS(Username_FK),
	FOREIGN KEY (Name_FK) REFERENCES SUBITEM(Name),
	FOREIGN KEY (Item_FK) REFERENCES ITEM(Name)
);