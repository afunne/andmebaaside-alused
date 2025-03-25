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

insert into kategooria(kategooria_nimi)
values ('supid'),
('munad'),
('jöökid'),
('söökid'),
('riided');

create table Toiduaine(
tuiduaine_id int primary key identity(1,1),
tuiduaine_nimi varchar(100));

select * from Toiduaine

insert into Toiduaine(tuiduaine_nimi)
values ('juust'),
('sool'),
('piim'),
('suhkur'),
('leib');

create table yhik(
yhik_id int primary key identity(1,1),
yhik_nimi varchar(100));

select * from yhik 

insert into yhik(yhik_nimi)
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
