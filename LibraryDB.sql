DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;

#Drop database library;

USE Library;

DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Sections;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Patrons;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Copies;
DROP TABLE IF EXISTS CheckInOut;
DROP TABLE IF EXISTS Reservations;

# Table creation! Create Tables with Foreign Keys after the referenced tables are created!

CREATE TABLE Authors
	(AuthorID int, 
	 AuthorName varchar(30),
     PRIMARY KEY (AuthorID)
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

CREATE TABLE Book
	(BookID int Primary Key, 
	 Title varchar(30),
     PublishedYear int, 
     AuthorID int,
     SectionID int,
     GenreID int,
     FOREIGN KEY(GenreID) REFERENCES Genres(GenreID) ON DELETE CASCADE, 
     FOREIGN KEY(AuthorID) REFERENCES Authors(AuthorID) ON DELETE SET NULL,
     FOREIGN KEY(SectionID) REFERENCES Sections(SectionID) ON DELETE CASCADE
	);
    

CREATE TABLE Copies
	(CopyID int, 
	 BookID int,
	 SectionID int, 
     PRIMARY KEY (CopyID),
		FOREIGN KEY(SectionID) REFERENCES Sections(SectionID) ON DELETE CASCADE,
        FOREIGN KEY(BookID) REFERENCES Book(BookID) ON DELETE CASCADE
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

INSERT Authors VALUES
('1','J.K.Rolling'),
('2','Katie Mack'),
('3','J.D.Salinger'),
('4','Shirley Jackson'),
('5','William Shakespeare'),
('6','William Shakespeare'),
('7','George Orwell');


INSERT Genres VALUES
('1','Fiction'),
('2','Science'),
('3','Literature'),
('4','Horror'),
('5','Drama'),
('6','Drama'),
('7','Fiction');

INSERT Sections VALUES
('1','F'),
('2','S'),
('3','L'),
('4','H'),
('5','D'),
('6','D'),
('7','F');


INSERT Patrons VALUES
('1','Alex', '91 91 92 92', '22'),
('2','Amy', '01 21 32 42', '54'),
('3','George', '32 45 44 88', '66'),
('4','Josephine', '33 11 56 44', '80'),
('5','Ana', '23 88 99 00', '12'),
('6','Jonas', '11 22 45 78', '50'),
('7','Carlos', '45 32 11 56', '44'),
('8','Maria', '23 11 32 88', '21');

INSERT Book VALUES
('1','Harry Potter','2006', '1', '1', '1'),
('2','Quantum Mechanics','1999', '2', '2', '2'),
('3','The Catcher in the Rye','1651', '3', '3', '3'),
('4','The Haunting of Hill House','1959', '4', '4', '4'),
('5','Macbeth','1651', '5', '5', '5'),
('6','A Midsummer Nights Dream','1595', '6', '6', '6'),
('7','Nineteen Eighty-Four','1949', '7', '7', '7');

SELECT * FROM Authors;
SELECT * FROM Genres;
SELECT * FROM Sections;
SELECT * FROM Patrons;
SELECT * FROM Book;
SHOW tables;