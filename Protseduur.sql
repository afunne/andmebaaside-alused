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

-----------------------------------------------------
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



