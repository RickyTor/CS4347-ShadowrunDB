USE srdb; 

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
	idCode				integer		NOT NULL,
	Name				varchar(80)	NOT NULL,
	SleazeModifier		integer,
	AttackModifier		integer,
	FirewallModifier	integer,
	PRIMARY KEY (idCode, Name)
);

DROP TABLE IF EXISTS SPRITES;
CREATE TABLE SPRITES
(
	idCode			integer 	NOT NULL, -- randomly generated
	Name			varchar(80) NOT NULL,
	Character_FK	varchar(80) NOT NULL,
	User_FK			varchar(80)	NOT NULL,
	TypeID_FK		integer 	NOT NULL,
	TypeName_FK		varchar(80)	NOT NULL,
	Level			integer,
	Services		integer,
	Registered		boolean,
	Damage			integer,
	PRIMARY KEY (idCode, Name, Character_FK, User_FK, TypeID_FK, TypeName_FK),
	FOREIGN KEY (Character_FK) REFERENCES CHARACTERS(Name),
	FOREIGN KEY (User_FK) REFERENCES Characters(Username_FK),
	FOREIGN KEY (TypeID_FK) REFERENCES SPRITE_TYPE(idCode),
	FOREIGN KEY (TypeName_FK) REFERENCES SPRITE_TYPE(Name)
);