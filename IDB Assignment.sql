CREATE DATABASE Malaysia_Airlines_Reservation_System

CREATE TABLE Airlines(
Airline_ID NVARCHAR(50) PRIMARY KEY,
Airlines_Name NVARCHAR(50),
);

CREATE TABLE States(
State_ID NVARCHAR(50) PRIMARY KEY,
State_Name NVARCHAR(50),
);

CREATE TABLE Branch(
Branch_ID NVARCHAR(50) PRIMARY KEY,
Branch NVARCHAR(50)FOREIGN KEY REFERENCES States(State_ID),
);

CREATE TABLE Flights(
Flight_Number NVARCHAR(50) PRIMARY KEY,
Airline_ID NVARCHAR(50)FOREIGN KEY REFERENCES Airlines(Airline_ID),
Total_BC_Seats INT,
Total_EC_Seats INT,
Departure_Date DATE,
Departure_Time TIME,
Arrival_Date DATE,
Arrival_Time TIME,
EC_Seats_Price DECIMAL(10,2),
BC_Seats_Price DECIMAL(10,2),
);
CREATE TABLE FlightStates(
Flight_Number NVARCHAR(50) FOREIGN KEY REFERENCES Flights(Flight_Number),
Origin_State NVARCHAR(50) FOREIGN KEY REFERENCES States(State_ID),
Destination_State NVARCHAR(50) FOREIGN KEY REFERENCES States(State_ID),
);

CREATE TABLE Pilots(
Pilot_ID NVARCHAR(50) PRIMARY KEY,
Pilot_Fname NVARCHAR(50),
Pilot_Lname NVARCHAR(50),
Age INT,
Experience_Years INT,
Flying_Hours INT,
Salary DECIMAL(10,2),
);

CREATE TABLE FlightAttendants(
FA_ID NVARCHAR(50) PRIMARY KEY,
FA_Name NVARCHAR(50),
Position NVARCHAR(50),
Salary DECIMAL(10,2),
PhoneNumber NVARCHAR(50),
House_no NVARCHAR(50),
Street NVARCHAR(50),
City NVARCHAR(50),
State NVARCHAR(50),
Postal_Code NVARCHAR(50),
Country NVARCHAR(50),
);

CREATE TABLE Customers(
Cust_ID NVARCHAR(50) PRIMARY KEY,
Cust_Fname NVARCHAR(50),
Cust_Lname NVARCHAR(50),
House_no NVARCHAR(50),
Street NVARCHAR(50),
City NVARCHAR(50),
State NVARCHAR(50),
Postal_Code NVARCHAR(50),
Country NVARCHAR(50),
);

CREATE TABLE CustomerEmail(
Cust_ID NVARCHAR(50) FOREIGN KEY REFERENCES Customers(Cust_ID),
Cust_Email NVARCHAR(50),
);

CREATE TABLE CustomerPhone(
Cust_ID NVARCHAR(50) FOREIGN KEY REFERENCES Customers(Cust_ID),
Cust_Phone NVARCHAR(50),
);

CREATE TABLE Bookings(
Booking_ID NVARCHAR(50) PRIMARY KEY,
Booking_State NVARCHAR(50) FOREIGN KEY REFERENCES Branch(Branch_ID),
Booking_Date Date,
Cust_ID NVARCHAR(50) FOREIGN KEY REFERENCES Customers(Cust_ID),
);

CREATE TABLE FlightBookings(
Booking_ID NVARCHAR(50) FOREIGN KEY REFERENCES Bookings(Booking_ID),
Flight_Number NVARCHAR(50) FOREIGN KEY REFERENCES Flights(Flight_Number),
EC_Seats_Booked INT,
BC_Seats_Booked INT,
);

CREATE TABLE PilotRoster(
Flight_Number NVARCHAR(50) FOREIGN KEY REFERENCES Flights(Flight_Number),
Captain NVARCHAR(50) FOREIGN KEY REFERENCES Pilots(Pilot_ID),
Co_Captain NVARCHAR(50) FOREIGN KEY REFERENCES Pilots(Pilot_ID),
);

CREATE TABLE FlightAttendantRoster(
Flight_Number NVARCHAR(50) FOREIGN KEY REFERENCES Flights(Flight_Number),
FA_OnDuty NVARCHAR(50) FOREIGN KEY REFERENCES FlightAttendants(FA_ID),
);

INSERT INTO Airlines
(Airline_ID, Airlines_Name)
VALUES
('EA1709', 'Echo Airline'),
('SA1865', 'Spark Airways'),
('PA2098', 'Peak Airways'),
('CA8760', 'Core Airways');

INSERT INTO States
(State_ID, State_Name)
VALUES
('S01', 'Perak'),
('S02', 'Negeri Sembilan'),
('S03', 'Pahang'),
('S04', 'Sabah'),
('S05', 'Sarawak'),
('S06', 'Wilayah Persekutuan Kuala Lumpur');

SELECT* FROM States

INSERT INTO Branch
(Branch_ID, Branch)
VALUES
('BR01','S01'),
('BR02','S02'),
('BR03','S03'),
('BR04','S04'),
('BR05','S05'),
('BR06','S06');

SELECT* FROM Branch

INSERT INTO Flights
(Flight_Number, Airline_ID, Total_BC_Seats, Total_EC_Seats, Departure_Date,Departure_Time, Arrival_Date, Arrival_Time, EC_Seats_Price, BC_Seats_Price)
VALUES
('PA001','PA2098', 30, 120, '2022-12-14', '23:00:00', '2022-12-14', '00:30:00', 250.00, 500.00),
('EA006','EA1709', 25, 110, '2022-10-24', '12:20:00', '2022-10-24', '13:20:00', 120.00, 290.00),
('PA005','PA2098', 28, 118, '2022-11-02', '18:30:00', '2022-11-02', '20:00:00',180.00, 450.00),
('SA001','SA1865', 26, 115, '2022-11-27', '13:15:00', '2022-11-27', '14:00:00', 190.00, 550.00),
('SA003','SA1865', 18, 85, '2022-12-13', '15:45:00', '2022-12-13', '16:35:00', 200.00, 600.00),
('CA004','CA8760', 24, 98, '2022-11-28', '02:30:00', '2022-11-28', '05:00:00',210.00, 480.00),
('SA007','SA1865', 30, 120, '2022-11-14', '20:00:00', '2022-11-14', '20:45:00',250.00, 500.00);

SELECT* FROM Flights

INSERT INTO FlightStates
(Flight_Number, Origin_State, Destination_State)
VALUES
('PA001','S04', 'S01'),
('EA006','S01', 'S02'),
('PA005','S02', 'S04'),
('SA001','S03', 'S06'),
('SA003','S06', 'S01'),
('CA004','S01', 'S05'),
('SA007','S06', 'S03');

SELECT* FROM FlightStates

INSERT INTO Pilots
(Pilot_ID, Pilot_Fname, Pilot_Lname, Age, Experience_Years, Flying_Hours, Salary)
VALUES
('P001', 'Pearson', 'Hill', 60, 30, 24277, 65100.00),
('P002', 'Larrisa', 'Lambert', 37, 12, 5006, 41000.00),
('P003', 'Mikael', 'Tinnason', 60, 28, 23500, 63000.00),
('P004', 'San Cheung', 'Chong', 36, 10, 3750, 32000.00),
('P005', 'Loh Hui', 'Tan', 57, 28, 20625, 60200.00),
('P006', 'Kim Wai', 'Lau', 59, 28, 21003, 61000.00),
('P007', 'James', 'Dean', 35, 9, 2852, 25000.00);

SELECT* FROM Pilots

INSERT INTO FlightAttendants
(FA_ID, FA_Name, Position, Salary, PhoneNumber, House_no, Street, City, State, Postal_Code, Country)
VALUES
('FA001', 'Thomas Winston', 'Junior Flight Attendant', 3500, '60123698745', 'Lot 12', 'Kuala Berang Street', 'Marang', 'Terangganu', '21040', 'Malaysia'),
('FA002', 'James Leonard', 'Junior Flight Attendant', 3000, '60189874613', 'Lot 315', 'Airport Street', 'Sandakan', 'Sabah', '90000', 'Malaysia'),
('FA003', 'Alex Bradford', 'Junior Flight Attendant', 3900, '60195214637', 'No.998', 'Sungai Besi Street', 'Sungai Besi', 'Wilayah Persekutuan Kuala Lumpur', '57100', 'Malaysia'),
('FA004', 'Bob Alden', 'Junior Flight Attendant', 2800, '60164615793', 'Lot 152', 'Technology Street', 'Bukit Jalil', 'Wilayah Persekutuan Kuala Lumpur', '57000', 'Malaysia'),
('FA005', 'Derby George', 'Senior Flight Attendant', 5000, '60136732551', 'Lot 325', 'Air Putih Street', 'Kuantan', 'Pahang', '25300', 'Malaysia'),
('FA006', 'Edwin Dwight', 'Senior Flight Attendant', 4500, '60146723104', 'No.666', 'Ismail Street', 'Muar', 'Johor', '84000', 'Malaysia'),
('FA007', 'Justin Kay', 'Junior Flight Attendant', 2500, '60172734590', 'No.351', 'Sulaman Street', 'Kota Kinabalu', 'Sabah', '88450', 'Malaysia');

INSERT INTO FlightAttendants
(FA_ID, FA_Name, Position, Salary, PhoneNumber, House_no, Street, City, State, Postal_Code, Country)
VALUES
('FA008', 'George Lasson', 'Senior Flight Attendant', 5000, '60136732551', 'Lot 325', 'Air Putih Street', 'Kuantan', 'Pahang', '25300', 'Malaysia');

SELECT* FROM FlightAttendants

INSERT INTO Customers
(Cust_ID, Cust_Fname, Cust_Lname, House_no, Street, City, State, Postal_Code, Country)
VALUES
('CU001', 'Eunice', 'Chua', '21', 'Jln Pertama, Tmn Pertama', 'Marang', 'Terengganu', '21040', 'Malaysia'),
('CU002', 'Yan Xi', 'Goh', '29', 'Jln Ismail, Tmn Sejati', 'Sandakan', 'Sabah', '90000', 'Malaysia'),
('CU003', 'Jerry', 'Tan', '23', 'Jln Yayah 5, Tmn  Daya', 'Johor Bahru', 'Johor', '80000', 'Malaysia'),
('CU004', 'Yue', 'Zhao', '93', 'South Section 1, Yihuan Road', 'Chengdu', 'Sichuan', '610000', 'China'),
('CU005', 'Jun Wen', 'Ooi', '355', 'Jln Airport, Tmn Merpati', 'Sandakan', 'Sabah', '90000', 'Malaysia'),
('CU006', 'Joshua', 'Chin', '814', 'Jln Sri Petaling, Tmn Sri Endah', 'Sri Petaling', 'Wilayah Persekutuan Kuala Lumpur', '57000', 'Malaysia'),
('CU007', 'Hao Wen', 'Ow', '20', '495 Grove Street', 'NewYork City', 'NewYork', '10014', 'USA');

SELECT* FROM Customers

INSERT INTO CustomerEmail
(Cust_ID, Cust_Email)
VALUES
('CU003','jerry@gmail.com'),
('CU003','jerry.tan@gmail.com'),
('CU004','yueyue@gmail.com'),
('CU002','elton@gmail.com'),
('CU002','elton_goh@gmail.com'),
('CU006','jchin@gmail.com'),
('CU005','junwen00@gmail.com');

INSERT INTO CustomerPhone
(Cust_ID, Cust_Phone)
VALUES
('CU003','60124568910'),
('CU003','60126547782'),
('CU004','60145874162'),
('CU002','60158539964'),
('CU002','60132415531'),
('CU006','60198836542'),
('CU005','60175532276');

INSERT INTO Bookings
(Booking_ID, Booking_State, Booking_Date, Cust_ID)
VALUES
('BK01', 'BR05', '2022-10-01', 'CU003'),
('BK02', 'BR06', '2022-10-09', 'CU007'),
('BK03', 'BR02', '2022-10-10', 'CU007'),
('BK04', 'BR01', '2022-10-13', 'CU003'),
('BK05', 'BR01', '2022-10-15', 'CU007'),
('BK06', 'BR03', '2022-10-19', 'CU002'),
('BK07', 'BR04', '2022-10-20', 'CU005');

INSERT INTO FlightBookings
(Booking_ID, Flight_Number, EC_Seats_Booked, BC_Seats_Booked)
VALUES
('BK01', 'PA001', 2, 0),
('BK02', 'EA006', 3, 0),
('BK02', 'CA004', 1, 0),
('BK03', 'PA005', 3, 2),
('BK04', 'EA006', 1, 0),
('BK04', 'PA005', 0, 1),
('BK05', 'SA007', 0, 2),
('BK06', 'SA003', 3, 0),
('BK06', 'PA005', 5, 0),
('BK06', 'CA004', 4, 1),
('BK07', 'EA006', 0, 2);

SELECT* FROM FlightBookings

INSERT INTO PilotRoster
(Flight_Number, Captain, Co_Captain)
VALUES
('PA001', 'P001', 'P004'),
('EA006', 'P005', 'P004'),
('PA005', 'P003', 'P006'),
('SA001', 'P001', 'P007'),
('SA003', 'P001', 'P002'),
('CA004', 'P006', 'P007'),
('SA007', 'P005', 'P003');

SELECT* FROM PilotRoster

INSERT INTO FlightAttendantRoster
(Flight_Number,FA_OnDuty)
VALUES
('SA001', 'FA006'),
('SA001', 'FA007'),
('SA007', 'FA002'),
('SA007', 'FA007'),
('PA001', 'FA003'),
('PA001', 'FA002'),
('PA001', 'FA005'),
('EA006', 'FA004'),
('EA006', 'FA006'),
('PA005', 'FA005'),
('PA005', 'FA002'),
('CA004', 'FA001'),
('SA003', 'FA003');

SELECT* FROM FlightAttendantRoster

ALTER TABLE Pilots
ADD Position AS CAST
(
CASE
WHEN Flying_Hours >= 20000 THEN 'Senior Pilot' ELSE 'Junior Pilot'
END AS NVARCHAR(50)
)
GO

SELECT* FROM FlightStates
/* 

1. Find the highest salary of flight attendants.
2. List the name and the position of flight attendants whose salary is neither 2,800 nor 3,500.
3. Display customer’s first name and last name who have made the most number of booking. 

*/



/*Student 4 Q1*/
SELECT * FROM FlightAttendants WHERE Salary = (SELECT MAX(Salary) FROM FlightAttendants);

/*Student 4 Q2*/
SELECT FA_Name, Position FROM FlightAttendants WHERE Salary != 2800 AND  Salary != 3500;

/*Student 4 Q3*/
SELECT TOP 1 WITH TIES Customers.Cust_Fname, Customers.Cust_Lname, COUNT (Booking_ID) AS NumberOfBookings FROM Bookings
JOIN Customers ON Customers.Cust_ID = Bookings.Cust_ID 
GROUP BY Customers.Cust_Fname, Customers.Cust_Lname ORDER BY NumberOfBookings DESC;
 

SELECT TOP 1 WITH TIES Customers.Cust_Fname, Customers.Cust_Lname, COUNT (Booking_ID) AS NumberOfBookings FROM Bookings
JOIN Customers ON Customers.Cust_ID = Bookings.Cust_ID GROUP BY Customers.Cust_Fname, Customers.Cust_Lname ORDER BY NumberOfBookings ASC;


/* Student 2 Q3 */

SELECT DISTINCT(FlightAttendants.FA_Name), FlightAttendants.Position FROM FlightAttendants
JOIN FlightAttendantRoster ON FlightAttendantRoster.FA_OnDuty = FlightAttendants.FA_ID
JOIN Flights ON Flights.Flight_Number = FlightAttendantRoster.Flight_Number
JOIN PilotRoster ON Flights.Flight_Number = PilotRoster.Flight_Number
JOIN Pilots ON PilotRoster.Captain = Pilots.Pilot_ID OR PilotRoster.Co_Captain = Pilots.Pilot_ID
WHERE Pilots.Pilot_Fname= 'Mikael' AND Pilots.Pilot_Lname= 'Tinnason';

/* Student 3 Q3  Show the AirlineID, AirlineName and the total number of flights for each Airline*/

SELECT Airlines.Airline_ID, Airlines.Airlines_Name, COUNT(Flights.Flight_Number) AS NumberOfFlights FROM Flights
JOIN Airlines ON Flights.Airline_ID = Airlines.Airline_ID 
GROUP BY  Airlines.Airline_ID, Airlines.Airlines_Name;

SELECT* FROM Flights
/* Display the flight with the most number of seats for business class. */

SELECT TOP 1 WITH TIES Flight_Number, Airline_ID, Total_BC_Seats, Total_EC_Seats, Departure_Date,Departure_Time, Arrival_Date, Arrival_Time, EC_Seats_Price, BC_Seats_Price FROM Flights 
ORDER BY Total_BC_Seats DESC
/* Setting conditions for Position */


/*3. Find the Airline with the most number of flights.*/

SELECT TOP 1 WITH TIES Airlines.Airlines_Name, COUNT(Airlines.Airline_ID) AS NumberOfFlights FROM Airlines 
JOIN Flights ON Flights.Airline_ID = Airlines.Airline_ID GROUP BY Airlines.Airlines_Name ORDER BY NumberOfFlights DESC;

SELECT*FROM Flights

/*2. List all customer’s first name and last name who did not place any booking. 
Sort the records by customer id in descending order.*/
SELECT Cust_Fname, Cust_Lname FROM Customers 
WHERE Cust_ID NOT IN (SELECT Cust_ID FROM Bookings WHERE Cust_ID IS NOT NULL) 
ORDER BY Cust_ID DESC


SELECT AVG(Salary*12) AS AnnualSalary FROM FlightAttendants

SELECT FA_ID, FA_Name, AVG(Salary*12) AS AnnualSalary FROM FlightAttendants
GROUP BY  FA_ID, FA_Name