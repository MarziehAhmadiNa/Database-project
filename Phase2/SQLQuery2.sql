insert into Passenger (FirstName,LastName,PassengerID,MobileNumber,HomeNumber) values ('Marziye','Ahmadi','10000','09135426765','03132743142');
insert into Passenger (FirstName,LastName,PassengerID,MobileNumber,HomeNumber) values ('Ali','Sadeghi','10001','09321547281','03145278934');
insert into Passenger (FirstName,LastName,PassengerID,MobileNumber,HomeNumber) values ('Akram','Mohamadi','10002','09521456378','03134782156');
insert into Passenger (FirstName,LastName,PassengerID,MobileNumber,HomeNumber) values ('Mohmmad','Alavi','10003','09145712364','03134129037');
insert into Cities (CityID,CityName) values ('50001','Esfahan');
insert into Cities (CityID,CityName) values ('50002','Tehran');
insert into Cities (CityID,CityName) values ('50003','Ahvaz');
insert into Cities (CityID,CityName) values ('50004','Shiraz');
insert into Cities (CityID,CityName) values ('50005','Karaj');
insert into Cities (CityID,CityName) values ('50006','Semnan');
insert into Tours(TourType,Name,Number) values ('Flight','IranAir','IA524');
insert into Tours(TourType,Name,Number) values ('Flight','MahanAir','MA947');
insert into Tours(TourType,Name,Number) values ('Flight','QatarAir','QA7412');
insert into Tours(TourType,Name,Number) values ('Train','Raja','R1248');
insert into Tours(TourType,Name,Number) values ('Train','Noor','N4200');
insert into Tours(TourType,Name,Number) values ('Bus','IranPeyma','I98503');
insert into Tours(TourType,Name,Number) values ('Bus','BitaSeir','B5843');
insert into Available_Tours (TourID,TourType,Number,SourceCityID,DestinationCityID,NumberofDays,NumberofNights,Accomodation,Breakfast,Lunch,Dinner,Cost) values ('60001','Flight','IA524','50001','50002','6','5','Hotel Name : star','Yes','No','Yes','1952000');
insert into Available_Tours (TourID,TourType,Number,SourceCityID,DestinationCityID,NumberofDays,NumberofNights,Accomodation,Breakfast,Lunch,Dinner,Cost) values ('60002','Train','R1248','50002','50006','2','1','Hotel Name : almas','Yes','No','No','850000');
insert into Taken_Tours (PassengerID,TourID,DelayAtGoing,DelayAtComingBack) values ('10000','60001','00:00:00.000','01:00:00.000');
insert into Taken_Tours (PassengerID,TourID,DelayAtGoing,DelayAtComingBack) values ('10002','60001','00:00:00.000','01:00:00.000');
insert into Taken_Tours (PassengerID,TourID,DelayAtGoing,DelayAtComingBack) values ('10003','60002','02:30:00.000','01:30:00.000');
insert into Offices(OfficeID,[Address],CityID,MobileNumber,OfficeNumber,FaxNumber,WhatsappNumber,Email,WorkHours) values 
('70001','First Avenue,Second Street','50001','09145783504','03135221510','03215719436','09145783504','OfficeOne@gmail.com','All days 8AM-2AM & 4PM-8PM');
insert into Offices(OfficeID,[Address],CityID,MobileNumber,OfficeNumber,FaxNumber,WhatsappNumber,Email,WorkHours) values 
('70002','Sharyati Avenue,Third Street','50002','09127521001','02147775201','01034725661','09127521001','OfficeTwo@gmail.com','All days 8AM-8PM');
insert into Offices(OfficeID,[Address],CityID,MobileNumber,OfficeNumber,FaxNumber,WhatsappNumber,Email,WorkHours) values 
('70003','Esteghlal Avenue,Abasi Street','50002','09120123345','02134201187','04778203642','09120123345','OfficeThree@gmail.com','All days 8AM-2PM');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber) values
('Azam','Safaran','80001','70001','09132478901','03142743152');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber) values
('Ali','Gholami','80002','70001','09905074512','03137778412');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber) values
('Mahmood','Ahmadi','80003','70001','09147100211','03134447520');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber) values
('Negin','Solati','80004','70002','09124710365','02140200166');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber) values
('Faeze','Akhavan','80005','70002','09124871003','02162033149');
insert into Staff(FirstName,LastName,StaffID,OfficeID,MobileNumber,HomeNumber) values
('Fateme','Mostafae','80006','70003','09907144814','03778015423');