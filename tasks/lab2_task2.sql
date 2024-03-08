
-- 1
--use Company_SD;
select * from Employee;

-- 2
select Fname, Lname, Salary, Dno 
from Employee;

-- 3 
--select * from Project;

select Pname, Plocation, Dname
from Project p , Departments d
where p.Dnum = d.Dnum;

-- 4

--select * from Employee;

select Fname + ' '+ Lname as FullName , Salary + ((Salary*10)/100) as [ANNUAL COMM]
from Employee;

-- 5
--select * from Employee;

select SSN , Fname + ' '+ Lname as FullName
from Employee
where Salary > 1000;

-- 6
select SSN , Fname + ' '+ Lname as FullName
from Employee
where Salary * 12 > 1000;


-- 7
select  Fname + ' '+ Lname as FullName , Salary
from Employee
where Sex  = 'F';

-- 8

select Dnum , Dname
from Departments
where MGRSSN = 968574;

-- 9 

select Pname, Pname, Plocation
from Project
where Dnum = 10;