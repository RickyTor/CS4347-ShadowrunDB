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
	CONSTRAINT check_Priority CHECK (PriorityA IN ('R', 'A', 'M', 'S', 'N')),
	PriorityB 		varchar(1),
	CONSTRAINT check_Priority CHECK (PriorityB IN ('R', 'A', 'M', 'S', 'N')),
	PriorityC 		varchar(1),
	CONSTRAINT check_Priority CHECK (PriorityC IN ('R', 'A', 'M', 'S', 'N')),
	PriorityD 		varchar(1),
	CONSTRAINT check_Priority CHECK (PriorityD IN ('R', 'A', 'M', 'S', 'N')),
	PriorityE 		varchar(1),
	CONSTRAINT check_Priority CHECK (PriorityE IN ('R', 'A', 'M', 'S', 'N')),
	Username_FK 	varchar(80) NOT NULL,
	Primary Key (Name, Username_FK),
	Foreign Key (Username_FK) References USERS(Username)
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
	-- FOREIGN KEY (Tradition_FK) REFERENCES TRADITION(Name),
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
