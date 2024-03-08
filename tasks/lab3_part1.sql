use Company_SD
-- 1

select Dnum, Dname, MGRSSN, Fname
from Departments d , Employee e
where d.MGRSSN = e.SSN;

-- 2 

select  Dname, Pname
from Departments d , Project p
where d.Dnum = p.Dnum;

-- 3

select d.*  , e.Fname
from Dependent d inner join Employee e
on d.ESSN = e.SSN;

-- 4

select Pnumber, Pname, Plocation
from Project
where City in ('Alex', 'Cairo');

-- 5

select * from Project
where Pname like 'a%';

-- 6

select * from Employee
where Dno = 30 and Salary between 1000 and 2000;

-- 7

select e.*
from Employee e
inner join Works_for w on e.SSN = w.ESSn
inner join Project p on p.Pnumber = w.Pno
where w.Hours >= 10 and p.Dnum = 10 and p.Pname = 'AL Rabwah';

-- 8 

select X.Fname as employee
from Employee X , Employee Y
where Y.Fname = 'Kamel' and Y.Lname = 'Mohamed' and X.Superssn = Y.SSN;

-- 9

select e.Fname + ' '+ e.Lname , p.Pname
from Employee e inner join Works_for w
on e.SSN = w.ESSn
inner join Project p on p.Pnumber = w.Pno
where w.Pno = p.Pnumber;

-- 10
select p.Pnumber , d.Dname, e.Lname, e.Address, e.Bdate
from Project p 
inner join Departments d 
on p.Dnum = d.Dnum
inner join Employee e on e.SSN = d.MGRSSN
where p.City = 'Cairo';

-- 11

select e.* 
from Employee e, Departments d
where d.MGRSSN = e.SSN;



-- 12

select e.*
from Employee e left join Dependent d
on e.SSN = d.ESSN;

--Data Manipulating Language:

---1
 
insert into Employee
values('mariem', 'abdalwahab', 1022672, '2003/06/25', 'mansoura', 'F', 3000,112233, 30);

---2
insert into Employee
values('Nevien', 'Eldmerdash', 102660, '2002/12/12', 'mansoura', 'F', NULL,NULL, 30);

---3
update Employee
set Salary += (Salary*20)/100
where SSN = 1022672;