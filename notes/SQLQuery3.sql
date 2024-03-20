------------------------
-- 6

select d.Dnum, d.Dname, count(SSN)
from Departments d inner join Employee e
on d.Dnum = e.Dno
group by d.Dname, d.Dnum
having avg(Salary) < (select avg(salary)
from Employee);


--3

select d.*
from Employee e inner join Departments d
 on d.Dnum = e.Dno
 where e.SSN = (select min(SSN)
 from Employee);

 --4

 select max(Salary)
 from Employee, Departments
 group by dname;

