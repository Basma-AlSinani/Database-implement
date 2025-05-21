use Company_SD
select * 
from Departments

select * 
from Dependent

select *
from Employee

select *
from Project

select *
from Works_for

--1. Display the department ID, department name, manager ID, and the full name of the manager.
select D.Dnum as 'Department_ID',D.Dnum as 'department_name',D.MGRSSN as 'manager_ID', E.Fname+' '+E.Lname as ' full_name' 
from Departments D ,Employee E
where E.SSN=D.MGRSSN;

--2.Display the names of departments and the names of the projects they control. 
select D.Dname as 'department name',P.Pname as 'projects name' 
from  Departments D 
inner join
Project P ON P.Dnum=D.Dnum;

--3. Display full data of all dependents, along with the full name of the employee they depend on.
select Dept.*, E.Fname+' '+E.Lname as full_name
from Dependent Dept 
inner join 
Employee E ON E.SSN=Dept.ESSN;

 --4. Display the project ID, name, and location of all projects located in Cairo or Alex. 
select Pnumber as 'Project Id',Pname as 'Project Name',Plocation as 'Location'
from Project
where City='Cairo' OR City='Alex';

--5. Display all project data where the project name starts with the letter 'A'.
select *
from Project
where Pname	 like 'A%';

--6. Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE. 
select E.SSN as 'Employee ID', E.Fname+' '+E.Lname as full_name
from Employee E , Departments D 
where D.Dnum=30 and E.Salary between 1000 and 2000;

--7.Retrieve the names of employees in department 10 who work ? 10 hours/week on the "AL Rabwah" project. 
select E.Fname + ' ' + E.Lname AS full_name
from  Employee E
inner join Works_for W ON E.SSN = W.ESSN
inner join Project P ON W.Pno = P.Pnumber
where E.Dno = 10 AND P.Pname = 'AL Rabwah' AND W.Hours >= 10;

--8.Find the names of employees who are directly supervised by "Kamel Mohamed".
select E.Fname + ' ' + E.Lname AS full_name
from  Employee E
join Employee M on E.Superssn=m.SSN
where M.Fname='Kamel' And M.Lname='Mohamed';

--9.Retrieve the names of employees and the names of the projects they work on, sorted by project name. 
select E.Fname + ' ' + E.Lname AS Employee_Name
from Employee E
inner join Works_for W ON E.SSN = W.ESSN
inner join Project P ON W.Pno = P.Pnumber
order by P.Pname;


--10. For each project located in Cairo, display the project number, controlling department name, manager's last name,address, and birthdate. 
select P.Pnumber AS Project_Number,   D.Dname AS Department_Name,M.Lname AS Manager_LastName, M.Address AS Manager_Address,M.Bdate AS Manager_Birthdate
from Project P
inner join Departments D ON P.Dnum=D.Dnum
inner join Employee M ON D.MGRSSN=M.SSN
where P.City='Cairo';

--11.Display all data of managers in the company.
select E.*
from Employee E
join Departments D On E.SSN=D.MGRSSN;

--12. Display all employees and their dependents, even if some employees have no dependents.
select E.Fname + ' ' + E.Lname AS Employee_Name, D.Dependent_name,D.sex,D.Bdate
from Employee E
left join Dependent D on E.SSN=D.ESSN;