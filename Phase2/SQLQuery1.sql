create table Passenger
(
FirstName varchar(20) not null,
LastName varchar(30) not null,
PassengerID char(5) primary key,
MobileNumber varchar(11) check (MobileNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
HomeNumber varchar(11) check (HomeNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
create table Cities
(
CityID char(5) primary key,
CityName varchar(10)
);
create table Tours
(
TourType varchar(6) check (TourType in('Flight','Train','Bus')),
Name varchar(15),
Number varchar(15),
primary key(Number,TourType)
);
create table Available_Tours
(
TourID char(5) primary key,
TourType varchar(6),
Number varchar(15),
Going datetime,
CommingBack datetime,
SourceCityID char(5),
DestinationCityID char(5),
NumberofDays int,
NumberofNights int,
Accomodation varchar(30),
Breakfast varchar(3) check (Breakfast in('Yes','No')),
Lunch varchar(3) check (Lunch in('Yes','No')),
Dinner varchar(3) check (Dinner in('Yes','No')),
Cost money,
foreign key (SourceCityID) references Cities(CityID),
foreign key (DestinationCityID) references Cities(CityID),
foreign key (Number,TourType) references Tours(Number,TourType)
);
create table Taken_Tours
(
PassengerID char(5),
TourID char(5),
DelayAtGoing time,
DelayAtComingBack time,
primary key(PassengerID,TourID),
foreign key (PassengerID) references Passenger(PassengerID),
foreign key (TourID) references Available_tours(TourID),
);
create table Offices
(
OfficeID char(7) primary key,
[Address] varchar(30),
CityID char(5),
MobileNumber varchar(11) check (MobileNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
OfficeNumber varchar(11) check (OfficeNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
FaxNumber varchar(11) check (FaxNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
WhatsappNumber varchar(11) check (WhatsappNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email varchar(100),
WorkHours varchar(30),
foreign key (CityID) references Cities(CityID)
);
create table Staff
(
FirstName varchar(20) not null,
LastName varchar(30) not null,
StaffID char(5) primary key,
OfficeID char(7),
MobileNumber varchar(11) check (MobileNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
HomeNumber varchar(11) check (HomeNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
foreign key (OfficeID) references Offices(OfficeID)
);


alter table Staff
add Salary money