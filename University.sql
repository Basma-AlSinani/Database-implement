create database University 
use University

create table  faculty(
F_ID int primary key,
Name varchar(20) ,
department varchar(10) ,
Salary DECIMAL(10, 2)
)

create table  facultyMobile(
F_ID int,
Mobile_No int,
primary key (F_ID, Mobile_No),
foreign key (F_ID) references faculty(F_ID),
)

create table  Subjects(
subject_Id int primary key,
subject_name varchar(20),
F_Id int,
foreign key (F_ID) references faculty(F_ID),
);

create table student(
s_Id int primary key,
FName varchar(20),
LName varchar(20),
F_Id int,
foreign key (F_ID) references faculty(F_ID),
);

create table studentPhone(
s_Id int,
Mobile_No int,
primary key (s_Id, Mobile_No),
foreign key (s_Id) references student(s_Id),
);

create table address(
s_Id int,
pinCode int,
primary key (s_Id, pinCode),
foreign key (s_Id) references student(s_Id),
);

create table hostel(
hostel_Id int primary key,
hostel_Name varchar(20),
NO_Of_Seats int,
);
create table Course(
course_Id int primary key,
Duration time,
course_Name varchar(20),
s_Id int,
foreign key (s_Id) references student(s_Id),
);
create table studentCourse(
s_Id int,
course_Id int,
primary key (s_Id, course_Id),
foreign key (s_Id) references student(s_Id),
foreign key (course_Id) references Course(course_Id),
);
create table Department(
Department_Id int primary key,
DepartmentName VARCHAR(20),
)
create table Exams(
Exam_code int primary key,
ExamRoom VARCHAR(20),
ExamDate DATE,
Date DATE,
Department_Id int,
foreign key (Department_Id) references Department(Department_Id),
 );

 alter table faculty
add Department_Id int foreign key references Department(Department_Id);

alter table Subjects
add F_Id int foreign key (F_Id) references faculty(F_Id);

alter table student
add hostel_Id int foreign key (F_Id) references hostel(hostel_Id);

alter table Course
add Department int foreign key (Department_Id) references Department(Department_Id);