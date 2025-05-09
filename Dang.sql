-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-05-09 07:44:09.806

create database datamass
use datamass

-- tables
-- Table: koos_nimi
CREATE TABLE koos_nimi (
    õpetaja_id int  NOT NULL,
    eesnimi varchar(50)  NOT NULL,
    perenimi varchar(50)  NOT NULL,
    CONSTRAINT koos_nimi_pk PRIMARY KEY  (õpetaja_id)
);

insert into koos_nimi (õpetaja_id, eesnimi, perenimi)
values(1,'Marina', 'Olenik'), (2,'Irina', 'Merkulova'), (3,'Julia', 'Kartusinaki')

select * from koos_nimi


-- Table: mida_teevad
CREATE TABLE mida_teevad (
    Õppeaine_id int  NOT NULL,
    õppeaine varchar(50)  NOT NULL,
    CONSTRAINT mida_teevad_pk PRIMARY KEY  (Õppeaine_id)
);

insert into mida_teevad (Õppeaine_id, õppeaine)
values(1,'Andmebaaside alused'), (2,'Kontoritöö'), (3,'Andmebaaside haldus'), (4, 'Operatsioonisüsteemide alused'), (5, 'Arvutiõpetus')

select * from koos_nimi

-- Table: rumh
CREATE TABLE rumh (
    Ruhm_id int  NOT NULL,
    Ruhm varchar(50)  NOT NULL,
    CONSTRAINT rumh_pk PRIMARY KEY  (Ruhm_id)
);

insert into rumh (Ruhm_id, Ruhm)
values(1,'TARpv19'), (2,'LOGITpv18'), (3,'TARpv20')

select * from rumh

-- Table: ruum
CREATE TABLE ruum (
    ruum_id int  NOT NULL,
    ruum varchar(50)  NOT NULL,
    CONSTRAINT ruum_pk PRIMARY KEY  (ruum_id)
);

insert into ruum (ruum_id, ruum)
values(1, 'E10'), (2, 'A-109'), (3, 'A-102'), (4, 'A-104')

select * from ruum

-- Table: tundiplaan
CREATE TABLE tundiplaan (
    tundiplaan_id int  NOT NULL,
    Nädalapaev varchar(50)  NOT NULL,
    tunninr int  NOT NULL,
    Õpejaruhm_koos_id int  NOT NULL,
    mida_teevad_Õppeaine_id int  NOT NULL,
    CONSTRAINT tundiplaan_pk PRIMARY KEY  (tundiplaan_id)
);



-- Table: Õpejaruhm
CREATE TABLE Õpejaruhm (
    koos_id int  NOT NULL,
    rumh_Ruhm_id int  NOT NULL,
    koos_nimi_õpetaja_id int  NOT NULL,
    CONSTRAINT Õpejaruhm_pk PRIMARY KEY  (koos_id)
);

select * from Õpejaruhm

-- foreign keys
-- Reference: tundiplaan_mida_teevad (table: tundiplaan)
ALTER TABLE tundiplaan ADD CONSTRAINT tundiplaan_mida_teevad
    FOREIGN KEY (mida_teevad_Õppeaine_id)
    REFERENCES mida_teevad (Õppeaine_id);

-- Reference: tundiplaan_Õpejaruhm (table: tundiplaan)
ALTER TABLE tundiplaan ADD CONSTRAINT tundiplaan_Õpejaruhm
    FOREIGN KEY (Õpejaruhm_koos_id)
    REFERENCES Õpejaruhm (koos_id);

-- Reference: Õpejaruhm_rumh (table: Õpejaruhm)
ALTER TABLE Õpejaruhm ADD CONSTRAINT Õpejaruhm_rumh
    FOREIGN KEY (rumh_Ruhm_id)
    REFERENCES rumh (Ruhm_id);

-- Reference: õpetaja_id (table: Õpejaruhm)
ALTER TABLE Õpejaruhm ADD CONSTRAINT õpetaja_id
    FOREIGN KEY (koos_nimi_õpetaja_id)
    REFERENCES koos_nimi (õpetaja_id);

select * from tundiplaan

-- End of file.

create database imoofingmyself

use imoofingmyself

drop database imoofingmyself

-- Teachers
CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    "Name" VARCHAR(100)
);

-- Subjects
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(100)
);

-- Groups
CREATE TABLE Groups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(50)
);

-- Rooms
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY,
    RoomName VARCHAR(50)
);

-- Schedule
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    TeacherID INT,
    GroupID INT,
    Day VARCHAR(20),
    LessonNum INT,
    RoomID INT,
    SubjectID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

INSERT INTO Teachers ("Name") VALUES('Marina Oleinik'),('Irina Merkulova'),('Julia Kartusinski');
INSERT INTO Subjects (SubjectName) VALUES('Andmebaaside alused'),('Kontoritöö tarkvara'),('Andmebaaside haldus'),
('Operatsioonisüsteemide alused'),('Arvutiõpetus');
INSERT INTO Groups (GroupName) VALUES('TARpv19'),('LOGITpv18'),('TARpv20');
INSERT INTO Rooms (RoomName) VALUES('E10'),('A-109'),('A-102'),('A-104');

