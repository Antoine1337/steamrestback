
DROP TABLE IF EXISTS Utilisateurs;
CREATE TABLE Utilisateurs (
    UtilisateurID INTEGER PRIMARY KEY AUTOINCREMENT,
    NomUtilisateur TEXT NOT NULL UNIQUE,
    Email TEXT NOT NULL UNIQUE,
    DateInscription DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create a table for games
DROP TABLE JEUX;
CREATE TABLE Jeux (
    JeuID INTEGER PRIMARY KEY AUTOINCREMENT,
    Titre TEXT NOT NULL,
    Developpeur TEXT NOT NULL,
    Editeur TEXT NOT NULL,
    DateSortie DATE,
    Image TEXT NOT NULL,
    Prix REAL NOT NULL
);

-- Create a table for purchases
DROP TABLE ACHATS;
CREATE TABLE Achats (
    AchatID INTEGER PRIMARY KEY AUTOINCREMENT,
    UtilisateurID INTEGER NOT NULL,
    JeuID INTEGER NOT NULL,
    DateAchat DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UtilisateurID) REFERENCES Utilisateurs(UtilisateurID),
    FOREIGN KEY (JeuID) REFERENCES Jeux(JeuID)
);

DROP TABLE BIBLIOTHEQUEJEUX;
CREATE TABLE BibliothequeJeux (
    UtilisateurID INTEGER NOT NULL,
    JeuID INTEGER NOT NULL,
    HeuresJeu INTEGER DEFAULT 0,
    EstInstalle BOOLEAN DEFAULT 0,
    FOREIGN KEY (UtilisateurID) REFERENCES Utilisateurs(UtilisateurID),
    FOREIGN KEY (JeuID) REFERENCES Jeux(JeuID),
    UNIQUE (UtilisateurID, JeuID) -- Ensure a user can't have duplicate entries for the same game
);

-- Insert data into Utilisateurs table with signup dates
INSERT INTO Utilisateurs (NomUtilisateur, Email, DateInscription) VALUES
('Alice', 'alice@example.com', '2003-09-15 10:30:00'),
('Bob', 'bob@example.com', '2010-06-20 14:45:00'),
('Charlie', 'charlie@example.com', '2015-03-10 09:15:00'),
('Diana', 'diana@example.com', '2018-11-25 16:00:00'),
('Eve', 'eve@example.com', '2022-07-05 12:00:00');

-- Insert data into Jeux table
INSERT INTO Jeux (Titre, Developpeur, Editeur, DateSortie, Prix, Image) VALUES
('The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Nintendo', '2017-03-03', 59.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/118601-1.jpg'),
('Cyberpunk 2077', 'CD Projekt Red', 'CD Projekt', '2020-12-10', 49.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/14517-1.jpg'),
('Minecraft', 'Mojang Studios', 'Mojang Studios', '2011-11-18', 26.95, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/50424-1.jpg'),
('The Witcher 3: Wild Hunt', 'CD Projekt Red', 'CD Projekt', '2015-05-19', 39.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/33255-1.jpg'),
('Stardew Valley', 'ConcernedApe', 'ConcernedApe', '2016-02-26', 14.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/35320-1.png'),
('Elden Ring', 'FromSoftware', 'Bandai Namco', '2022-02-25', 59.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/65101-1.jpg'),
('Hollow Knight', 'Team Cherry', 'Team Cherry', '2017-02-24', 14.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/43548-1.jpg'),
('Red Dead Redemption 2', 'Rockstar Games', 'Rockstar Games', '2018-10-26', 59.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/66595-1.jpg'),
('Among Us', 'Innersloth', 'Innersloth', '2018-11-16', 4.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/77267-1.jpg'),
('Celeste', 'Maddy Makes Games', 'Maddy Makes Games', '2018-01-25', 19.99, 'https://cdn.thegamesdb.net/images/thumb/boxart/front/53935-1.jpg');

-- Insert data into Achats table with purchase dates
INSERT INTO Achats (UtilisateurID, JeuID, DateAchat) VALUES
(1, 1, '2017-03-10 12:00:00'),
(1, 3, '2012-01-15 14:00:00'),
(2, 2, '2021-01-05 10:30:00'),
(2, 4, '2016-06-01 09:00:00'),
(3, 5, '2016-03-01 11:45:00'),
(3, 6, '2022-03-01 15:30:00'),
(4, 7, '2018-12-01 13:00:00'),
(4, 8, '2019-01-10 16:20:00'),
(5, 9, '2022-08-01 10:00:00'),
(5, 10, '2022-08-15 14:30:00');

-- Insert data into BibliothequeJeux table
INSERT INTO BibliothequeJeux (UtilisateurID, JeuID, HeuresJeu, EstInstalle) VALUES
(1, 1, 20, 1), 
(1, 3, 50, 1),
(2, 2, 15, 0),
(2, 4, 30, 1),
(3, 5, 40, 1),
(3, 6, 10, 0),
(4, 7, 25, 1), 
(4, 8, 35, 1),
(5, 9, 5, 0),
(5, 10, 12, 1);
