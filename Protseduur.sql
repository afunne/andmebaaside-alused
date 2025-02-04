(localdb)\mssqllocaldb
--SQL salvestatud protseduur - funktioon, mis käivutab serviris mitu SQL tegevus järjest.
Kasutame SQL server


Create database protseduurTahmazov;

use protseduurTahmazov;
Create table linn(
LinnId int Primary Key identity(1,1),
LinnNimi varchar(30),
rahvaArv int);

Select * from linn;

Insert into linn(LinnNimi, rahvaArv)
values ('Tallinn', 60000)

Insert into linn(LinnNimi, rahvaArv)
values ('Parnu', 30000)

--Protseduuri loomine
--protseduur, mis lisab uus linn ja kohe näitab tabelis

CREATE PROCEDURE lisaLinn
@lnimi varchar(30),
@rArv int
AS
BEGIN
Insert into linn(LinnNimi, rahvaArv)
values (@lnimi, @rArv);
SELECT * from linn

END;

--protseduuri kutse
EXEC lisalinn @lnimi = 'Tartu', @rArv=1256

EXEC lisalinn @lnimi = 'Tartu aga super', @rArv=23323

EXEC lisalinn @lnimi = 'Tallin 2.0', @rArv=445555

EXEC lisalinn @lnimi = 'Tartu', @rArv=1256
--lihtsam
EXEC lisalinn 'Tartu2.0', 1256

--kirje kustututamine
DELETE FROM linn WHERE linnID=3;

--prodseduur, mis kutsutab linn id järgi
CREATE PROCEDURE kutsutaLinn
@deleteID int
AS
BEGIN
SELECT * from linn;
DELETE FROM linn WHERE linnID=3;
SELECT * from linn;

END;

--kutse
EXEC kutsutaLinn 3;
--proceduri kutsutamine
DROP Procedure kutsutaLinn;

--Protseduur, mis otsib linn esimese tähte järge
CREATE PROCEDURE linnaOtsing
@taht char(1)
AS
BEGIN
SELECT * from linn
WHERE linnNimi LIKE @taht + '%';
--% - kõik teised tähted
END;
--kutse
EXEC linnaOtsing T;

--tabeli uuendamine + rahvaavr kasvab 10 % värra
UPDATE linn SET rahvaArv=rahvaArv*1.1
SELECT * FROM linn;
UPDATE linn SET rahvaArv=rahvaArv*1.1
WHERE LinnId=2;

CREATE PROCEDURE rahvaArvuUuendus
@linnID int,
@koef decimal(2,1)
AS
BEGIN
SELECT * FROM linn
UPDATE linn SET rahvaArv=rahvaArv*@koef
WHERE LinnId=LinnId;
select * from linn;
END;

--destroying everything >:3
DROP PROCEDURE rahvaArvuUuendus;

EXEC rahvaArvuUuendus 7, 1.2;

----------------------------------------------------- XAMPP my beloved -----------------------------------------------------
Kasutama XAMPP/localhost

Create table linn(
LinnId int Primary Key AUTO_INCREMENT,
LinnNimi varchar(30),
rahvaArv int);

Insert into linn(LinnNimi, rahvaArv)
values ('Tallinn', 60000);

CREATE PROCEDURE `lisaLinn`(IN `lnimi` VARCHAR(30), IN `rArv` INT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN Insert into linn(LinnNimi, rahvaArv) values (lnimi, rArv); SELECT * from linn; END;


BEGIN
SELECT * from linn;
DELETE FROM linn WHERE linnID=deleteID;
SELECT * from linn;

END;


BEGIN
SELECT * from linn
WHERE linnNimi LIKE CONCAT(@taht, '%');
END;


BEGIN
SELECT * FROM linn;
UPDATE linn SET rahvaArv=rahvaArv*koef
WHERE LinnId=id;
select * from linn;
END




  
--------------------------------------------- new data base in HD quality (protsidurid) ---------------------------------------------
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
'Hussein',
'Tractovich',
'2000-12-12',
1,
4.5),
(
'Ligma',
'Ligmavich',
'2000-12-12',
1,
3.6),
(
'Nikita',
'Kitiran',
'2000-12-12',
0,
2.6),
(
'Djanko',
'Freeman',
'2000-12-12',
1,
5.0),
(
'Rizza',
'Skat',
'2000-12-12',
0,
3.5)

-- putting here in existing table new values
CREATE PROCEDURE IntoNimiTab
@enimi varchar(25),
@pnimi varchar(25),
@saeg date,
@tip bit,
@khinne decimal(2,1)
AS
BEGIN
INSERT INTO opilane(eesnimi,
perenimi,
synniaeg,
stip,
keskmine_hinne)
values (@enimi, @pnimi, @saeg, @tip, @khinne);

SELECT * from opilane

END;

EXEC IntoNimiTab @enimi = 'Tatar', @pnimi = 'Dekar', @saeg = '2001-9-12', @tip = 1, @khinne = 4.3

-- Deleting (whatever or specifited line) you want
CREATE PROCEDURE kutsutaNimTab
@deleteID int
AS
BEGIN
SELECT * from opilane;
DELETE FROM opilane WHERE opilaneID=@deleteID
SELECT * from opilane;

END;

--droping the procuder
DROP PROCEDURE kutsutaNimTab

--show me pls
SELECT * from opilane;

--d e l e t i n g >:3
EXEC kutsutaNimTab 3;

--findind out with first letters
CREATE PROCEDURE NimiOtsing
@taht char(1)
AS
BEGIN
SELECT * from opilane
WHERE eesnimi LIKE @taht + '%';
--% - kõik teised tähted
END;
--kutse
EXEC NimiOtsing R;


--tabeli uuendamine + rahvaavr kasvab 10 % värra/okay I did whatever works here ik it is not 10% but values here cna be changed
UPDATE opilane SET keskmine_hinne=keskmine_hinne*1.1
SELECT * FROM opilane;

UPDATE opilane SET keskmine_hinne=keskmine_hinne*1.1
WHERE opilaneId=2;

SELECT * FROM opilane;


CREATE PROCEDURE opilaneArvuUuendus
@opilaneID int,
@koef decimal(2,1)
AS
BEGIN
SELECT * FROM opilane
UPDATE opilane SET keskmine_hinne=keskmine_hinne*@koef
WHERE opilaneId=opilaneId;
select * from opilane;
END;

DROP PROCEDURE opilaneArvuUuendus;

EXEC opilaneArvuUuendus 7, 1.2;
