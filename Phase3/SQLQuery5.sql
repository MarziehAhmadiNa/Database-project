alter view StaffView as
(
	select FirstName,LastName,StaffID,OfficeID,Gender
	from Staff
)

select * from StaffView