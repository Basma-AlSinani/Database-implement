create database  Library_Management_System ;
use Library_Management_System

create table Library(
Library_ID int primary key identity(1,1 ),
Name varchar(10),
Location VARCHAR(50),
EstablishedYear int
)

create table Library_ContactNumber(
Library_ID int,
ContactNumber VARCHAR(15),
primary key(Library_ID,ContactNumber),
foreign key (Library_ID) references Library(Library_ID),
)

create table Staff(
Staff_ID int primary key identity(1,1 ),
Position VARCHAR(30),
F_Name varchar(10),
L_Name varchar(10),
Library_ID int,
foreign key (Library_ID) references Library(Library_ID),
)

create table Staff_ContactNumber(
Staff_ID int,
ContactNumber VARCHAR(15),
primary key(Staff_ID,ContactNumber),
foreign key (Staff_ID) references Staff(Staff_ID),
)

create table Book(
Book_ID int primary key identity(1,1 ),
ISBN VARCHAR(20),
Title VARCHAR(30),
Price DECIMAL(10, 2),
ShelfLocation VARCHAR(20),
Genre VARCHAR(50),
AvailableStatus bit,
Library_ID int,
foreign key (Library_ID) references Library(Library_ID),
)

create table Member (
Member_Id int primary key identity(1,1 ),
Email VARCHAR(255) NOT NULL UNIQUE,
F_Name varchar(10),
L_Name varchar(10),
StartDate DATE,
)

create table Member_ContactNumber(
Member_Id int,
ContactNumber VARCHAR(15),
primary key(Member_Id,ContactNumber),
foreign key (Member_Id) references Member(Member_Id),
)

create table Loan(
Loan_ID int primary key identity(1,1 ),
Status VARCHAR(20),
ReturnDate DATE,
DueDate DATE,
LoanDate DATE,
Book_ID int,
Member_Id int,
foreign key (Book_ID) references book(Book_ID),
foreign key (Member_Id) references Member(Member_Id),
)

create table Fine_Payment(
Fine_Payment_Id  int primary key identity(1,1 ),
PaymentDate DATE,
Method VARCHAR(30),
Amount DECIMAL(10, 2),
Loan_ID int ,
foreign key (Loan_ID) references Loan(Loan_ID),
)

create table Review(
Review_Id  int primary key identity(1,1 ),
Comments VARCHAR(100),
Rating int,
ReviewDate DATE,
Book_ID int,
Member_Id int,
foreign key (Book_ID) references book(Book_ID),
foreign key (Member_Id) references Member(Member_Id),)

alter table Book
add Member_Id int foreign key references Member (Member_Id);

--insert data
--library table 
insert into Library(Name,Location,EstablishedYear)
VALUES ('Central Library', 'New York', 1995);

insert into Library(Name,Location,EstablishedYear)
VALUES ('City Library', 'Los Angeles', 2000);

insert into Library(Name,Location,EstablishedYear)
VALUES ('Muscat Library', 'Muscat', 2003);
--library ContactNumber  table 
INSERT INTO Library_ContactNumber(Library_ID, ContactNumber)
VALUES 
(2, '1234567890'),
(2, '0987654321'),
(4, '5556667777');
 
INSERT INTO Staff (Position, F_Name, L_Name, Library_ID)
VALUES 
('Manager', 'John', 'Doe', 2),
('Librarian', 'Anna', 'Smith', 3),
('Assistant', 'Mike', 'Brown', 4);

INSERT INTO Staff (Position, F_Name, L_Name, Library_ID)
VALUES ('Librarian', 'Sarah', 'Fathy', 2);

INSERT INTO Staff_ContactNumber (Staff_ID, ContactNumber)
VALUES 
(1, '1112223333'),
(2, '2223334444'),
(3, '3334445555');

INSERT INTO Member (Email, F_Name, L_Name, StartDate)
VALUES 
('alice@example.com', 'Alice', 'Walker', '2023-01-15'),
('bob@example.com', 'Bob', 'Marley', '2023-02-10');

INSERT INTO Member_ContactNumber (Member_Id, ContactNumber)
VALUES 
(1, '4445556666'),
(2, '5556667777');

INSERT INTO Member_ContactNumber (Member_Id, ContactNumber)
VALUES (1, '4445556666');

INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus)
VALUES 
('9781234567890', 'SQL Basics', 50.00, 'A1', 'Education', 1),
('9780987654321', 'C# Programming', 75.50, 'B2', 'Programming', 0);

INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus, Library_ID)
VALUES ('9782222222222', 'Thinking Fast', 150.00, 'A5', 'Psychology', 1, 2);


INSERT INTO Loan (Status, ReturnDate, DueDate, LoanDate, Book_ID, Member_Id)
VALUES 
('Returned', '2023-04-01', '2023-03-30', '2023-03-15', 2, 2),
('Pending', NULL, '2023-05-25', '2023-05-10', 5, 1);

INSERT INTO Fine_Payment (PaymentDate, Method, Amount, Loan_ID)
VALUES 
('2023-04-02', 'Credit Card', 10.00, 3);

INSERT INTO Review (Comments, Rating, ReviewDate, Book_ID, Member_Id)
VALUES 
('Great book on SQL!', 5, '2023-04-05', 5, 1),
('Very useful for beginners.', 4, '2023-04-07', 2, 2);

INSERT INTO Loan (Status, ReturnDate, DueDate, LoanDate, Book_ID, Member_Id)
VALUES ('Pending', NULL, '2025-06-01', '2025-05-15', 7, 1);


--select 
select *
from Library

select *
from Review

select *
from Fine_Payment
select *
from Loan


select *
from Library_ContactNumber

select *
from Staff

select *
from  Staff_ContactNumber

select *
from Member

select *
from Member_ContactNumber

select *
from Book
alter table Library
drop column Name;

alter table book
drop column Member_Id;

ALTER TABLE Library
ADD Name VARCHAR(50);

DELETE FROM Member_ContactNumber
WHERE Member_Id = 1 AND ContactNumber = '4445556666';

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Book';

ALTER TABLE Book
ADD CONSTRAINT FK_Book_Member
FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id);

INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus, Library_ID, Member_Id)
VALUES 
('9781234567890', 'SQL Basics', 50.00, 'A1', 'Education', 1, 2, 1),
('9780987654321', 'C# Programming', 75.50, 'B2', 'Programming', 0, 4, NULL);
INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus, Library_ID, Member_Id)
VALUES 
('9781111111111', 'The Alchemist', 120.00, 'C3', 'Fiction', 1, 2, NULL);

INSERT INTO Book (ISBN, Title, Price, ShelfLocation, Genre, AvailableStatus, Library_ID, Member_Id)
VALUES 
('9781234567890', 'SQL Basics', 50.00, 'Zamalek', 'Education', 1, 2, 1),
('9780987654321', 'C# Programming', 75.50, 'Downtown', 'Programming', 0, 3, NULL);
INSERT INTO Library (Name, Location, EstablishedYear)
VALUES ('Cairo Branch', 'Cairo', 2010);

select *
from book;

SELECT Title, Genre, AvailableStatus FROM Book;

SELECT F_Name, L_Name, Email, StartDate FROM Member;

SELECT Title, Price AS BookPrice FROM Book;

SELECT * FROM Book WHERE Price > 250;

SELECT * FROM Member WHERE StartDate < '2023-01-01';

--1.Display library ID, name, and the name of the manager.
select L.Library_ID, L.Name AS Library_Name,S.F_Name + ' '+ S.L_Name AS Manager_Name
from Library L
join Staff S ON L.Library_ID=S.Library_ID
where S.Position='Manager';

--2.Display library names and the books available in each one. 
select L.Name As Library_Name,B.Title As Book_Title
from Library L
join Book B ON L.Library_ID=B.Library_ID
where B.AvailableStatus=1
order by L.Name, B.Title;

--3. Display all member data along with their loan history. 
 select  M.*, L.Loan_ID, L.Status, L.LoanDate,L.DueDate,L.ReturnDate,B.Title AS Book_Title
 From Member M
 left join Loan L ON M.Member_Id=l.Member_Id
 left join Book B ON L.Book_ID=B.Book_ID
 order by M.Member_Id, L.LoanDate;

 --4.Display all books located in 'Zamalek' or 'Downtown'. 
 select * 
 from book 
 Where ShelfLocation In ('Zamalek' , 'Downtown')
 --5. Display all books whose titles start with 'T'. 
 select *
 from Book
 where Title Like 'T%';

-- 6.List members who borrowed books priced between 100 and 300 LE.
select M.Member_ID,M.F_Name,M.L_name,M.Email
from Member M
join Loan L on M.Member_Id=L.Member_Id
join book B On l.Book_ID=B.Book_ID
where B.Price between 50 and 60 ;
 
 --7. Retrieve members who borrowed and returned books titled 'The Alchemist'.
 select M.Member_ID,  M.F_Name,M.L_Name,M.Email
 from Member M
 join loan L on m.Member_Id=L.Member_Id
 join Book B on L.Book_ID=B.Book_ID
 where B.Title='The Alchemist' And L.Status='Returned';

-- 8. Find all members assisted by librarian "Sarah Fathy".
select M.Member_Id,M.F_Name,M.L_Name,M.Email
from Member M
Join Loan L on M.Member_Id=L.Member_Id
join Book B on L.Book_ID=B.Book_ID
join Library Lib on B.Library_ID=Lib.Library_ID
join Staff S on Lib.Library_ID=S.Library_ID
where S.Position ='Librarian' and S.F_Name='Sarah' and S.L_Name='Fathy';
--9. Display each member’s name and the books they borrowed, ordered by book title. 
select M.F_Name+' '+M.L_Name as Member_Name,B.Title As Book_Title
from Member M
Join Loan L On m.Member_Id=L.Member_Id
join Book B on l.Book_ID=B.Book_ID
ORDER BY  Member_Name, B.Title;

--10. For each book located in 'Cairo Branch', show title, library name, manager, and shelf info.
select B.Title, L.Name As Library_name, S.F_Name+' '+S.L_Name as Manager_Name,B.ShelfLocation
from Book B
join Library L ON B.Library_ID=L.Library_ID
join Staff S on L.Library_ID=S.Library_ID
where L.Name='Cairo Branch' And s.Position='Manager';
--11. Display all staff members who manage libraries.
SELECT Staff_ID, Position, F_Name, L_Name, Library_ID
FROM Staff
WHERE Position = 'Manager';

--12. Display all members and their reviews, even if some didn’t submit any review yet.
SELECT 
    M.Member_Id, M.F_Name+' '+ M.L_Name AS Member_Name, R.Review_Id, R.Comments, R.Rating, R.ReviewDate, B.Title AS Book_Title
FROM Member M
LEFT JOIN   Review R ON M.Member_Id = R.Member_Id
LEFT JOIN Book B ON R.Book_ID = B.Book_ID
ORDER BY M.Member_Id;
