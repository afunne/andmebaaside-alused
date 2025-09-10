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
values ('meelelahutus');
insert into toodeKategooria(toodekategooria)
values ('joogid');
select * from toodeKategooria
insert into toode(toodeNimetus, hind, toodeKategooriaID)
values ('kino', 10, 1);

select t.toodeNimetus, t.hind, tk.toodekategooria from toode t
inner join toodeKategooria tk
on t.toodeKategooriaID=tk.toodeKategooriaID;

--trigerite loomine
--tabel logi
Create table logi(
logiID int not null primary key identity (1,1),
kuupaev datetime,
kasutaja varchar(100),
andmed text
)

---triger mis jaögib insert-lisamine tabelisse
create trigger toodeLisamine
ON toode
for insert
as
insert into logi(kuupaev, kasutaja, andmed)
select
GETDATE(),
SYSTEM_USER,
concat(inserted.toodeNimetus,', ', inserted.hind,', ', tk.toodekategooria)
from inserted
inner join toodeKategooria tk
on inserted.toodeKategooriaID=tk.toodeKategooriaID;

--kontroll
insert into toode(toodeNimetus, hind, toodeKategooriaID)
values ('teater', 100, 1);

insert into toode(toodeNimetus, hind, toodeKategooriaID)
values ('õunamahl', 1.5, 2);

select * from toode;
select * from logi;

---triger mis jaögib delete-kustutamine tabelisse
create trigger toodeKustutamine
ON toode
for delete
as
insert into logi(kuupaev, kasutaja, andmed)
select
GETDATE(),
SYSTEM_USER,
concat('kustutatud tabelist: ',deleted.toodeNimetus,', ', deleted.hind,', ', tk.toodekategooria)
from deleted
inner join toodeKategooria tk
on deleted.toodeKategooriaID=tk.toodeKategooriaID;

drop trigger toodeKustutamine



--kontroll
delete from toode where toodeID=1;
select * from toode;
select* from logi;

---triger mis jaögib update-Uuendamine tabelisse
create trigger toodeUuendamine
ON toode
for update
as
insert into logi(kuupaev, kasutaja, andmed)
select
GETDATE(),
SYSTEM_USER,
concat('vanad: ',deleted.toodeNimetus,', ', deleted.hind,', ', tk1.toodekategooria,
'|| uued: ',inserted.toodeNimetus,', ', inserted.hind,', ', tk2.toodekategooria)
from deleted
inner join inserted ON deleted.toodeID=inserted.toodeID
inner join toodeKategooria tk1
ON deleted.toodeKategooriaID=tk1.toodeKategooriaID
inner join toodeKategooria tk2
ON inserted.toodeKategooriaID=tk2.toodeKategooriaID;

drop trigger toodeUuendamine

--kontroll
update toode set toodeNimetus='cola', toodeKategooriaID=2
where toodeID=3;
select*from toode;
select * from logi;

CREATE TRIGGER toodLisamineJaKustutamine
ON toode
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO logi(kuupaev, kasutaja, andmed)
    SELECT
	GETDATE(),
    SUSER_NAME(), -- nagu SYSTEM_USER  
    CONCAT('Lisanud tood: ', inserted.toodeNimetus,
    ', elanike arv: ', inserted.toodeKategooriaID) 
    FROM inserted
 
    UNION ALL
 
    SELECT
	GETDATE(),
    SUSER_NAME(), 
    CONCAT('Kutsutud tood: ', deleted.toodeNimetus,
    ', elanike arv: ', deleted.toodeKategooriaID) 
    FROM deleted;
END

--Diaktiveerib päästiku
DISABLE TRIGGER toodeLisamine
ON toode;

DISABLE TRIGGER toodeKustutamine
ON toode;

insert into toode(toodeNimetus, hind, toodeKategooriaID)
values ('SillyGooberEnergetik', 0.99, 2);

delete from toode where toodeID=2;
select * from toode;
select* from logi;
