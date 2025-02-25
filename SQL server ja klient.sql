---SQL Sever
--Security-->Login-->new login


create database UusKlient
use UusKlient;
Create table kasutaja(
kasutajaID int primary key identity(1,1),
kasutajaNimi varchar(100),
KasutajaRoll varchar(100))

select * from kasutaja

--anname õigus kasutajale opilaneHussein vaadata tabeli auto sisu
GRANT SELECT ON kasutaja TO OpilaneHussein;


select * from kasutaja


insert into kasutaja(KasutajaNimi)
values('test');
CREATE TABLE test(id int)
drop table omanik;
update kasutaja set mark='test'
delete from kasutaja;


--anname õigus kasutajale opilaneHussein vaadata tabeli auto sisu
GRANT SELECT ON kasutaja TO OpilaneHussein;
GRANT Update ON kasutaja TO OpilaneHussein;
--keelata!
DENY DELETE ON kasutaja TO OpilaneHussein;

use UusKlient

--ok look this is very strange that without "use" this WHOLE thing doesn'twork just because :|
