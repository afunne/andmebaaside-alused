--AB loomine
Create database TahmazovBaas;

use TahmazovBaas;
CREATE TABLE opilane(
opilaneID int primary key identity (1,1),
eesnimi varchar(25) not null,
perenimi varchar (25) not null,
synniaeg date,
stip bit,
aadres text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabilisse

INSERT INTO opilane(eesnimi,
perenimi,
synniaeg,
stip,
keskmine_hinne)
VALUES(
'Nikita',
'Nikita',
'2000-12-12',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2000-12-12',
1,
4.5),
(
'Nikita3',
'Nikita3',
'2000-12-12',
1,
4.5),
(
'Nikita4',
'Nikita4',
'2000-12-12',
1,
4.5),
(
'Nikita5',
'Nikita5',
'2000-12-12',
1,
4.5)

--tabeli kustutamine
drop table opilane;
--rida kustutamine, kus on opilaneId=2
DELETE FROM opilane WHERE opilaneId=2;
select * from opilane;

--andmete uuendamine
UPDATE opilane SET aadres='Tartu'
WHERE opilaneId=3

CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
select * from language;

INSERT INTO Language(ID, Code, Language)
VALUES (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'),
(4, 'DE', 'saksa')

Create table keeleValik(
keeleValikId int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int,
Foreign key (opilaneId) references opilane(opilaneId),
Language int,
foreign key (language) references language(ID)
)
select * from keelevalik;
select * from Language;
select * from opilane;

INSERT INTO keelevalik(valikuNimetus, opilaneId, Language)
Values ('valik B', 2, 3)

SELECT opilane.eesnimi, Language.Language
FROM opilane, Language, keelevalik
WHERE opilane.opilaneId=keelevalik.opilaneId
AND Language.ID=keelevalik.Language

Create table oppimine(
oppimineidId int primary key identity(1,1),
aine varchar(10) not null,
aasta int,
opetaja varchar(10),
opilaneId int,
foreign key (oppimineidId) references opilaneId(ID)
)

INSERT INTO oppimineidId(valikuNimetus, opilaneId, Language)
Values ('valik B', 2, 3)


select * from oppimine;
--- vigane kood
