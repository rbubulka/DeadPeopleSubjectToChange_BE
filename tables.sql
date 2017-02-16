USE test

DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Kills;
DROP TABLE IF EXISTS CharacterSeries;
DROP TABLE IF EXISTS Series;
DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS Universes;
DROP TABLE IF EXISTS Publishers;

CREATE TABLE Publishers (
    P_name VARCHAR(30),
    H_name VARCHAR(30),
    Img_URL VARCHAR(255),
    PRIMARY KEY(P_name)
);

CREATE TABLE Universes (
    U_name VARCHAR(30),
    Size VARCHAR(30),
    P_name VARCHAR(30),
    Img_URL VARCHAR(255),
    Location VARCHAR(100),
    FOREIGN KEY (P_name)
    REFERENCES Publishers(P_name),
    PRIMARY KEY (U_name)
);

CREATE TABLE Characters (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    P_name VARCHAR(30),
    C_name VARCHAR(30) NOT NULL,
    Img_URL VARCHAR(255),
    PRIMARY KEY(ID)
);

CREATE TABLE Series (
    S_name VARCHAR(30),
    U_name VARCHAR(30),
    P_name VARCHAR(30),
    Img_URL VARCHAR(255),
    FOREIGN KEY (U_name)
    REFERENCES Universes(U_name),
    FOREIGN KEY (P_name)
    REFERENCES Publishers(P_name),
    PRIMARY KEY (S_name)
);

CREATE TABLE CharacterSeries (
    S_name VARCHAR(30),
    C_ID MEDIUMINT,
    FOREIGN KEY (S_name)
    REFERENCES Series(S_name),
    FOREIGN KEY (C_ID)
    REFERENCES Characters(ID),
    CONSTRAINT sc_ID PRIMARY KEY (S_name, C_ID)
);

CREATE TABLE Kills (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    KillerID MEDIUMINT,
    KilledID MediumInt,
    Img_URL VARCHAR(255),
    Issue VARCHAR(50),
    Dsc VARCHAR(255),
    FOREIGN KEY (KillerID)
    REFERENCES Characters(ID),
    FOREIGN KEY (KilledID)
    REFERENCES Characters(ID),
    PRIMARY KEY(ID)
);

CREATE TABLE Users (
    Username VARCHAR(30) NOT NULL,
    Password CHAR(32) NOT NULL,
    Role VARCHAR(30) NOT NULL,
    PRIMARY KEY(Username)
);

CREATE TABLE Ratings (
    Username VARCHAR(30) NOT NULL,
    KID MEDIUMINT NOT NULL,
    Value INT,
    FOREIGN KEY (Username)
    REFERENCES Users(Username),
    FOREIGN KEY (KID)
    REFERENCES Kills(ID),
    CONSTRAINT unID PRIMARY KEY(Username, KID)
);

