-- DDL
create table emp (
eid int primary key,
ename varchar(50),
loc varchar(50) default 'cairo',
hiringdate date default getdate(),
)

/* if i want to add another column*/

alter table emp add email varchar(50);
alter table emp drop column email;

/*drop table emp;  drop all table and column*/
-----------------------------------


--DML
-- insert update delete values

 insert into emp
 values(5, 'mariem',null,null);

 insert into emp(ename, eid, hiringdate, loc)
 values('nour', 7,'1/1/2009', 'alex')

 insert into emp(ename, eid)
 values('nour', 9)

 /* to insert many column use insert constructor*/

 insert into emp (eid, ename)
 values (1, 'eman'),(2, 'salma'),(4, 'marwa'),(6, 'ali')

 /*update values in raws*/

 update emp set ename = 'MARIEM'
 where eid = 5;

 delete from emp; /* delete all value but structure still there*/

 ----------------------
 --DQL

 select ename from emp
 where eid>2;

 -- to select with specific order
  select * from emp
 order by ename desc;

 /* select dose not effect the main data on hard disk*/
select FirstN +' ' + LastN [full Name]
from Employee;

select SSN, FirstN +' ' + LastN as fullName
from Employee
where FirstN is not null;

/* != null */

-- to select uniqe value

select distinct FirstN from Employee;

select  FirstN from Employee;

select  * from Employee
where age=20 or age=21;

select  * from Employee
where age in (20,21,22);

-- select from reng
select  * from Employee
where age between 20 and 32;

--SELECT @@SERVERNAME