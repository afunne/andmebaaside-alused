Create database RaamatJaAutorid;
use RaamatJaAutorid;

CREATE TABLE Autorid(
Autori_ID INT primary key identity(1,1),
Eesnimi varchar(40),
Perenimi varchar(40),
Sünniaasta DATE,
Sünnikoht varchar(40),
Rahvus varchar(40),
Elukoht varchar(40),
CV BIT,
Potree varchar(40),
kodulehekülg varchar(40),
);
select * from Autorid;

drop table Autorid;

ALTER TABLE Autorid
ADD FOREIGN KEY (Autori_ID) REFERENCES Autoklus(Autori_ID);

insert into Autorid(Eesnimi, Perenimi, Sünniaasta, Sünnikoht, Rahvus, Elukoht, CV, Potree, kodulehekülg)
values('Kiril', 'Morosov', '15.09.2023', 'Venemaa', 'Vene','Venemaa',1,'pilt', 'kodulehtexc'), ('', '', '', '', '',1, '', '' ), ('', '', '', '', '',1, '', '' ),
('', '', '', '', '',1, '', '' ), ('', '', '', '', '',1, '', '' )

CREATE TABLE Teosed(
Teose_ID INT primary key identity(1,1),
Pealkiri VARCHAR(40),
Ilmumiskoht varchar(60),
Ilmimistaasta DATE,
Lk VARBINARY(MAX),
Liigi_ID varchar(30),
Kirjatus varchar(30),
);
alter table Teosed
add FOREIGN KEY (Teose_ID) REFERENCES Autolkus(Teose_ID),
FOREIGN KEY (Teose_ID) REFERENCES Kasutamine(Teose_ID),
FOREIGN KEY (Teose_ID) REFERENCES mitu_lehekülgede(Teose_ID)

CREATE TABLE Autoklus(
Teosed_ID int,
Autori_ID int,
);

drop table Autoklus;

CREATE TABLE Teose_liik(
Liigi_ID int primary key identity(1,1),
Selgitav_text VARCHAR(40)
);
alter table Teose_liik
add FOREIGN KEY (Liigi_ID) REFERENCES Teosed(Liigi_ID)

CREATE TABLE mitu_lehekülgede(
lehekülgede INT PRIMARY KEY IDENTITY(1, 1),
lehekülgede_arv varchar(40),
Teose_ID varchar(60)
);

--fixing some stuff
CREATE DATABASE RaamatJaAutorid;
USE RaamatJaAutorid;

-- Create Autorid table
CREATE TABLE Autorid(
    Autori_ID INT PRIMARY KEY IDENTITY(1,1),
    Eesnimi VARCHAR(40),
    Perenimi VARCHAR(40),
    Sünniaasta DATE,
    Sünnikoht VARCHAR(40),
    Rahvus VARCHAR(40),
    Elukoht VARCHAR(40),
    CV BIT,
    Potree VARCHAR(40),
    kodulehekülg VARCHAR(40)
);

-- Create Teose_liik table
CREATE TABLE Teose_liik(
    Liigi_ID INT PRIMARY KEY IDENTITY(1,1),
    Selgitav_text VARCHAR(40)
);

-- Create Teosed table
CREATE TABLE Teosed(
    Teose_ID INT PRIMARY KEY IDENTITY(1,1),
    Pealkiri VARCHAR(40),
    Ilmumiskoht VARCHAR(60),
    Ilmimistaasta DATE,
    Lk VARBINARY(MAX),
    Liigi_ID INT,
    Kirjatus VARCHAR(30),
    FOREIGN KEY (Liigi_ID) REFERENCES Teose_liik(Liigi_ID)
);

-- Create Autoklus table
CREATE TABLE Autoklus(
    Teose_ID INT,
    Autori_ID INT,
    FOREIGN KEY (Teose_ID) REFERENCES Teosed(Teose_ID),
    FOREIGN KEY (Autori_ID) REFERENCES Autorid(Autori_ID)
);

-- Create mitu_lehekülgede table
CREATE TABLE mitu_lehekülgede(
    lehekülgede INT PRIMARY KEY IDENTITY(1, 1),
    lehekülgede_arv VARCHAR(40),
    Teose_ID INT,
    FOREIGN KEY (Teose_ID) REFERENCES Teosed(Teose_ID)
);
