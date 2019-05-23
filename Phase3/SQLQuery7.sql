alter table Passenger add NumOfTakenTours int;
alter trigger Number_Of_Tours on Taken_Tours after update , insert,delete
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