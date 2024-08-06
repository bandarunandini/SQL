create database Nandini;

use Nandini;

drop table if exists employee;

create table employee(
id int,
empName varchar(50),
city varchar(50),
salary int
);

insert into employee(id,empName,city,salary)
values(301,'latha','mumbai',45000);

insert into employee(id,empName,city,salary)
values(302,'geetha','delhi',34000);

insert into employee(id,empName,city,salary)
values(303,'seetha','dubai',70000);

insert into employee(id,empName,city,salary)
values(304,'maala','chennai',55000);

select *from employee;

use Nandini;

select *from employee;

---create procedures

create procedure SampleProcedure
as
select *from employee
go;

exec SampleProcedure;

--procedure with one parameter
use Nandini;
select *from employee;

create procedure SampleProcedure2 @city varchar(50)
as
begin
  select *from employee where city=@city;
end;
go
exec SampleProcedure2 @city='mumbai';

drop procedure if exists SampleProcedure3;

create procedure SampleProcedure3 @city varchar(50),@empName varchar(50)
as
begin
  select *from employee where city=@city and empName=@empName;
end;
go

exec SampleProcedure3 @city='ABC',@empName='geetha';

drop table if exists student1;

create table student1(
id int primary key,
name varchar(50),
marks int
);

insert into student1(id,name,marks)
values(101,'janu',98);
insert into student1(id,name,marks)
values(102,'ramu',88);
insert into student1(id,name,marks)
values(103,'somu',57);
insert into student1(id,name,marks)
values(104,'ragu',45);

select *from student1;

create trigger sample_trigger
instead of insert
on student1
for each row
set new.marks=new.marks+6;

-- Assuming the student table already exists
SELECT * FROM student1;

-- Correct way to create the INSTEAD OF INSERT trigger
CREATE TRIGGER sample_trigger1
ON student1
INSTEAD OF INSERT
AS
BEGIN
    -- The inserted table contains the rows that would be inserted
    INSERT INTO student1 (id, name, marks)
    SELECT id, name, marks + 6
    FROM inserted;
END;
GO

-- Select from the student table to verify changes
SELECT * FROM student1;

display triggers in Nandini;

EXEC sp_helptext 'sample_trigger1';

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, OrderDate, CustomerID, ProductID, Quantity, UnitPrice)
VALUES
    (1, '2024-01-15', 101, 1, 5, 10.00),
    (2, '2024-02-10', 102, 2, 3, 20.00),
    (3, '2024-03-05', 103, 3, 2, 30.00),
    (4, '2024-04-12', 104, 4, 1, 40.00),
    (5, '2024-05-18', 105, 1, 4, 10.00),
    (6, '2024-06-20', 106, 2, 2, 20.00),
    (7, '2024-07-22', 107, 3, 6, 30.00),
    (8, '2024-08-15', 108, 4, 5, 40.00),
    (9, '2024-09-05', 109, 1, 8, 10.00),
    (10, '2024-10-10', 110, 2, 7, 20.00);


select count(*) as TotalOrders from orders
where Orderdate>'2024-01-01';

select count(*) as TotalOrders from orders;

select sum(Quantity) as TotalQuantity from Orders
where ProductID=1;

select sum(Quantity) as TotalQuantity from Orders

select avg(unitprice) from orders;
select *from employee;
select min(salary) from employee;


drop table if exists employees;

create table employees(
id int primary key,
FirstName varchar(50),
LastName  varchar(50),
Products  varchar(50),
UnitPrice decimal(5,2)
);

insert into employees(id,FirstName,LastName,Products,UnitPrice)
values(501,'Nandini','Bandaru','ipad',10.00);
insert into employees(id,FirstName,LastName,Products,UnitPrice)
values(502,'Radha','Gorla','watch',45.00);
insert into employees(id,FirstName,LastName,Products,UnitPrice)
values(503,'Asritha','Neeli','phone',75.00);
insert into employees(id,FirstName,LastName,Products,UnitPrice)
values(504,'Yagna','kukkala','book',90.00);
insert into employees(id,FirstName,LastName,Products,UnitPrice)
values(505,'Hema','Atthina','laptop',67.00);

select *from employees;

select upper(FirstName) as uppercaseName
from employees;

select lower(LastName) as lowercaseName
from employees;

select len(FirstName) as FirstNamelength from employees;

select round(UnitPrice,1) as RoundPrice from employees;

select concat(FirstName,'',LastName) as FullName from employees;

select substring(Products,1,5) as ShortName from employees;

select trim(' Nandini Bandaru ')as TrimmedString;

select getdate() as CurrentDateTime;

select dateadd(year,1,GetDate()) as NextYear;

select datediff(day,'2024-01-01','2024-12-31')as DaysDifference;

select abs(-123.45)as absolutevalue;

select ceiling(3.14)as ceilvalue;

select floor(3.14)as floorvalue;

create function dbo.GetFullName(@FirstName varchar(50),@LastName varchar(50))
returns varchar(101)
as
begin
  return @FirstName+''+@LastName;
end;

select dbo.GetFullName(FirstName,LastName) as FullName from employees;

