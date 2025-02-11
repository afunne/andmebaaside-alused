CREATE DATABASE veateade;
use veateade;
CREATE TABLE test(
id int,
nimi varchar)

ALTER TABLE test add primary key (id);
ALTER TABLE test alter column id int not null;

--CREATE TABLE test(
--id int,
--nimi varchar;

--Insert into test(id, nimi)
--VALUES (1, 'test');

Insert into Test(id, nimi)
VALUES (1, 'test');

SELECT * FROM test;

ALTER TABLE test alter column nimi varchar(25);

CREATE PROCEDURE lisaTest
@nimi varchar(25),
@id int
AS
BEGIN
Insert into test(id, nimi)
values (@nimi, @id);
SELECT * from test

END;

drop procedure lisaTest;

DROP TABLE test;
