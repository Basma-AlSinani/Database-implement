use Company_SD
--1.  Count total number of employees in the Employees table. 
select  COUNT(*)AS NumberOfEmployees
from Employee
--2.  Calculate average salary from the Salaries table.
select AVG(salary) AS AvgSalary
from Employee;

--3.Count employees in each department using Employees grouped by Dept_ID. 
select Dno,COUNT(*)AS Employee_Count
from Employee
group by Dno;

--4.  Find total salary per department by joining Employees and Salaries
select Dno ,SUM(salary) As Total_Salary
from Employee
group by Dno;

--5. Show departments (Dept_ID) having more than 5 employees with their counts.
select Dno,COUNT(*) AS Employee_Count
from Employee
group by Dno
having COUNT(*)>5;

use Library_Management_System
select *
from Book;

select *
from Member;


--26. Count total books in Books table. 
select COUNT(*)
from Book
--27. Average book price from Books table. 
select AVG(price) AS AvgPrice
from Book;
--28. Count books per library grouped by Library_ID. 
select Library_ID,COUNT(*) AS Total_Book
from Library
group by Library_ID;

--29. Count books borrowed per member from Borrows table grouped by Member_ID.


--30. List members who borrowed more than 3 books grouped by Member_ID.

use Airline_New
--11. Count total flights in FLIGHT table.
select COUNT(*)
from flight;

--12. Average available seats per leg using FLIGHT_LEG table.
select AVG(