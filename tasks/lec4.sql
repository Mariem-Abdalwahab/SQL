use Company_SD;

--DQL

--- 1

select d.Dependent_name, d.Sex
from Dependent d inner join Employee e
on E.SSN = D.ESSN and e.Sex = 'F' and d.Sex = 'F' 
union all
select d.Dependent_name, d.Sex
from Dependent d inner join Employee e
on E.SSN = D.ESSN and e.Sex = 'M' and d.Sex = 'M';

--- 2

select  p.Pname, sum(w.Hours)
from Project p inner join Works_for w
on p.Pnumber = w.Pno
group by p.Pname;

---3

select *
from Departments
where Dnum = (
	select Dno
	from Employee
	where SSN = (
		select  min(SSN)
		from Employee));

--- 4

select min(Salary), max(Salary)
from Employee
group by Dno;


select Dname, min(e.Salary), max(e.Salary), avg(e.Salary)
from Employee e inner join Departments d
on e.Dno = d.Dnum
group by d.Dname;

--- 5

select Lname
from Employee where SSN = 
(select d.MGRSSN
from Departments d
where d.MGRSSN not in (select ESSN
from Dependent));

---6 

select avg(Salary) as Average , d.Dname, d.Dnum ,count(SSN) as[Number of employees]
from Employee e inner join Departments d
 on d.Dnum = e.Dno 
 group by d.Dnum , d.Dname
 having avg(Salary) <(select avg(Salary)
from Employee);

/*select avg(Salary)
from Employee;*/ -- 1650

--- 7

select e.*, p.*
from Departments d inner join Project p
on d.Dnum = p.Dnum
inner join Employee e 
on e.Dno = d.Dnum
order by d.Dname  ,e.Lname ,e.Fname;

--- 8

select Salary
from Employee 
where salary >=
(select max(Salary)
from Employee 
where Salary <(
select max(Salary)
from Employee ))
order by Salary desc;

--- 9

select  e.Fname + ' ' + e.Lname
from Employee e , Dependent d
where e.Fname + ' ' + e.Lname = d.Dependent_name;

--- 10

update Employee
set Salary += (Salary * 30 )/100
where Dno = 
(select Dnum
from Project
where Pname = 'Al Rabwah');

--- 11
select e.SSN, e.Fname
from Employee e
where exists (
select ESSN from Dependent
where ESSN = e.SSN)


-- DML
--- 1

insert into Departments
(Dname, Dnum, MGRSSN, [MGRStart Date])
values('DEPT IT', 100, 112233, '1-11-2006');

--- 2 

update Departments
set MGRSSN = 968574
where Dnum = 100;

update Departments
set MGRSSN = 102672
where Dnum = 20;

update Employee
set Dno =
(select Dnum from Departments where MGRSSN = 102672),
Superssn =102672
where SSN = 102660;

--- 3

--- dependents


delete from Dependent
where exists (select 1 from Dependent where ESSn = 223344) and Essn = 223344;


update Departments
set MGRSSN = 102672
where exists (select 1 from Departments 
where MGRSSN = 223344) and MGRSSN = 223344;

update Employee
set Superssn = 102672
where exists 
(select 1 from Employee 
where Superssn = 223344) 
and Superssn = 223344;


update Employee
set Dno = (select Dno from Employee where SSN = 223344)
where exists 
(select 1 from Employee 
where Dno  = (select Dno from Employee where SSN = 223344))
and SSN = 102672;


update Works_for
set ESSn = 102672
where  ESSn = 223344;




delete from Employee where SSN = 223344;


