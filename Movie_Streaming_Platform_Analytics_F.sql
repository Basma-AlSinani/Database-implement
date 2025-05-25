use Movie_Streaming_Platform_Analytics
create table Users(
UserID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE,
SubscriptionType VARCHAR(20) )

create table Movies(
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT,
DurationMinutes INT)

create table WatchHistory(
WatchID INT PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(UserID),
MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
WatchDate DATE,
WatchDuration INT)

INSERT INTO Users (UserID, FullName, Email, JoinDate, SubscriptionType) VALUES
(1, 'Ali Al Hinai', 'ali@example.com', '2024-01-01', 'Premium'),
(2, 'Noor Al Busaidi', 'noor@example.com', '2024-02-15', 'Basic'),
(3, 'Hassan Al Rawahi', 'hassan@example.com', '2024-03-10', 'Free'),
(4, 'Muna Al Lawati', 'muna@example.com', '2024-04-05', 'Premium'),
(5, 'Salim Al Zadjali', 'salim@example.com', '2024-05-01', 'Basic');

INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMinutes) VALUES
(1, 'The Silent Ocean', 'Sci-Fi', 2023, 120),
(2, 'Omani Roots', 'Documentary', 2022, 90),
(3, 'Fast Track', 'Action', 2024, 130),
(4, 'Code & Coffee', 'Drama', 2023, 110),
(5, 'The Last Byte', 'Thriller', 2023, 105);

INSERT INTO WatchHistory (WatchID, UserID, MovieID, WatchDate, WatchDuration) VALUES
(1, 1, 1, '2025-05-10', 120),
(2, 2, 2, '2025-05-11', 80),
(3, 3, 3, '2025-05-12', 60),
(4, 4, 1, '2025-05-12', 90),
(5, 5, 5, '2025-05-13', 105); 


--Beginner Level (Basic Practice)
--1. Total Number of Users
select COUNT(*) AS NumberOfUser
from Users
--2. Average Duration of All Movies 
select AVG(DurationMinutes) AS Average_Duration
from Movies

--3. Total Watch Time
select  SUM(WatchDuration) AS Total_Watch
from WatchHistory

--4. Number of Movies per Genre 
select Genre,COUNT(*) AS NumberOfMovies
from Movies 
group by Genre

--5. Earliest User Join Date 
select MIN(JoinDate) AS Earliest
from Users

--6. Latest Movie Release Year 
select MAX(ReleaseYear) AS Release
from Movies

--Intermediate Level (Deeper Insights)
--4. Number of Users Per Subscription Type
select SubscriptionType,COUNT(*) AS Subscription_Type
from Users
group by SubscriptionType

--5. Total Watch Time per User 
select U.FullName,SUM(WatchDuration) AS Total_Watch
from Users U
join WatchHistory W ON U.UserID=W.UserID
group by U.FullName

--6. Average Watch Duration per Movie 
select M.Title,AVG(WatchDuration) AS Average_Watch
from Movies M
join WatchHistory W ON M.MovieID=W.MovieID
group by M.Title

--7. Average Watch Time per Subscription Type 
 select U.SubscriptionType ,AVG(WatchDuration) AS AverageWatch
 from Users U
 join WatchHistory W ON U.UserID=W.MovieID
 group by U.SubscriptionType

 --8. Number of Views per Movie (Including Zero) 
select M.Title,COUNT(WatchID) AS NumberOfViews
from Movies M
join WatchHistory W ON M.MovieID=W.MovieID
group by M.Title

--9. Average Movie Duration per Release Year
select ReleaseYear,AVG(DurationMinutes) AS AverageDuration
from Movies
group by ReleaseYear

--Advanced Level (Challenging Scenarios) 
--7. Most Watched Movie 
select M.Title,SUM(W.WatchDuration) AS TotalWatch
from Movies M
join WatchHistory W ON m.MovieID=w.MovieID
group by m.Title
order by TotalWatch DESC

--8. Users Who Watched More Than 100 Minutes 
select U.FullName, SUM(W.WatchDuration) AS TotalWatch
from Users U
join WatchHistory W on U.UserID=W.UserID
group by U.FullName
having SUM(W.WatchDuration)>100

--9. Total Watch Time per Genre 
select M.Genre ,SUM(W.WatchDuration) AS TotalWatch
from Movies M
join WatchHistory W on m.MovieID=w.UserID
group by M.Genre;

--10. Identify Binge Watchers (Users Who Watched 2 or More Movies in One Day) 
select U.FullName,W.WatchDate,COUNT(*)AS MoviesWatched 
from WatchHistory W
join Users U ON W.UserID=W.UserID
group by U.FullName,W.WatchDate
having COUNT(*)>=2
order by W.WatchDate

--11. Genre Popularity (Total Watch Duration by Genre)
SELECT M.Genre, SUM(W.WatchDuration) AS TotalDuration
FROM WatchHistory W
JOIN Movies M ON W.MovieID = M.MovieID
GROUP BY M.Genre
ORDER BY TotalDuration DESC;

-- 12. User Retention Insight: Number of Users Joined Each Month
SELECT JoinDate AS JoinMonth,COUNT(*) AS NewUsers
FROM Users
GROUP BY JoinDate
ORDER BY JoinMonth;