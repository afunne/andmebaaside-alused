CREATE DATABASE protseduurTahmazovV2;

Create table linn(
LinnId int Primary Key identity(1,1),
LinnNimi varchar(30),
rahvaArv int);

Select * from linn;

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
EXEC lisalinn @lnimi = 'Megalinn', @rArv=999

-- uue veeru lisamine
ALTER TABLE linn ADD test int;
-- veeru kustutamine
ALTER TABLE linn DROP COLUMN test;

CREATE PROCEDURE veerulisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null

AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus = case
when @valik='add' then concat('ALTER TABLE linn ADD ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('ALTER TABLE linn DROP COLUMN ', @veerunimi)
END;
print @sqltegevus;
begin
EXEC (@sqltegevus);
END
END;


--kutse
EXEC veerulisaKustuta @valik='add', @veerunimi='test3', @tyyp='int';
SELECT *FROM linn;

EXEC veerulisaKustuta @valik='drop', @veerunimi='test3';
SELECT * FROM linn;


CREATE PROCEDURE veerulisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null

AS
BEGIN
Declare @sqltegevus as varchar(max)
set @sqltegevus = case
when @valik='add' then concat('ALTER TABLE ', @tabelinimi, '  ADD  ',    @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('ALTER TABLE ', @tabelinimi, '  DROP COLUMN  ',    @veerunimi)
END;
print @sqltegevus;
begin
EXEC (@sqltegevus);
END
END;

--kutse
EXEC veerulisaKustutaTabelis @valik='add', @tabelinimi='linn', @veerunimi = 'test3' ,@tyyp='int';
SELECT *FROM linn;

EXEC veerulisaKustutaTabelis @valik='drop', @tabelinimi='linn', @veerunimi = 'test3';
SELECT * FROM linn;

--protseduur tingimusega
Create procedure rahvaHinnang


AS
BEGIN
SELECT linnNimi, rahvaArv, IIF(rahvaArv<1000, 'väike linn', 'suur linn') as hinnang
FROM linn;

END;

DROP procedure rahvaHinnang;

EXEC rahvaHinnang 2000;
--Agregaat funktsioonid: SUM(), AVG(), MIN(), MAX(), COUNT()

CREATE PROCEDURE kokkuRahvaarv

AS
BEGIN
SELECT SUM(rahvaArv) AS 'kokku rahvaArv', AVG(rahvaArv) AS 'keskimine rahvaArv', count(*) AS 'linnade arv'
FROM linn;
END;

EXEC kokkuRahvaarv;






----- task -----
CREATE DATABASE arvaLoodust;

Create table puu(
puuId int Primary Key identity(1,1),
puudeHulk int,
puuNimi varchar(30),
puuKõrgus int);

-- seeing it
Select * from puu;
-- deleting it if I am confused 
DROP TABLE puu;
-- I wasn't told how to add so :P
Insert into puu(puudeHulk, puuNimi, puuKõrgus)
values (1, 'MegaTree', 200)

Insert into puu(puudeHulk, puuNimi, puuKõrgus)
values (2, 'Honourtree', 30)

Insert into puu(puudeHulk, puuNimi, puuKõrgus)
values (3, 'ObagTree', 20)

-- Created a procedure to count and calculate (what I have been told)
CREATE PROCEDURE kokkuPuu

AS
BEGIN
SELECT count(*) AS 'puu arv', AVG(puuKõrgus) AS 'keskimine puu kõrgus', MAX(puuKõrgus) AS 'maximum puuKõrgus', Min(puuKõrgus) AS 'minimum puuKõrgus'
FROM puu;
END;

EXEC kokkuPuu;

-- adding more tress
CREATE PROCEDURE AddMoreTrees
@pHulk int,
@pnimi varchar(30),
@pKõrgus int
AS
BEGIN
Insert into puu(puudeHulk, puuNimi, puuKõrgus)
values (@pHulk, @pnimi, @pKõrgus);
SELECT * from puu

END;

-- adding more
EXEC AddMoreTrees @pHulk = 4, @pnimi='obamium', @pKõrgus=56


DELETE FROM puu WHERE puuID=4;

--Now... DESTROYING THEM   >:3
CREATE PROCEDURE BurningDownTheTress
@deleteID int
AS
BEGIN
SELECT * from puu;
DELETE FROM puu WHERE puuID=@deleteID;
SELECT * from puu;

END;

drop procedure BurningDownTheTress;

--DESTROY
EXEC BurningDownTheTress 5;








----- adding into XMAAPP codes of the task -----
Create table puu(
puuId int Primary Key AUTO_INCREMENT,
puudeHulk int,
puuNimi varchar(30),
puuKõrgus int);
