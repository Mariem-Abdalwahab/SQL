--delete Dependent;

insert into Department values
('HR', 1, 2, '02/3/2022'),
('communication', 2, 1, '02/5/2022')

insert into Dept_location values
(1, 'cairo'),
(2, 'Alex');

insert into Project values
('p_one', 1, 'mansoura', 1),
('p_two', 2, 'mansoura', 2);

insert into Work_on values
(1, 2, 18),
(2, 1, 20);

insert into Dependent values
(1, 'youmna', 'female', '04/04/2009', 'sister'),
(2, 'mohamed', 'male', '04/04/2020', 'brother');