drop database college;
drop table employee;
drop table person;
drop table student;

create database college;

use college;

create table student(
id int primary key,
name varchar(50),
age int not null,
marks int not null
);

insert into student values(201,'radha',20,90);
insert into student values(202,'geetha',20,95);
insert into student values(203,'ragi',20,98);
insert into student values(204,'mamata',20,34);
insert into student values(205,'lakshmi',20,56);
insert into student values(206,'hema',20,78);

select *from student;

create database xyz;

use xyz;

create table employee(
id int primary key,
name varchar(100),
salary int
);

insert into employee values(101,'adam',25000);
insert into employee values(102,'bob',45000);
insert into employee values(103,'jon',28000);
insert into employee values(104,'don',22000);

select *from employee;

SELECT name
FROM sys.databases;

SELECT name, create_date 
FROM sys.databases;

SELECT name, create_date 
FROM sys.databases;

SELECT name
FROM sys.databases;

select col1,col2 from employee;

SELECT id, name,salary
FROM employee;



