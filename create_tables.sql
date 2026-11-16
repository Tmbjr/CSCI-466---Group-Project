/*****************************************************************************
CSCI 466-1                     GROUP PROJECT                    DUE: 13NOV2026

PROGRAMMERS: Tom Bernstein     - z2017107
             Shawn DeCorrevont - z1979724
             Kyler Dunn        - z2067174

PURPOSE:    The purpose of this script is to create the tables required to be
            used by the Karaoke Management System, in accordance with the 
            ER-Diagram and resulting relational schema that the group
            developed.
******************************************************************************/

DROP TABLE IF EXISTS ContributesTo, Request, Version, Song, Artist, Contributor,
                     User;

CREATE TABLE Artist (
AID         INT PRIMARY KEY AUTO_INCREMENT,
Artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE Contributor (
CID         INT PRIMARY KEY AUTO_INCREMENT,
Contr_name  VARCHAR(50) NOT NULL
);

CREATE TABLE Song (
SID         INT PRIMARY KEY AUTO_INCREMENT,
Song_name   VARCHAR(50) NOT NULL,
AID         INT NOT NULL,
FOREIGN KEY (AID) REFERENCES Artist(AID)
);

CREATE TABLE Version (
KFileID      INT PRIMARY KEY AUTO_INCREMENT,
Version_desc VARCHAR(50) NOT NULL,
File_name    VARCHAR(50) NOT NULL,
SID          INT NOT NULL,
FOREIGN KEY  (SID) REFERENCES Song(SID)
);

CREATE TABLE User(
UserID      INT PRIMARY KEY AUTO_INCREMENT,
User_name   VARCHAR(50) NOT NULL
);

CREATE TABLE Request (
ReqID        INT PRIMARY KEY AUTO_INCREMENT,
Date_time    DATETIME NOT NULL,
Payment_amt  FLOAT,
Request_type VARCHAR(4) NOT NULL,
KFileID      INT NOT NULL,
UserID       INT NOT NULL,
FOREIGN KEY (KFileID) REFERENCES Version(KFileID),
FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE ContributesTo(
CID         INT NOT NULL,
SID         INT NOT NULL,
Contr_desc  VARCHAR(50),
PRIMARY KEY (CID, SID),
FOREIGN KEY (CID) REFERENCES Contributor(CID),
FOREIGN KEY (SID) REFERENCES Song(SID)
);
