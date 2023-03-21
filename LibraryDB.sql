#Drop database library;
DROP DATABASE IF EXISTS Library;
CREATE DATABASE Library;

USE Library;

#Drop tables in library database if they already exists;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Patron;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Copy;
DROP TABLE IF EXISTS CheckInOut;


# Table creation! Create Tables with Foreign Keys after the referenced tables are created!

CREATE TABLE Author
	(AuthorID INT NOT NULL AUTO_INCREMENT, 
	 AuthorName varchar(30),
     PRIMARY KEY (AuthorID)
	);
    
CREATE TABLE Section
	(SectionID int NOT NULL AUTO_INCREMENT, 
	 SectionName varchar(30),
     PRIMARY KEY (SectionID)
	);
    
CREATE TABLE Genre
	(GenreID int NOT NULL AUTO_INCREMENT, 
	 GenreName varchar(30),
     PRIMARY KEY (GenreID)
	);
    
CREATE TABLE Patron
	(PatronID int NOT NULL AUTO_INCREMENT, 
     Patron_First_Name varchar(30),
     Patron_Last_Name varchar(30),
     Phone_Number varchar(30),
	 FinesOwed int NULL,
     PRIMARY KEY (PatronID)
	);

CREATE TABLE Book
	(BookID int NOT NULL AUTO_INCREMENT, 
	 Title varchar(30),
     Published_Year int, 
     AuthorID int,
     SectionID int,
     GenreID int,
     PRIMARY KEY (BookID),
     FOREIGN KEY(GenreID) REFERENCES Genre(GenreID) ON DELETE CASCADE, 
     FOREIGN KEY(AuthorID) REFERENCES Author(AuthorID) ON DELETE SET NULL,
     FOREIGN KEY(SectionID) REFERENCES Section(SectionID) ON DELETE CASCADE
	);
    
CREATE TABLE Location
	(LocationID int NOT NULL AUTO_INCREMENT, 
	 Location_Name varchar(30),
     PRIMARY KEY (LocationID)
	);

CREATE TABLE Copy
	(CopyID int NOT NULL AUTO_INCREMENT, 
	 BookID int,
	 LocationID int, 
     IS_Borrowed varchar(30),
     PRIMARY KEY (CopyID),
		FOREIGN KEY(LocationID) REFERENCES Location(LocationID) ON DELETE SET NULL,
        FOREIGN KEY(BookID) REFERENCES Book(BookID) ON DELETE CASCADE
	);



CREATE TABLE CheckInOut
	(CheckInOutID int NOT NULL AUTO_INCREMENT,
	 PatronID int,
     CopyID int,
     Check_In_Date date NULL,
     Check_Out_Date date,
     PRIMARY KEY (CheckInOutID),
		FOREIGN KEY(PatronID) REFERENCES Patron(PatronID) ON DELETE CASCADE,
        FOREIGN KEY(CopyID) REFERENCES Copy(CopyID) ON DELETE CASCADE
	);



INSERT Author VALUES
(NULL,'J.K.Rolling'),
(NULL,'Katie Mack'),
(NULL,'J.D.Salinger'),
(NULL,'Shirley Jackson'),
(NULL,'William Shakespeare'),
(NULL,'William Shakespeare'),
(NULL,'George Orwell');


INSERT Genre VALUES
(NULL,'Fiction'),
(NULL,'Science'),
(NULL,'Literature'),
(NULL,'Horror'),
(NULL,'Drama'),
(NULL,'Drama'),
(NULL,'Fiction');

INSERT Section VALUES
(NULL,'F'),
(NULL,'S'),
(NULL,'L'),
(NULL,'H'),
(NULL,'D'),
(NULL,'D'),
(NULL,'F');


INSERT Patron VALUES
(NULL,'Alex', 'Jeff', '91 91 92 92', '22'),
(NULL,'Amy','Schimmer', '01 21 32 42', '54'),
(NULL,'George', 'Jeff', '32 45 44 88', '66'),
(NULL,'Josephine', 'Gregory', '33 11 56 44', '80'),
(NULL,'Ana', 'Cordilia', '23 88 99 00', '12'),
(NULL,'Jonas', 'Joe', '11 22 45 78', '50'),
(NULL,'Carlos', 'Kevin', '45 32 11 56', '44'),
(NULL,'Maria', 'John', '23 11 32 88', '21');

INSERT Book VALUES
(NULL,'Harry Potter','2006', '1', '1', '1'),
(NULL,'Quantum Mechanics','1999', '2', '2', '2'),
(NULL,'The Catcher in the Rye','1651', '3', '3', '3'),
(NULL,'The Haunting of Hill House','1959', '4', '4', '4'),
(NULL,'Macbeth','1651', '5', '5', '5'),
(NULL,'A Midsummer Nights Dream','1595', '6', '6', '6'),
(NULL,'Nineteen Eighty-Four','1949', '7', '7', '7');

INSERT Location VALUES
(NULL,'Library'),
(NULL,'Reserved'),
(NULL,'Checked Out');

INSERT Copy VALUES
(NULL,'3','3','Yes'),
(NULL,'1','1','No'),
(NULL,'4','2','Will be picked up'),
(NULL,'2','1','No'),
(NULL,'5','3','Yes'),
(NULL,'6','1','No');



INSERT CheckInOut VALUES
(NULL,'1','1',NULL,'2023-03-19'),
(NULL,'2','3','2023-03-21','2023-03-10'),
(NULL,'4','5','2023-03-20','2023-03-01');





SELECT * FROM Author;
SELECT * FROM Genre;
SELECT * FROM Section;
SELECT * FROM Patron;
SELECT * FROM Book;
SELECT * FROM Location;
SELECT * FROM Copy;
SELECT * FROM CheckInOut;
SHOW tables;