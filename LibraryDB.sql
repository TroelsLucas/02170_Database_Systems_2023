
CREATE DATABASE Library;


USE Library;
# Table creation! Create Tables with Foreign Keys after the referenced tables are created!


CREATE TABLE Book
	(BookID int, 
	 Title varchar(30),
     PublishedYear int, 
     AuthorID int,
     SectionID int,
     GenreID int,
     PRIMARY KEY (BookID),
		FOREIGN KEY(GenreID) REFERENCES Genres(GenreID) ON DELETE CASCADE, 
        FOREIGN KEY(AuthorID) REFERENCES Authors(AuthorID) ON DELETE SET NULL,
        FOREIGN KEY(SectionID) REFERENCES Sections(SectionID) ON DELETE CASCADE
	);
    
CREATE TABLE Authors
	(AuthorID int, 
	 AuthorName varchar(30),
     PRIMARY KEY (AuthorID)
	);

CREATE TABLE Copies
	(CopyID int, 
	 BookID int,
	 SectionID int, 
     PRIMARY KEY (CopyID),
		FOREIGN KEY(SectionID) REFERENCES Sections(SectionID) ON DELETE CASCADE,
        FOREIGN KEY(BookID) REFERENCES Book(BookID) ON DELETE CASCADE
	);

CREATE TABLE Sections
	(SectionID int, 
	 SectionName varchar(30),
     PRIMARY KEY (SectionID)
	);

CREATE TABLE Genres
	(GenreID int, 
	 GenreName varchar(30),
     PRIMARY KEY (GenreID)
	);

CREATE TABLE Patrons
	(PatronID int, 
     PatronName varchar(30),
     ContactInfo varchar(30),
	 FinesOwed int NULL,
     PRIMARY KEY (PatronID)
	);

CREATE TABLE CheckInOut
	(PatronID int,
     CopyID int,
     DueDate date,
		FOREIGN KEY(PatronID) REFERENCES Patrons(PatronID) ON DELETE SET NULL,
        FOREIGN KEY(CopyID) REFERENCES Copies(CopyID) ON DELETE SET NULL
	);

CREATE TABLE Reservations (
    ReservationID int,
    PatronID int,
    CopyID int,
    PickUpDate date,
    PRIMARY KEY (ReservationID),
    FOREIGN KEY(PatronID) REFERENCES Patrons(PatronID) ON DELETE SET NULL,
    FOREIGN KEY(CopyID) REFERENCES Copies(CopyID) ON DELETE SET NULL
);
SHOW tables;

