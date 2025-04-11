select * from Employees
Select * from Department

--seosed - joint
--füüsiline seos - on lisatud Foreign key  (constraint - piirang näiteks kontrollida diagramm)
--loogiline seos - kui õigesti kirjetatada select joiniga

--JOIN 
select * from Employees JOIN Department
ON Employees.DepartmentId=Department.Id;

--kirjutame lihtsamaks
select e.Name, e.Salary, d.DepartmentName
from Employees e JOIN Department d
ON e.DepartmentId=d.Id;

--inner join sama nagu lihtne join
--näitab kõik deparment, kus on olemas väärtus
select e.Name, e.Salary, d.DepartmentName
from Employees e INNER JOIN Department d
ON e.DepartmentId=d.Id;
--left join
--Näitab kõike DepartmentName (Null väärtused)
select e.Name, e.Salary, d.DepartmentName
from Employees e LEFT JOIN Department d
ON e.DepartmentId=d.Id;
--right join
-- näitab Departname, kus Nime on null
--rigth jont = rigth outer join
--Võtmesõna RIGHT JOIN tagastab kõik kirjed paremast 
--tabelist (tabel2) ja vastavad kirjed vasakpoolsest tabelist (tabel1). 
--Tulemuseks on 0 kirjet vasakult poolt, kui ei ole ühtegi sobivat kirjet.
select e.Name, e.Salary, d.DepartmentName
from Employees e RIGHT JOIN Department d
ON e.DepartmentId=d.Id;
--outer join = outer full join
--näitab kõik väärtused kahest tabelist
select e.Name, e.Salary, d.DepartmentName
from Employees e
full outer join  Department d on e.DepartmentId = d.Id
--cross join
--näitab nii, et 1.tabeli väärtused * 2.tabeli väärtused
select e.Name, d.DepartmentName from Employees e
CROSS JOIN Department d

-- Näidata ainult need isikud, kellel departmentName on null
select e.Name, d.DepartmentName
from Employees e LEFT JOIN Department d
ON e.DepartmentId=d.Id
WHERE d.DepartmentName is Null;

Alter table employees ADD managerID int;

select * from Employees

update Employees set managerID=2
where Gender = 'Male';

--tabel manager
create table manager(
id int primary key,
managerName varchar(25))

insert into manager(id, managerName)
VALUES (1, 'Roman'), (2, 'Nikita')

select * from manager;
select * from Employees;

--Ülasane
--join
select * from Employees JOIN manager
ON Employees.DepartmentId=manager.Id;
--inner join
select e.Name, d.ManagerName
from Employees e INNER JOIN Manager d
ON e.DepartmentId=d.Id;
--left join
select e.Name, m.managerName
from Employees e LEFT JOIN manager m
ON e.DepartmentId=m.Id;
--right join
select e.Name, m.managerName
from Employees e right JOIN manager m
ON e.DepartmentId=m.Id;
--outer join
select e.Name, d.managerName
from Employees e
full outer join  manager d on e.DepartmentId = d.Id
--cross join
select e.Name, m.managerName from Employees e
CROSS JOIN manager m
