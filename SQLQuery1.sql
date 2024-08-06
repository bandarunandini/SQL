create table employee7(
id int primary key,
name varchar(50),
dob date not null,
age int,
city varchar(50),
phonenumber bigint
);




INSERT INTO employee7 (id, name, dob, age, city, phonenumber)
VALUES (1, 'latha', '2004-08-20', 20, 'chirala', '8448994939');


INSERT INTO employee7 (id, name, dob, age, city, phonenumber)
VALUES (2, 'seetha', '2001-07-23', 19, 'bapatla', '7558772340');

INSERT INTO employee7 (id, name, dob, age, city, phonenumber)
VALUES (3, 'gana', '2000-02-24', 22, 'bengaluru', '7558772355');

select *from  employee7;

create table salar(
id int primary key identity(1,1),
employee_id int,
date DATE,
amount bigint,
foreign key(employee_id) references employee7(id)
);


insert into salar(employee_id,date,amount)
values(1,'1999-05-10',50000);

insert into salar(employee_id,date,amount)
values(2,'2000-08-10',100000);


insert into salar(employee_id,date,amount)
values(3,'2003-07-01',25000);

select *from salar;
select *from sala;


select employee7.id,sala.amount
from employee7
join sala
on employee7.id=sala.amount
order by id;

create table emp(
id int,
salary int default 30000);

insert into emp(id) 
values(101);
insert into emp(id)
values(102); 

select *from emp;

