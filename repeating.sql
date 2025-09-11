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
