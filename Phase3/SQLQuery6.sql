create view Office_Total_Salary(OfficeName,TotalSalary) as
(
	select Name,sum(Salary)
	from Offices inner join Staff on
	Offices.OfficeID=Staff.OfficeID
	group by Name
)

select * from Office_Total_Salary