alter table Available_Tours add OfficeID char(7) foreign key (OfficeID) references Offices(OfficeID)

alter table Available_Tours drop column NumberofDays
alter table Available_Tours drop column NumberofNights

alter table Taken_Tours drop column DelayAtGoing
alter table Taken_Tours drop column DelayAtComingBack

create table DelayofTours
(
	TourID char(5),
	DelayatGoing time,
	DelayatComingBack time,
	foreign key (TourID) references Available_Tours(TourID)
)

insert into DelayofTours (TourID,DelayatGoing,DelayatComingBack) values ('60001','01:30:00','02:00:00')
insert into DelayofTours (TourID,DelayatGoing,DelayatComingBack) values ('60002','02:00:00','00:00:00')