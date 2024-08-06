DROP TABLE IF EXISTS city1;

create table city1(
id int primary key,
city varchar(50),
age int,
constraint age_check check(age>=18)
);

drop table if exists city1;

insert into city1(id,city,age)
values(301,'bapatla',20);

insert into city1(id,city,age)
values(302,'delhi',15);

insert into city1(id,city,age)
values(303,'bengaluru',19);

insert into city1(id,city,age)
values(304,'dubai',11);

insert into city1(id,city,age)
values(305,'chennai',13);

select *from city1;

alter table city1
drop column city;

select *from city1;


create database college1;
use college;

drop table if exists student1;

create table student1(
rollno int primary key,
name varchar(50),
marks int,
grade varchar(1),
city varchar(20)
);

insert into student1(rollno,name,marks,grade,city)
values(101,'anil',58,'B','mumbai');
insert into student1(rollno,name,marks,grade,city)
values(102,'sunil',98,'A','dubai');
insert into student1(rollno,name,marks,grade,city)
values(103,'rani',80,'B','mumbai');
insert into student1(rollno,name,marks,grade,city)
values(105,'soni',67,'C','vjd');
insert into student1(rollno,name,marks,grade,city)
values(106,'neelu',99,'A','ben');
insert into student1(rollno,name,marks,grade,city)
values(108,'neelu',99,'A','ben');


select *from student1;

select name,marks from student1;
select city from student1;
select DISTINCT city from student1;

select *from student1 where marks>=80 and city='mumbai';
select *from student1 where marks>=90 or city='srilanka';
select *from student1 where marks between 50 and 80;
select *from student1 where city in ('ben','mumbai');
select *from student1 where city not in ('ben','mumbai');

select top 3* from student;

select *from student1 order by city asc;
select *from student1 order by marks asc;
select *from student1 order by marks desc;

select count(rollno) from student1;
select count(name) from student1;
select count(marks) from student1;
select count(city) from student1;
select count(grade) from student1;

select max(marks) from student;

select min(marks) from student;

select avg(marks) from student;

select sum(marks) from student;

select grade,count(rollno)
from student1 
group by grade;

select city,avg(marks)
from student1
group by city;

select city,avg(marks)
from student1
group by city
order by avg(marks) desc;

select city,avg(marks)
from student1
group by city
order by avg(marks) asc;

select city,avg(marks)
from student1
group by city
having max(marks)>60
order by avg(marks) asc;

select city
from student1
where grade='A'
group by city
having max(marks)>=93
order by city desc;

update student1
set grade='O'
where grade='A';

select*from student1;

delete from student1
where marks<70;

select *from student1;

create table dept(
id int primary key,
name varchar(50),
);



insert into dept
values(501,'cse');

insert into dept
values(502,'ece');

update dept
set id=505
where id=502;



select *from dept;

create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key(dept_id) references dept(id)
on update cascade
on delete cascade
);

insert into teacher
values(1,'rama',501);

insert into teacher
values(2,'seeta',502);

insert into teacher
values(3,'geetha',503);

insert into teacher
values (4,'gana',502);

delete from teacher
where id<2;

select *from teacher;

drop table  if exists teacher;
drop table  if exists dept;

alter table teacher
drop column name;
EXEC sp_help 'teacher';


select*from teacher;

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'teacher';
SELECT * FROM sys.tables WHERE name = 'teacher';


USE master;
SELECT * FROM sys.tables WHERE name = 'teacher';
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'teacher';
EXEC sp_help 'teacher';

alter table teacher
drop column name;

alter table teacher
drop column id;
select *from teacher;

alter table teacher
sp_rename to tea;

EXEC sp_rename 'schema_name.teacher.name', 'madam', 'COLUMN';

truncate table city1;

select *from city1;

drop table if exists student2;

create table student2(
id int primary key,
name varchar(50)
);

insert into student2(id,name)
values(1,'adam');
insert into student2(id,name)
values(2,'bob');
insert into student2(id,name)
values(3,'casey');

select*from student2;

create table course(
id int primary key,
course varchar(50)
);

insert into course(id,course)
values(2,'cse');
insert into course(id,course)
values(3,'eee');
insert into course(id,course)
values(4,'aiml');
insert into course(id,course)
values(5,'iot');

select*from course;

select *from student2 inner join course on student2.id=course.id;

select *from student2 as 
right join course as 
on student_id=student_id;

select id from student2
union
select id from course;

select name from student2
union
select course from course;

create table ability(
rollno int primary key,
name varchar(50),
marks int not null
);

insert into ability(rollno,name,marks)
values(101,'syam',78);
insert into ability(rollno,name,marks)
values(102,'ram',50);
insert into ability(rollno,name,marks)
values(103,'madhu',89);
insert into ability(rollno,name,marks)
values(104,'vedha',90);

select *from ability;

select name from ability;

select name,rollno
from ability
where rollno in(
     select rollno
	 from student
	 where rollno%2=0);

select max(marks)
from(select*from ability where name='madhu')as temp;

select max(marks)
from ability
where name='madhu';

select *from student;

drop table if exists ability;

create view view1 as
select rollno,name,marks from ability;

select *from view1;

select *from view1
where marks>80;

drop table if exists Employees;



-- Create the Employees table
CREATE TABLE dbo.Employees (
    EmployeeID int PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Position varchar(50),
	salary int not null,
	DepartmentID int
);

-- Insert a sample record
INSERT INTO dbo.Employees (EmployeeID, FirstName, LastName, Position,salary,DepartmentID)
VALUES (125, 'John', 'Doe', 'Developer',20000,201);

-- Create the GetEmployeeDetails2 stored procedure
CREATE PROCEDURE dbo.GetEmployeeDetails8
@EmployeeID int
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, Position
    FROM dbo.Employees
    WHERE EmployeeID = @EmployeeID;
END;
GO


EXEC dbo.GetEmployeeDetails8 @EmployeeID = 125;




CREATE TRIGGER dbo.UpdateEmployeeSalary8
ON dbo.Employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(salary)
    BEGIN
        UPDATE e
        SET e.salary = i.salary * 1.1
        FROM dbo.Employees AS e
        INNER JOIN inserted AS i ON e.EmployeeID = i.EmployeeID;
    END
END;
GO
EXEC dbo.GetEmployeeDetails8 @EmployeeID = 125;

select *from Employees;

create function dbo.GetEmployeeName(@EmployeeID int)
returns varchar(50)
as
begin
  declare @name varchar(50)
  select @name=FirstName from dbo.Employees where
       EmployeeID=@EmployeeID
	   Return @name
end
go

select dbo.GetEmployeeName(123)

--------create a procedure for inserting the details into table and age should be calculated automatically based on DOB 
---------

CREATE TABLE dbo.Employees (
    EmployeeID int PRIMARY KEY,
    FirstName nvarchar(50),
    LastName nvarchar(50),
    DOB date,
    Age int
);

CREATE PROCEDURE dbo.InsertEmployee
    @EmployeeID int,
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @DOB date
AS
BEGIN
    -- Declare a variable to hold the calculated age
    DECLARE @Age int;

    -- Calculate the age based on the DOB
    SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - 
               CASE 
                   WHEN MONTH(@DOB) > MONTH(GETDATE()) OR 
                        (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
                   THEN 1 
                   ELSE 0 
               END;

    -- Insert the new employee record into the Employees table
    INSERT INTO dbo.Employees (EmployeeID, FirstName, LastName, DOB, Age)
    VALUES (@EmployeeID, @FirstName, @LastName, @DOB, @Age);
END;
GO

EXEC dbo.InsertEmployee 
    @EmployeeID = 1,
    @FirstName = 'John',
    @LastName = 'Doe',
    @DOB = '1990-01-15';

select *from employees;

-------
-------create a procedure to fetch the data where parameters should be month & employee.
------

CREATE PROCEDURE dbo.GetEmployeeByMonthAndID
    @Month int,              -- Month parameter (1 = January, 2 = February, etc.)
    @EmployeeID int          -- EmployeeID parameter
AS
BEGIN
    -- Check if the provided month is valid (1 to 12)
    IF @Month < 1 OR @Month > 12
    BEGIN
        RAISERROR('Invalid month. Please provide a value between 1 and 12.', 16, 1);
        RETURN;
    END

    -- Fetch employee data based on the specified month and employee ID
    SELECT EmployeeID, FirstName, LastName, DOB
    FROM dbo.Employees
    WHERE EmployeeID = @EmployeeID
      AND MONTH(DOB) = @Month;
END;
GO

EXEC dbo.GetEmployeeByMonthAndID 
    @Month = 8,          -- Example: August
    @EmployeeID = 123;   -- Example: Employee ID

	select *from Employees;

EXEC dbo.GetEmployeeByMonthAndID 
    @Month = 8,          
    @EmployeeID = 123;   

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';

SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Employees';

SELECT * 
FROM dbo.Employees;

CREATE PROCEDURE dbo.GetEmployeeByMonthAndID1
    @Month int,              -- Month parameter (1 = January, 2 = February, etc.)
    @EmployeeID int          -- EmployeeID parameter
AS
BEGIN
    -- Check if the provided month is valid (1 to 12)
    IF @Month < 1 OR @Month > 12
    BEGIN
        RAISERROR('Invalid month. Please provide a value between 1 and 12.', 16, 1);
        RETURN;
    END

    -- Fetch employee data based on the specified month and employee ID
    SELECT EmployeeID, FirstName, LastName, DOB
    FROM dbo.Employees
    WHERE EmployeeID = @EmployeeID
      AND MONTH(DOB) = @Month;
END;
GO

EXEC dbo.GetEmployeeByMonthAndID 
    @Month = 8,          -- Example month (August)
    @EmployeeID = 123;   -- Example EmployeeID

EXEC sp_helptext 'dbo.GetEmployeeByMonthAndID1';

-- Drop the procedure if it exists
IF OBJECT_ID('dbo.GetEmployeeByMonthAndID', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.GetEmployeeByMonthAndID;
END
GO

-- Recreate the procedure
CREATE PROCEDURE dbo.GetEmployeeByMonthAndID
    @Month int,              -- Month parameter (1 = January, 2 = February, etc.)
    @EmployeeID int          -- EmployeeID parameter
AS
BEGIN
    -- Check if the provided month is valid (1 to 12)
    IF @Month < 1 OR @Month > 12
    BEGIN
        RAISERROR('Invalid month. Please provide a value between 1 and 12.', 16, 1);
        RETURN;
    END

    -- Fetch employee data based on the specified month and employee ID
    SELECT EmployeeID, FirstName, LastName, DOB
    FROM dbo.Employees
    WHERE EmployeeID = @EmployeeID
      AND MONTH(DOB) = @Month;
END;
GO

IF OBJECT_ID('dbo.GetEmployeeByMonthAndID', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.GetEmployeeByMonthAndID;
END
GO

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';

-- Ensure the table has data
SELECT * FROM dbo.Employees;

-- Test with valid parameters
EXEC dbo.GetEmployeeByMonthAndID @Month = 8, @EmployeeID = 123;

USE Employees; -- Replace with your database name
GO

-- Insert test data
INSERT INTO dbo.Employees (EmployeeID, FirstName, LastName, DOB)
VALUES 
    (123, 'John', 'Doe', '1990-08-15'),
    (124, 'Jane', 'Smith', '1985-08-20'),
    (125, 'Mike', 'Johnson', '1992-01-12'),
    (126, 'Emily', 'Brown', '1992-08-05');

EXEC dbo.GetEmployeeByMonthAndID @Month = 8, @EmployeeID = 123;


create procedure GetEmployeesByDepartment1
@DeptID int
as 
begin
   select EmployeeID,FirstName,LastName
   from Employees
   where DepartmentID=@DeptID;
End;

exec GetEmployeesByDepartment1 @DeptID=1;



CREATE PROCEDURE GetEmployeeCountByDepartment3
    @DeptID INT,
    @EmployeeCount INT OUTPUT
AS
BEGIN
    -- Declare the local variable within the BEGIN...END block if needed
    -- DECLARE @count INT;  -- Not necessary in this case

    -- Set the value of the output parameter
    SELECT @EmployeeCount = COUNT(*)
    FROM Employees
    WHERE DepartmentID = @DeptID;
END;

-- Declare a variable to hold the output value
DECLARE @ResultCount INT;

-- Execute the stored procedure, passing the necessary parameters
EXEC GetEmployeeCountByDepartment3 @DeptID = 1, @EmployeeCount = @ResultCount OUTPUT;

-- Select or print the result
SELECT @ResultCount AS EmployeeCount;









