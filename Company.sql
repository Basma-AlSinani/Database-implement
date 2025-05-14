create database Company;

use Company;

create table employee(
Ssn int primary key,	
Fname varchar(10) ,
Minit varchar(10) ,
Lname varchar(10),
Bdate date,
address VARCHAR(255),
sex VARCHAR(6)check (sex in('Male', 'Female')),
salary decimal(10,2),
super_ssn int ,
dno int,
Dnumber int,
foreign key (super_ssn) references employee(Ssn),
);

create table department(
Dnumber int primary key,
Dname varchar(10),
mgr_ssn int,
mgr_start_date date,
foreign key (mgr_ssn) references employee(Ssn),
);

create table dept_location(
Dnumber int,
Dlocation int,
primary key (Dnumber, Dlocation),
foreign key (Dnumber) references department(Dnumber),
);

create table project(
Pnumber int primary key,
Pname varchar(10),
Plocation varchar(10),
Dnum int,
foreign key (Dnum) references department(Dnumber),
);

create table works_on(
essn int,
Pno int,
primary key (essn, Pno),
hours time,
);

create table dependent(
essn int,
dependent_name int,
primary key( essn,dependent_name),
foreign key (essn) references department(Dnumber),
sex VARCHAR(6)check (sex in('Male', 'Female')),
Bdate date,
Relationship varchar(10),
);
alter table Employee
add Dno int foreign key references Department(Dnumber);