drop table Staff
drop table Taken_Tours
drop table DelayofTours
drop table Available_Tours
drop table Offices


create table Offices
(
OfficeID char(5) primary key,
[Address] varchar(30),
CityID char(5),
MobileNumber varchar(11) check (MobileNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
OfficeNumber varchar(11) check (OfficeNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
FaxNumber varchar(11) check (FaxNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
WhatsappNumber varchar(11) check (WhatsappNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email varchar(100),
WorkHours varchar(30),
Name varchar(10),
foreign key (CityID) references Cities(CityID)
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
Accomodation varchar(30),
Breakfast varchar(3) check (Breakfast in('Yes','No')),
Lunch varchar(3) check (Lunch in('Yes','No')),
Dinner varchar(3) check (Dinner in('Yes','No')),
Cost money,
OfficeID char(5),
foreign key (SourceCityID) references Cities(CityID),
foreign key (DestinationCityID) references Cities(CityID),
foreign key (Number,TourType) references Tours(Number,TourType),
foreign key (OfficeID) references Offices(OfficeID),
);

create table DelayofTours
(
	TourID char(5) primary key,
	DelayatGoing time,
	DelayatComingBack time,
	foreign key (TourID) references Available_Tours(TourID)
);


create table Taken_Tours
(
PassengerID int,
TourID char(5),
primary	key (PassengerID,TourID),
foreign key (PassengerID) references Passenger(PassengerID),
foreign key (TourID) references Available_tours(TourID),
);

create table Staff
(
FirstName varchar(20) not null,
LastName varchar(30) not null,
StaffID char(5) primary key,
OfficeID char(5),
MobileNumber varchar(11) check (MobileNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
HomeNumber varchar(11) check (HomeNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Salary money,
Gender varchar(6) check (Gender in ('Female','Male')),
foreign key (OfficeID) references Offices(OfficeID)
);

insert into Offices(OfficeID,[Address],CityID,MobileNumber,OfficeNumber,FaxNumber,WhatsappNumber,Email,WorkHours,Name) values 
('70001','First Avenue,Second Street','50001','09145783504','03135221510','03215719436','09145783504','OfficeOne@gmail.com','All days 8AM-2AM & 4PM-8PM','Office1');
insert into Offices(OfficeID,[Address],CityID,MobileNumber,OfficeNumber,FaxNumber,WhatsappNumber,Email,WorkHours,Name) values 
('70002','Sharyati Avenue,Third Street','50002','09127521001','02147775201','01034725661','09127521001','OfficeTwo@gmail.com','All days 8AM-8PM','Office2');
insert into Offices(OfficeID,[Address],CityID,MobileNumber,OfficeNumber,FaxNumber,WhatsappNumber,Email,WorkHours,Name) values 
('70003','Esteghlal Avenue,Abasi Street','50002','09120123345','02134201187','04778203642','09120123345','OfficeThree@gmail.com','All days 8AM-2PM','Office3');

insert into Available_Tours (TourID,TourType,Number,SourceCityID,DestinationCityID,Accomodation,Breakfast,Lunch,Dinner,Cost,OfficeID) values ('60001','Flight','IA524','50001','50002','Hotel Name : star','Yes','No','Yes','1952000','70001');
insert into Available_Tours (TourID,TourType,Number,SourceCityID,DestinationCityID,Accomodation,Breakfast,Lunch,Dinner,Cost,OfficeID) values ('60002','Train','R1248','50002','50006','Hotel Name : almas','Yes','No','No','850000','70003');

insert into DelayofTours (TourID,DelayatGoing,DelayatComingBack) values ('60001','01:30:00','02:00:00');
insert into DelayofTours (TourID,DelayatGoing,DelayatComingBack) values ('60002','02:00:00','00:00:00');

insert into Taken_Tours (PassengerID,TourID) values ('1','60001');
insert into Taken_Tours (PassengerID,TourID) values ('3','60001');
insert into Taken_Tours (PassengerID,TourID) values ('4','60002');

create trigger Number_Of_Tours on Taken_Tours after update , insert,delete
as
begin
update Passenger
set NumOfTakenTours=
(
select count(TourID)
from Taken_Tours
where Taken_Tours.PassengerID=Passenger.PassengerID
)
end

insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber,Salary,Gender) values
('Azam','Safaran','80001','70001','09132478901','03142743152','2000000','Female');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber,Salary,Gender) values
('Ali','Gholami','80002','70001','09905074512','03137778412','1000000','Male');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber,Salary,Gender) values
('Mahmood','Ahmadi','80003','70001','09147100211','03134447520','3000000','Male');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber,Salary,Gender) values
('Negin','Solati','80004','70002','09124710365','02140200166','5000000','Female');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber,Salary,Gender) values
('Faeze','Akhavan','80005','70002','09124871003','02162033149','780000','Female');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber,Salary,Gender) values
('Fateme','Mostafae','80006','70003','09907144814','03778015423','2400000','Female');
