use [SD32-Company];

-- Department
--- 1

create table Department(
DeptNo nchar(5) primary key,
DeptName nchar(20),
Location locDT
)

--- 2

sp_addtype locDT,'nchar(2)';

create rule loc as @x in('NY','DS','KW');
sp_bindrule Loc,locDT;

create default def1 as 'NY';
sp_bindefault def1,locDT;

-- Employee
--- 1

create table Employee(
EmpNo int,
DeptNo nchar(5),
Salary int,
EmpFname nchar(20),
EmpLname nchar(20)

constraint c1 primary key(EmpNo),
constraint c2 foreign key (DeptNo) references Department(DeptNo),
constraint c3 unique(Salary),
constraint c4 check(EmpFname is not null)
)

create rule r2Salary as @s>6000;
sp_bindrule r2Salary,'Employee.Salary';

-- Project
--- 1 
-- project and works_on table create by design not coding

alter table Works_on add constraint c5 primary key(EmpNo, projectNo);

--------------------------
-- add data

insert into Department values
('d1', 'Research', 'NY'),
('d2', 'Accounting', 'DS'),
('d3', 'Markiting', 'KW');


insert into Employee values
(25348, 'Mathew', 'Smith', 'd3', 2500),
(10102, 'Ann', 'Jones', 'd3', 3000),
(18316,'John' ,'Barrimore','d1',2400),
(29346, 'James', 'James', 'd2' ,2800),
(2581,'Elisa' ,'Hansel', 'd2',3600),
(28559,'Sybl' ,'Moser' ,'d1' ,2900);


insert into Project values
('p1' ,'Apollo', 120000),
('p2' ,'Gemini', 95000),
('p3', 'Mercury', 185600);



insert into works_on values
(10102, 'p1' ,'Analyst' ,'2006.10.1'),
(10102, 'p3' ,'Manager' ,'2012.1.1'),
(25348 ,'p2' ,'Clerk' ,'2007.2.15');


--- Testing Referential Integrity
-- 1

insert into works_on values
(11111, 'p1', 'name', '2004.10.5'); -- Error as the EmpNo FK did not exist in employee table as PK

-- 2

update works_on
set EmpNo = 11111
where EmpNo = 10102; -- it will fail as 11111 did not exist in employee table

-- 3

update Employee
set EmpNo = 11111
where EmpNo = 10102; -- error as the update rule is no action by default so i have to update the refrence in other table to enable me to update the PK

-- 4

delete from Employee
where EmpNo = 10102;  -- error as the delete rule is no action by default so i have to delete the refrence in other table to enable me to delete the PK



--- Table modification

-- 1

alter table Employee
add TelephoneNumber int;

alter table Employee
drop column TelephoneNumber;

-----------------------------------------------------------------------

-- 2
create schema Company;

alter schema Company transfer Department;


create schema Human_Resource;

alter schema Human_Resource transfer Company.Employee;

-----------------------------------
-- 3
select 
    constraint_name, 
    constraint_type
from 
    information_schema.table_constraints
where 
    table_name = 'Employee';


-- 4
create synonym EMP for Employee;
create synonym EMP1 for Human_Resource.Employee;

Select * from Employee; -- error as Employee in  Human_Resource schema not dbo
Select * from Human_Resource.Employee; -- the only valid query as it the original name for the table 
Select * from EMP; -- error as the EMP refer to Employee not Human_Resource.Employee
Select * from Human_Resource.EMP; -- error i think becuase the Emp has dbo schema by default

Select * from EMP1;

-- SELECT * FROM INFORMATION_SCHEMA.TABLES

-- 5

update project
set Budget += (Budget*20)/100
where projectNo in(
select projectNo
from works_on w
where EmpNo = 10102
);

-- 6

update Company.Department
set DeptName = 'Sales'
where DeptNo in (
select DeptNo
from Human_Resource.Employee e
where concat(e.EmpFname, ' ', e.EmpLname) = 'James works'
);
 
-- 7

update works_on
set Enter_Date = '12.12.2007'
where EmpNo in (
select EmpNo 
from Human_Resource.Employee e inner join Company.Department d
on e.DeptNo = d.DeptNo
where d.DeptNo = 'p1' and d.DeptName = 'Sales'
);

-- 8

delete works_on
where EmpNo in (
select EmpNo 
from Human_Resource.Employee e inner join Company.Department d
on e.DeptNo = d.DeptNo
where d.Location = 'KW' 
);

