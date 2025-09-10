create database AI_Lab;
use AI_Lab;

--tabelid
create table models(
ModelID int not null primary key identity (1,1),
ModelName varchar(100),
Accuracy varchar(4)
);

insert into models(ModelName, Accuracy)
values ('rizzRobot4', '90%');

create table costumers(
costumerID int not null primary key identity(1,1),
costumerName varchar(100) unique,
ModelID int,
foreign key (ModelID)
references models(ModelID)
);

insert into costumers(costumerName, ModelID)
values ('Erick Castle4', 3);

create table logi(
logiID int not null primary key identity (1,1),
kuupaev datetime,
kasutaja varchar(100),
andmed text
);

drop table logi;

--Trigerid:

--Trigger 1 - Lisamine
create trigger trg_InsertModel
ON costumers
for insert
as
insert into logi(kuupaev, kasutaja, andmed)
select
GETDATE(),
SYSTEM_USER,
concat(inserted.costumerName, ',lisanud: ', tk.ModelName)
from inserted
inner join models tk
on inserted.ModelID=tk.ModelID;

--trigger 2
create trigger trg_DeleteModel
ON costumers
for delete
as
insert into logi(kuupaev, kasutaja, andmed)
select
GETDATE(),
SYSTEM_USER,
concat(deleted.costumerName, ',Kutsutatud: ', tk.ModelName)
from deleted
inner join models tk
on deleted.ModelID=tk.ModelID;

drop trigger trg_DeleteModel;
drop trigger trg_InsertModel;

-- kontroll
insert into models(ModelName, Accuracy)
values ('rizzRobot4', '90%');

insert into costumers(costumerName, ModelID)
values ('Erick Castle4', 4);

select* from models;
select * from costumers;
select * from logi;

delete from models where ModelID=1;

delete from costumers where costumerID=8;
select* from models;
select * from costumers;
select * from logi;
