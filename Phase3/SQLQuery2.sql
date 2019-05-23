alter function PayBackFunc(@tourid char(5))
returns @PayBackPassenger table
(
	FirstName varchar(20),
	LastName varchar(30),
	PassengerID char(5) primary key,
	MobileNumber varchar(11),
	PayBackAmount money
)
as
begin
with PayBack_cte (FirstN,LastN,ID,Mobile,PayBack) as
(
	select p.FirstName,p.LastName,p.PassengerID,p.MobileNumber,case when (select datepart(hour,tt.DelayAtComingBack)) + (select datepart(hour,tt.DelayAtGoing)) > 5 then 0.5*at.Cost
	when (select datepart(hour,tt.DelayAtComingBack)) + (select datepart(hour,tt.DelayAtGoing)) >= 3 and (select datepart(hour,tt.DelayAtComingBack)) + (select datepart(hour,tt.DelayAtGoing)) <= 5 then 0.4*at.Cost
	else 0.2*at.Cost end
	from Taken_Tours as tt inner join Passenger as p on
	tt.PassengerID=p.PassengerID inner join Available_Tours as at on
	at.TourID=tt.TourID
	where (tt.DelayAtComingBack <> '00:00:00' or tt.DelayAtGoing <> '00:00:00') and tt.TourID=@tourid
)
insert @PayBackPassenger
select FirstN,LastN,ID,Mobile,PayBack
from PayBack_cte
return
end;

select FirstName,LastName,PassengerID,MobileNumber,PayBackAmount
from PayBackFunc(60001);

select FirstName,LastName,PassengerID,MobileNumber,PayBackAmount
from PayBackFunc(60002);

select FirstName,LastName,PassengerID,MobileNumber,PayBackAmount
from PayBackFunc(60003);