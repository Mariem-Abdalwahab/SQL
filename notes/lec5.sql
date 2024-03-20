use Company_SD;

select top(3) fname
from Employee
where Address = 'mansoura';

select salary from Employee where salary >=
(select max(salary) from Employee
where salary <
(select max(salary) from Employee));

select top(2) salary from Employee
order by Salary desc;

--------------------------------------------------

select top(4) with ties *
from Employee
order by Salary;

--------------------------------------
-- newid()

select newid();

-- to select random from table

select * from Employee
order by newid();

ALTER TABLE Employee
ADD  id INT identity(1,1);

----------------------------------------------

--Execution order

/*
1. from
2. join
3. on
4. where
5. group
6. having 
7. select 
8. order by
9. top
*/

-- DB Object [table view function SP Rule] to access it
-- full path -> [ServerName].[DBName].[SchemaName].[ObjectName]

select *
from [STARCLOUD-PC].Company_SD.dbo.Employee;

-- you can select table from another DB by this way


---------------------------------------------------------------
--select into -> copy employee to table two

select * into table2
from Employee;

select * into t3
from Employee
where Address = 'mansoura';


select * into t4
from Employee
where 1= 2; -- false condition -> the name of column no data in t4  copy structure

-- you have t4 and you want to transform the data only

insert into t4
select * from Employee;

--------------------------------------------------------

-- select has aggr function only, you can do having condition

select sum(salary)
from Employee
having count(SSN)> 7;

-----------------------------------------------------

use Company_SD;

select * , 
ROW_Number() over(order by salary desc) as RN,
DENSE_RANK() over(order by salary desc) as DR,
NTile(3) over(order by salary desc) as G,
rank() over(order by salary desc) as R
 from employee;

-------------------------------------------------
-- partition
select *
from
(select *, ROW_NUMBER() over(partition by dno order by salary desc) as RN
from Employee) t
where RN = 1; -- max salary from each department, partition first then order


--------------------------------------------------------------------------------

-- Tranact

select Fname, 
			case
			when salary >= 3000 then 'high'
			when salary < 3000 then 'low'
			else 'no value'
			end 
			as newta
from Employee;

update Employee
	set salary =
	case
	when salary > 3000 then salary + 300
	end;


select salary, iif(Salary >= 3000, 'high', 'low') 
from Employee;


---------------------------------------------

select convert(varchar(10), getdate()); -- convert date to string
select cast(getdate() as varchar(20));

select convert(varchar(10), getdate(),102);
select convert(varchar(10), getdate(),103);
select convert(varchar(10), getdate(),104);
select convert(varchar(10), getdate(),105);
select convert(varchar(10), getdate(),106); -- change format

select format(getdate(), 'dd-mm-yyyy');
select format(getdate(), 'dddd mmmm yyyy');
select format(getdate(), 'yyyy mm dd');
select format(getdate(), 'ddd MMM yyy');
select format(getdate(), 'mm-dd-yyyy');
select format(getdate(), 'hh tt');
select format(getdate(), 'hh');


select eomonth(getdate()); -- end of month