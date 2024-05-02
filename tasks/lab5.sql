-- ITI DB

use ITI;

--- 1
select count(St_Age)
from Student
where St_Age is not null;

--- 2

select distinct Ins_Name
from Instructor;

--- 3

select St_Id as [Student ID], isnull(St_Fname + ' ' + St_Lname, '') as [Student Full Name],
		Dept_Name as [Department name]
from Student s inner join Department d
on d.Dept_Id = s.Dept_Id;

-- 4

select Ins_Name, Dept_Name
from Instructor i left join Department d
on d.Dept_Id = i.Dept_Id ;

-- 5

select St_Fname + ' ' + St_Lname as [full name], Crs_Name
from Student s inner join Stud_Course sc
on s.St_Id = sc.St_Id
inner join Course c
on c.Crs_Id = sc.Crs_Id
where grade is not null;

-- 6

select t.Top_Id, count(Crs_Id)
from Topic t inner join Course c
on t.Top_Id = c.Top_Id
group by t.Top_Id;

-- 7

select max(salary) as maxS, min(salary) as minS
from Instructor;

-- 8 

select * from Instructor
where Salary < (
select AVG(Salary)
from Instructor);

-- 9


select Dept_Name
from Instructor i inner join Department d
on i.Dept_Id = d.Dept_Id
where Salary = (
select min(salary)
from Instructor);

-- 10

select * 
from(
	select *,  DENSE_RANK() over(order by salary desc) as DR
	from instructor) as newtable
where DR <=2;


-- 11

select  Ins_Id ,coalesce(salary, bonus)
from Instructor;  -- there is no bounse column!!!!!!!

-- 12

select AVG(salary)
from Instructor;

-- 13

select s.St_Fname ,super.*
from Student s inner join student super
on s.St_super = super.St_Id;

-- 14

select Ins_Id, Dept_Id, salary
from(
select *, ROW_NUMBER() over(partition by dept_id order by salary desc) as RN
from Instructor 
where Salary is not null) as newtable
where RN <=2;

-- 15

select *
from(
select *, ROW_NUMBER() over(partition by dept_id order by newid() desc) as RN
from Instructor) as newtable
where RN = 1;

