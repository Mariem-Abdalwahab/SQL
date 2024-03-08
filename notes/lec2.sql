-- cartisian product
select sname,dname from student,department; 

select sname,dname from student cross join department; 

-----------------------
-- Equijoin

select sname, dname from student, department
where student.did = department.did; -- in case two table have the same name -> equijoin

select sname, dname from student s, department d
where s.did = d.did;  -- creat a fake name for each table

select sname, dname from student s inner join department d
on s.did = d.did; 

------------------------
-- left outer join

select sname, dname from student s left outer join department d
on s.did = d.did;

------------------------
-- right outer join

select sname, dname from student s right outer join department d
on s.did = d.did;

------------------------
-- full outer join

select sname, dname from student s full outer join department d
on s.did = d.did;

------------------------
-- self join like employee and supervisour

select X.FirstN as employee, Y.FirstN as super from 
Employee X, Employee Y
where X.superssn = Y.SSN; 

-------

-- join multi tables
