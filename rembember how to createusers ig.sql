create database DirectorDream
use DirectorDream;

create table movie(id int primary key identity(1,1), movieNimi varchar(50), movieYear int, movieCost varchar(30))
insert into movie(movieNimi, movieYear, movieCost)
values ('Dibbert and Sons', 2003, '1,56');

drop table movie;

----- ülisane puu -----
create table Defect( id int primary key AUTO_INCREMENT, probleem varchar(100), lisadate date, prioriteet varchar(50))
