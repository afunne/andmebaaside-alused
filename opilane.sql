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
