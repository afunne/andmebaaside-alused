create database triger2tabelid;
use triger2tabelid;

--tabel toode ja toodakategooria on seotud oma vahel
create table toodeKategooria(
toodeKategooriaID int not null primary key identity(1,1),
toodekategooria varchar(100) unique,
kirjeldus text
);

create table toode(
toodeID int not null primary key identity(1,1),
toodeNimetus varchar(100) unique,
hind decimal(5,2),
toodeKategooriaID int,
foreign key (toodeKategooriaID)
references toodeKategooria(toodekategooriaID)
);

insert into toodeKategooria(toodekategooria)
values ('meelelahutus'), ('joogid'), ('toit'), ('riided'), ('liha');

insert into toodeKategooria(toodekategooria)
values ('vantasteishon');

insert into toode(toodeNimetus, hind, toodeKategooriaID)
values ('kino', 10, 1), ('cola', 1,2), ('doshik', 0.99, 3), ('skidatels', 5, 4), ('sealiha', 2, 5);



select * from toodeKategooria
select * from toode;

--
select toodenimetus, toodekategooria from toode
inner join toodekategooria on toodeKategooria.toodeKategooriaID = toode.toodeKategooriaID

select toodenimetus, toodekategooria from toode
inner join toodekategooria on toodeKategooria.toodeKategooriaID = toode.toodeKategooriaID

select tk.toodekategooria, max(t.hind)
from toode t
inner join toodekategooria tk on t.toodeKategooriaID = tk.toodeKategooriaID
group by tk.toodekategooria

select tk.toodekategooria, count(t.toodeNimetus) as toode_kogus
from toode t
inner join toodekategooria tk on t.toodeKategooriaID = tk.toodeKategooriaID
group by tk.toodekategooria

--
select tk.toodekategooria, cast(avg(t.hind) as decimal(5,2)) as avg_hind
from toode t
inner join toodeKategooria tk
on t.toodeKategooriaID=tk.toodeKategooriaID
group by tk.toodekategooria

--
select tk.toodekategooria, t.toodeNimetus
from toodekategooria tk
left join toode t on t.toodeKategooriaID = tk.toodeKategooriaID
where t.toodeKategooriaID is NULL

select toodenimetus, hind from toode
where hind > (select avg(hind) from toode)

-- VIEW

-- Loo vaade, mis kuvab ainult toodete nime ja hinna.
select * from toodeKategooria
select * from toode;

CREATE VIEW [hinnad] AS
SELECT toodeNimetus, Hind
FROM toode

SELECT * FROM [hinnad];

drop VIEW [hinnad]

-- Loo vaade, mis näitab kõiki tooteid koos kategooria nimega.
insert into toode(toodeNimetus, hind, toodeKategooriaID)
values ('nothing', 0, );

CREATE VIEW [kateegoridega] AS
SELECT toodeNimetus, Hind
FROM toode
where toodeKategooriaID is null

SELECT * FROM [kateegoridega];


--create VIEW saadav_toode
--as
--select *from toode 
--where toode.toodeID is not null

--select * from saadav_toode;

alter table toode
add aktiivne bit

update toode set aktiivne = 1;

select * from toode;

update toode set aktiivne = 0
where toodeid = 2;

create view saadav_toode
as select * from toode where aktiivne = 1

select * from saadav_toode;

-- Loo vaade, mis koondab info: kategooria nimi, toodete arv, minimaalne ja maksimaalne hind.

create view vaade_KategooriaStatistika as 
select tk.toodeKategooria,
count(t.toodeID) as tooteArv,
cast(min(t.hind) as decimal(5, 1)) as minHind,
cast(max(t.hind) as decimal(5, 1)) as maxHind
from toode t
inner join toodeKategooria tk on t.toodeKategooriaID = tk.toodeKategooriaID
group by tk.toodeKategooria;

select * from vaade_KategooriaStatistika


-- see oli minu versioon

-- see on Mr.Litvenenko versioon

-- Loo vaade, mis arvutab toode käibemaksu (24%) ja iga toode hind käibemaksuga.
create view toode_kaibemaksuga as
select toodenimetus,
hind,
cast((hind * 0.24) as decimal(5,2)) as 'kaibemaks',
cast((hind * 1,24) as decimal(5,2)) as 'hind_kaibimaksa'

from toode

select * from toode_kaibemaksuga

-- Loo protseduur, mis lisab uue toote (sisendparameetrid: tootenimi, hind, kategooriaID).

create procedure toodesse_panna
@toodeNimetus varchar(200),
@hind int,
@toodeKategooriaID int,
@aktiivne bit
as
begin
insert into toode(toodeNimetus, hind, toodeKategooriaID, aktiivne)
values(@toodeNimetus, @hind, @toodeKategooriaID, @aktiivne);
select * from toode
end;

drop procedure toodesse_panna

exec toodesse_panna 'pepsi cola', 1, 2, 0;

-- Loo protseduur, mis uuendab toote hinda vastavalt tooteID-le.

create procedure uuendmine_hind
@toodeID int,
@hind decimal(5,2)
as
begin
select * from toode;
update toode set hind=@hind
where toodeID=@toodeID
select * from toode;
end;

exec uuendmine_hind @hind = 4, @toodeID = 3;

-- Loo protseduur, mis kustutab toote ID järgi.

create procedure KustutaToode
@toodeID int
as
begin
delete from toode
where toodeID = @toodeID
select * from toode
end;


exec KustutaToode @toodeID=2

create procedure LeiaToodekategooriaJargi
@kategooria varchar(30)
as
begin
select toodeKategooria, toodeNimetus, hind
from toode t
inner join toodeKategooria tk on t.toodeKategooriaID=tk.toodeKategooriaID
where tk.toodekategooria = @kategooria
end;
