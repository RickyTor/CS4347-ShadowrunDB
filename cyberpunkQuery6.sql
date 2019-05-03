-- prints off physical characters
SELECT Username, Name, body, agility, reaction, strength, physicaldamage, stundamage, overflowdamage
FROM USERS, CHARACTERS, PHYSICAL_CHARACTER
WHERE USERS.Username = CHARACTERS.Username_FK AND CHARACTERS.Name = PHYSICAL_CHARACTER.character_fk;
-- prints off AI characters
SELECT Username, Name, matrixdepth, coredamage
FROM USERS, CHARACTERS, AI
WHERE USERS.Username = CHARACTERS.Username_FK AND CHARACTERS.Name = AI.character_fk;
-- prints off Magic User Characters
SELECT Username, Name, magicrating, initiationlevel, tradition_fk
FROM USERS, CHARACTERS, MAGIC_USER
WHERE USERS.Username = CHARACTERS.Username_FK AND CHARACTERS.Name = MAGIC_USER.character_fk;
-- prints off Technomancer Characters
SELECT Username, Name, resonance, submersion
FROM USERS, CHARACTERS, TECHNOMANCER
WHERE USERS.Username = CHARACTERS.Username_FK AND CHARACTERS.Username_FK = TECHNOMANCER.charactercreator_fk;
-- prints off Metasapient Characters 
SELECT Username, Name, magicrating
FROM USERS, CHARACTERS, METASAPIENT
WHERE USERS.Username = CHARACTERS.Username_FK AND CHARACTERS.Name = METASAPIENT.character_fk;
