
-- join multi tables

/*
select studentname, coursename, grade
from student s, studetncourse sc, course c
where s.id = sc.sid and sc.id = c.id

select studentname, coursename, grade
from student s inner join studetncourse sc
on s.id = sc.sid 
iner join course c
on sc.id = c.id
*/

select sname, courseid, grade, dname 
from student s , course c, department d
where s.sid = c.stid and s.did = d.did;

select sname, courseid, grade, dname 
from student s inner join course c
on s.sid = c.stid 
inner join
department d
on s.did = d.did;

-- join DML
--- join update

update course
set grade += 20;

update course
set grade += 20
where grade > 80
;

select isnull(sname, 'no name') from student;

select Coalesce(sname,sid, 'no name') from student;

-- to concat diffetrent data type


select isnull(sname,'') + ' ' + convert(varchar(2),isnull(sid,0))
from student;

select concat(sname, ' ', sid) -- convert all to string and replace null value to ''
from student;

select sname from student
where sname like 'omar';


select sname from student
where sname like 'o%';

-- % zero or more char
-- _ one char

-- pattern
/*

'a%h'
'%a'
'ahm%'
'[ahm]%' -- start a or h or m
'[^ahm]%' -- not 
'[a-m]%' -- range from a-m
'[^a-m]%' -- not
'[346]%'
'%[%]' -- string end with %.... [%] it mean that
'%[_]%' -- string has _ eman_ali
'[_]%[_]' -- _ali_

*/

