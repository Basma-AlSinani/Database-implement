create database Company_New;

use Company_New;

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
dependent_name VARCHAR(20),
sex VARCHAR(6)check (sex in('Male', 'Female')),
Bdate date,
Relationship varchar(10),
primary key( essn,dependent_name),
foreign key (essn) references department(Dnumber),
);
alter table Employee
add Dno int foreign key references Department(Dnumber);
ALTER TABLE employee
DROP COLUMN dno;


 
 
select *
from employee

select *
from project
 
select *
from department

SELECT 
  Fname AS [First Name], 
  Lname AS [Last Name], 
  salary AS [Salary], 
  Dno AS [Department Number]
FROM employee;

SELECT 
  Pname AS [Project Name],
  Plocation AS [Project Location],
  Dnum AS [Responsible Department Number]
FROM project;

SELECT 
  Pname AS [Project Name],
  Plocation AS [Project Location],
  Dnum AS [Responsible Department Number]
FROM project;
INSERT INTO project (Pnumber, Pname, Plocation, Dnum)
VALUES
  (1001, 'Alpha', 'New York', 1),
  (1002, 'Beta',  'Los ', 2);
  INSERT INTO department (Dnumber, Dname, mgr_ssn, mgr_start_date)
VALUES 
  (1, 'HR', NULL, '2020-01-01'),
  (2, 'IT', NULL, '2020-01-01');
 SELECT 
  Fname + ' ' + Lname AS [Full Name],
  salary * 12 * 0.10 AS [ANNUAL COMM]
FROM 
  employee;
  INSERT INTO employee (Ssn, Fname, Minit, Lname, Bdate, address, sex, salary, super_ssn, dno, Dnumber)
VALUES 
(1001, 'John',   'A', 'Doe',     '1990-05-15', '123 Main St, NY',     'Male',   5000.00, NULL, 1, 1),
(1002, 'Alice',  'B', 'Smith',   '1985-09-10', '456 Elm St, NY',      'Female', 6000.00, 1001, 2, 2),
(1003, 'Mike',   'C', 'Johnson', '1992-03-22', '789 Pine St, NY',     'Male',   5500.00, 1001, 1, 1),
(1004, 'Emma',   'D', 'Brown',   '1991-07-08', '321 Oak St, NY',      'Female', 5800.00, 1002, 2, 2),
(1005, 'David',  'E', 'Wilson',  '1988-12-30', '654 Cedar St, NY',    'Male',   6200.00, 1003, 1, 1),
(1006, 'Sophia', 'F', 'Taylor',  '1993-11-14', '987 Maple St, NY',    'Female', 6100.00, 1004, 2, 2);

SELECT 
  Ssn AS [Employee ID],
  Fname + ' ' + Lname AS [Full Name]
FROM 
  employee
WHERE 
  salary > 1000;
  SELECT 
  Ssn AS [Employee ID],
  Fname + ' ' + Lname AS [Full Name]
FROM 
  employee
WHERE 
  salary > 10000;
  SELECT 
  Fname + ' ' + Lname AS [Full Name],
  salary AS [Salary]
FROM 
  employee
WHERE 
  sex = 'Female';

  SELECT 
  Dnumber AS [Department ID],
  Dname AS [Department Name]
FROM 
  department
WHERE 
  mgr_ssn = 968574;

  SELECT 
  Pnumber AS [Project ID],
  Pname AS [Project Name],
  Plocation AS [Project Location]
FROM 
  project
WHERE 
  Dnum = 10;

  INSERT INTO employee (
  Ssn, Fname, Minit, Lname, Bdate, address, sex, salary, super_ssn, Dnumber
)
VALUES (
  112233, 'Khalid', 'M', 'Saleh', '1980-05-10', 'Riyadh, KSA', 'Male', 6000.00, NULL, 30
);

  INSERT INTO employee (
  Ssn, Fname, Minit, Lname, Bdate, address, sex, salary, super_ssn, Dnumber
)
VALUES (
  102672, 'Ahmed', 'A', 'Hassan', '2000-01-14', 'Muscat, Oman', 'Male', 3000.00, 112233, 30
);

ALTER TABLE employee
ALTER COLUMN salary decimal(10,2) NULL;

ALTER TABLE employee
ALTER COLUMN super_ssn int NULL;

INSERT INTO employee (
  Ssn, Fname, Minit, Lname, Bdate, address, sex, Dnumber
)
VALUES (
  102660, 'Omar', 'B', 'Ali', '1995-08-22', 'Muscat, Oman', 'Male', 30
);

UPDATE employee
SET salary = salary * 1.20;



