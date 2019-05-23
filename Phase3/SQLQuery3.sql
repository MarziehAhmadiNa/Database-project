alter function AvgSalaryFunc(@Officeid char(7))
returns float
as
begin
	declare @ret float;
	with countstaff(officeid,tedad)as(
	select OfficeID,count(StaffID)
	from Staff
	group by OfficeID)
	select @ret=avg(Salary)
	from Staff inner join countstaff on
	Staff.OfficeID=countstaff.officeid
	where Staff.OfficeID=@Officeid and countstaff.tedad >= 2;
	return @ret;
end

select OfficeID,Name,WorkHours,dbo.AvgSalaryFunc(OfficeID)
from Offices