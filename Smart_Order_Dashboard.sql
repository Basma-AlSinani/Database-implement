create database Smart_Order_Dashboard
use Smart_Order_Dashboard

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Phone VARCHAR(20),
    ReferralID INT NULL,
    FOREIGN KEY (ReferralID) REFERENCES Customers(CustomerID),
);

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    Name NVARCHAR(100),
    City NVARCHAR(50),
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ItemName NVARCHAR(100),
    Quantity INT,
    Price DECIMAL(6,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
);

CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName NVARCHAR(100),
    Price DECIMAL(6,2),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
);

-- Customers
INSERT INTO Customers VALUES 
(1, 'Ahmed AlHarthy', '91234567', NULL),
(2, 'Fatma AlBalushi', '92345678', 1),
(3, 'Salim AlZadjali', '93456789', NULL),
(4, 'Aisha AlHinai', '94567890', 2);

-- Restaurants
INSERT INTO Restaurants VALUES 
(1, 'Shawarma King', 'Muscat'),
(2, 'Pizza World', 'Sohar'),
(3, 'Burger Spot', 'Nizwa');

-- Menu
INSERT INTO Menu VALUES
(1, 1, 'Shawarma Chicken', 1.500),
(2, 1, 'Shawarma Beef', 1.800),
(3, 2, 'Pepperoni Pizza', 3.000),
(4, 2, 'Cheese Pizza', 2.500),
(5, 3, 'Classic Burger', 2.000),
(6, 3, 'Zinger Burger', 2.200);

-- Orders
INSERT INTO Orders VALUES
(101, 1, 1, '2024-05-01', 'Delivered'),
(102, 2, 2, '2024-05-02', 'Preparing'),
(103, 3, 1, '2024-05-03', 'Cancelled'),
(104, 4, 3, '2024-05-04', 'Delivered');



















--Widget 1: Active Orders Summary  Show all active orders (Status = 'Preparing') with customer name, restaurant name, and order date.
select C.FullName AS CustomerName,R.Name AS ResturantName,O.OrderDate
from Orders O
join Customers C ON O.CustomerID=C.CustomerID
join Restaurants R ON O.RestaurantID=R.RestaurantID
where O.Status='Preparing';

--Widget 2: Restaurant Menu Coverage List all menu items offered by each restaurant and whether they have ever been ordered. Include items that have never been ordered. 
select * from OrderItems
select * from Menu
select * from Orders
select * from Restaurants
select M.* ,R.Name
from Menu M inner join Restaurants R on R.RestaurantID=M.RestaurantID
left outer join Orders O on O.RestaurantID=M.RestaurantID

--Widget 3: Customers Without Orders Display all customers, including those who have never placed any orders.
select*
from Customers C
inner join Orders O on O.CustomerID=C.CustomerID
where O.OrderID =null;  

--Widget 4: Full Engagement Report Display a full list of customer and order combinations, including customers who never ordered and orders that belong to non-existent customers.
select C.*,O.*
from Customers C
left outer join Orders O on O.CustomerID=C.CustomerID

--Widget 5: Referral Tree List each customer along with the full name of the person who referred them, if any.
select C.FullName ,R.FullName
from Customers C
left join Customers R on C.ReferralID=R.CustomerID

--Widget 6: Menu Performance Tracker For each restaurant, show item name, number of times it was ordered, and total quantity sold. Include items even if they were never ordered.