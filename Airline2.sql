create database Airline_New;
use Airline_New
go

create table AirPot(
AirPot_code int primary key,
City varchar(50),
state varchar(50),
name varchar(50),
);

create table AirPlane_type(
Type_name VARCHAR(50) primary key,
max_seats int,
company varchar(20),
 Airpot_Code int,
foreign key (Airpot_Code) references AirPot(AirPot_code),
);

create table AirPot_AirPlane(
 Airpot_Code int,
 Type_name VARCHAR(50),
primary key(AirPot_code,Type_name),
foreign key (Airpot_Code) references AirPot(AirPot_code),
foreign key (Type_name) references AirPlane_type(Type_name),
);

create table Flight_Leg(
Leg_no int primary key,
scheduled_arr_time TIME,
scheduled_dep_time Time,
 Airpot_Code int,
foreign key (Airpot_Code) references AirPot(AirPot_code)
);

create table Leg_instance(
NoOfAviSeates int primary key, 
Arr_time time,
Dep_time time,
 Airpot_Code int,
foreign key (Airpot_Code) references AirPot(AirPot_code),
);

create table AirPlan(
Airplane_Id int primary key,
 Type_name VARCHAR(50),
foreign key (Type_name) references AirPlane_type(Type_name),
Total_no_of_seats int
);

create table seat(
Seat_NO int primary key ,
Customer_name varchar(10),
Phone_Number VARCHAR(15),
);

create table flight(
Number int primary key ,
Airline VARCHAR(50),
Weekday VARCHAR(9),
);

create table fare(
Code int primary key ,
Number int,
foreign key (Number) references flight(Number),
Restiniction VARCHAR(30),
Amount  DECIMAL(10, 2 ),
);
alter table Flight_Leg
	add Number int foreign key references flight(Number);
	alter table Leg_instance
	add Airplane_Id int foreign key references AirPlan(Airplane_Id);

		
