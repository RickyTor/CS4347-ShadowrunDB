SELECT Username, Name, TotalKarma, KarmaSpent, TotalFunds, FundsSpent
FROM USERS, CHARACTERS
WHERE USERS.Username = CHARACTERS.Username_FK;

SELECT Username, Name, Willpower, Logic, Intuition, Charisma, Edge, EdgeAvailable, Essence, PriorityA, PriorityB, PriorityC, PriorityD, PriorityE
FROM USERS, CHARACTERS
WHERE USERS.Username = CHARACTERS.Username_FK;
