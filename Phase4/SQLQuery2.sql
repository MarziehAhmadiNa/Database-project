
drop table Taken_Tours
drop table Passenger

create table Passenger
(
FirstName varchar(20) not null,
LastName varchar(30) not null,
PassengerID int primary key identity,
MobileNumber varchar(11) check (MobileNumber like '09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
HomeNumber varchar(11) check (HomeNumber like '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
NumOfTakenTours int
);

create table Taken_Tours
(
PassengerID int,
TourID char(5),
primary	key (PassengerID,TourID),
foreign key (PassengerID) references Passenger(PassengerID),
foreign key (TourID) references Available_tours(TourID),
);

insert into Passenger (FirstName,LastName,MobileNumber,HomeNumber) values ('Marziye','Ahmadi','09135426765','03132743142');
insert into Passenger (FirstName,LastName,MobileNumber,HomeNumber) values ('Ali','Sadeghi','09321547281','03145278934');
insert into Passenger (FirstName,LastName,MobileNumber,HomeNumber) values ('Akram','Mohamadi','09521456378','03134782156');
insert into Passenger (FirstName,LastName,MobileNumber,HomeNumber) values ('Mohmmad','Alavi','09145712364','03134129037');

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

insert into Taken_Tours (PassengerID,TourID) values ('1','60001');
insert into Taken_Tours (PassengerID,TourID) values ('3','60001');
insert into Taken_Tours (PassengerID,TourID) values ('4','60002');


SET IDENTITY_INSERT Passenger ON



