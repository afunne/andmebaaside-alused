Create database retseptiRaamatTahmazov;
use retseptiRaamatTahmazov
create table Kasutaja(
kasutaja_id int primary key identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
email varchar(150));

select * from Kasutaja;

insert into Kasutaja(eesnimi, perenimi, email)
values ('Igor','Pandavich','Megaemail@gmail.ee'),
('Ivan','Stakanovich','Megaemail@gmail.ee'),
('Roman','Karandash','Megaemail@gmail.ee'),
('Aspir','Carous','Megaemail@gmail.ee'),
('Muni','tricolomna','Megaemail@gmail.ee');

create table kategooria(kategooria_id int primary key identity(1,1),
kategooria_nimi varchar(50));

insert into kategooria
values ('supid'),
('munad'),
('jöökid'),
('söökid'),
('riided');

create table Toiduaine(
tuiduaine_id int primary key identity(1,1),
tuiduaine_nimi varchar(100));

select * from Toiduaine

insert into Toiduaine
values ('juust'),
('sool'),
('piim'),
('suhkur'),
('leib');

create table yhik(
yhik_id int primary key identity(1,1),
yhik_nimi varchar(100));

select * from yhik 

insert into yhik
values ('ml'),
('tl'),
('sl'),
('g'),
('gr');

create table Retsept(
retsept_id int primary key identity(1,1),
retsepti_nimi varchar(100),kirjeldus varchar(200),
juhtend varchar(500),
sisestatud_kp date,
Kasutaja int,
foreign key(kasutaja) references Kasutaja(kasutaja_id),
kategooria_id int,
foreign key(kategooria_id) references kategooria(kategooria_id));

select * from Retsept;

-- ma tean te arvate, et ma olen laisk... aga mul pole ideet mida ma pannan siis
insert into Retsept(
retsepti_nimi, kirjeldus, juhtend, sisestatud_kp, kasutaja, kategooria_id)
values ('pasta', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 1, 1),
('Vermicelli', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 2, 2),
('Conchiglie', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 3, 3),
('Farfalle', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 4, 4),
('Linguine', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 5, 5);

insert into Retsept(
retsepti_nimi, kirjeldus, juhtend, sisestatud_kp, kasutaja, kategooria_id)
values ('Vermicelli', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 2, 2),
('Conchiglie', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 3, 3),
('Farfalle', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 4, 4),
('Linguine', 'keeta makaroonid', 'kasutaja elekripliit', '2025-6-17', 5, 5);

select * from Retsept;

create table koostis(
koostis_id int primary key identity(1,1),
retsept_retsept_id int,
koogus int,
yhik int,
yhik_id int,
toiduaine_id int,
foreign key(retsept_retsept_id) references retsept(retsept_id),
foreign key(toiduaine_id) references toiduaine(tuiduaine_id),
foreign key (yhik_id) references yhik(yhik_id))

drop table koostis;

select * from koostis;
select * from Retsept;
select * from yhik;
select * from Toiduaine
select * from Kasutaja;


insert into koostis(koogus, yhik, retsept_retsept_id, toiduaine_id, yhik_id)
values (34,1,1,1,5),
(34,1,2,2,5),
(34,1,3,3,5),
(34,1,4,4,5),
(34,1,5,5,5);

create table tehtud(
tehtud_id int primary key identity(1,1),
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id))

select * from tehtud;

insert into tehtud(tehtud_kp, retsept_id)
values ('2025-6-17', 1),
('2025-6-17', 2),
('2025-6-17', 3),
('2025-6-17', 4),
('2025-6-17', 5);

select * from koostis;
select * from Retsept;
select * from yhik;
select * from Toiduaine
select * from Kasutaja;
select * from tehtud;

------------- uus ülasane -------------
create procedure AddKasutaja
@enimi varchar(50),
@pnimi varchar(50),
@mail varchar(150)
AS
BEGIN
Insert into Kasutaja(eesnimi, perenimi, email)
values (@enimi, @pnimi, @mail);
SELECT * from kasutaja

END;

exec AddKasutaja @enimi='Alan', @pnimi='Iranium', @mail='omegamail@gmail.ee'

create procedure AddRetsept
@Rnimi varchar(100),
@Kir varchar(200),
@Juh varchar(500),
@sise_kp date,
@kas int,
@kat_id int
AS
BEGIN
Insert into Retsept(retsepti_nimi, kirjeldus, juhtend, sisestatud_kp, kasutaja, kategooria_id)
values (@Rnimi, @Kir, @Juh, @sise_kp, @kas, @kat_id);
SELECT * from kasutaja
END;

exec AddRetsept @Rnimi='PastaV2UltraKill', @Kir='keeta makaroonid', @Juh='kasutaja elekripliit', @sise_kp='2025-06-17', @kas=6, @kat_id=6

create procedure UusKoostis
@rets_rets_id int,
@kog int,
@yhik int,
@yhik_id int,
@toid_id int
as
begin
insert into koostis(koogus, yhik, retsept_retsept_id, toiduaine_id, yhik_id)
values (@rets_rets_id, @kog, @yhik, @yhik_id, @toid_id)
select * from koostis

end;

exec UusKoostis @rets_rets_id=6, @kog=34, @yhik =1, @yhik_id = 5, @toid_id = 6

select * from koostis;



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

EXEC veerulisaKustutaTabelis @valik='add', @tabelinimi='koostis', @veerunimi = 'test' ,@tyyp='int';
SELECT *FROM koostis;

EXEC veerulisaKustutaTabelis @valik='drop', @tabelinimi='koostis', @veerunimi = 'test';
SELECT * FROM koostis;



-----------
EXEC veerulisaKustutaTabelis @valik='add', @tabelinimi='Retsept', @veerunimi = 'Retsept' ,@tyyp='int';
SELECT *FROM koostis;

EXEC veerulisaKustutaTabelis @valik='drop', @tabelinimi='Retsept', @veerunimi = 'test';
SELECT * FROM koostis;
-----------



EXEC veerulisaKustutaTabelis @valik='add', @tabelinimi='tehtud', @veerunimi = 'test' ,@tyyp='int';
SELECT *FROM koostis;

EXEC veerulisaKustutaTabelis @valik='drop', @tabelinimi='tehtud', @veerunimi = 'test';
SELECT * FROM koostis;

----- Ülasane 2 --------
create table MidaNadValmistasid(
toid_id int primary key identity(1,1),
toid_nimi varchar(50),
kasutaja_nimi varchar(50),
number int)

drop table MidaNadValmistasid

select * from MidaNadValmistasid;

insert into MidaNadValmistasid(toid_nimi, kasutaja_nimi, number)
values ('PastaSuper', 'Evrika', 7);

CREATE PROCEDURE lisaMidaNadValmistasid
@toidN varchar(50),
@Knimi varchar(50),
@number int
AS
BEGIN
Insert into MidaNadValmistasid(toid_nimi, kasutaja_nimi, number)
values (@toidN, @Knimi, @number);
SELECT * from MidaNadValmistasid

END;


exec lisaMidaNadValmistasid @toidN=OBApasta, @Knimi=Opastal, @number=8


CREATE PROCEDURE Lisaidis
@deleteID int
AS
BEGIN
SELECT * from MidaNadValmistasid;
DELETE FROM MidaNadValmistasid WHERE toid_id=2;
SELECT * from MidaNadValmistasid;

END;

exec Lisaidis 2
