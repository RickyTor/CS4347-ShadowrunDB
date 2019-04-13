/*
	Using to test one table at a time, 
	instead of rebuilding the whole database each time.
*/

USE srdb;



DROP TABLE IF EXISTS CONFIGURATOR;
CREATE TABLE CONFIGURATOR
(
	Number			integer			NOT NULL,		-- order in which configurator programs were added
	Character_FK	varchar(160)	NOT NULL,		
	PRIMARY KEY (Number, Character_FK)
	-- ,FOREIGN KEY (Character_FK) REFERENCES CHARACTER(Username, Name);
);