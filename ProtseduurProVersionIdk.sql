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
EXEC lisalinn @lnimi = 'Tartu', @rArv=1256

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
