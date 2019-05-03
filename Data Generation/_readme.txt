Data Generated using: https://mockaroo.com
Show table with command "SELECT * FROM <table name>;"
Filenames are numbered by the correct oreder to insert data, some are dependent on others for foreign keys

There are ~20 characters of each archetype, because the table of characters is a superset of the archetypes.
	1 - 20 : AI
	20 - 40: Magic Users
	40 - 60: Technomancer
	etc.

Existing Data folder has information of existing characters in database
	* Output from command: "SELECT username_fk, name FROM CHARACTERS join USERS where username_fk = username;"
	* This can be imported in mockaroo to create lists with the existing character superkeys