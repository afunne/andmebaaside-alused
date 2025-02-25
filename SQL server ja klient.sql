---SQL Sever
--Security-->Login-->new login

create database UusKlient

Create table kasutaja(
kasutajaID int primary key identity(1,1),
kasutajaNimi varchar(100),
KasutajaRoll varchar(100))
