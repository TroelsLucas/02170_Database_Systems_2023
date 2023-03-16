CREATE DATABASE Library
GO

USE Library

CREATE TABLE Books (
    BookID int PRIMARY KEY, 
    Title varchar(30),
    PublishedYear int, 
    AuthorID varchar(30)
);
CREATE TABLE Authors (
    AuthorID int PRIMARY KEY,
    AuthorName varchar(30)
);
CREATE TABLE Copies (
    CopyID int PRIMARY KEY,
    BookID int,
    Section varchar(30)
);
CREATE TABLE Sections (
    SectionID int PRIMARY KEY,
    SectionName varchar(30)
);
CREATE TABLE Genres (
    GenreID int PRIMARY KEY,
    GenreName varchar(30)
);
CREATE TABLE Patreon (
    PatreonID int PRIMARY KEY,
    PatreonName varchar(30),
    ContactInfo varchar(30) NULL,
    FinesOwed int NULL
);
CREATE TABLE CheckInOut (
    PatreonID int,
    CopyID int,
    DueDate varchar(30)
);
CREATE TABLE Reservations (
    ReservationID int PRIMARY KEY,
    PatreonID int,
    CopyID int,
    DuePickUpDate varchar(30)
)
GO