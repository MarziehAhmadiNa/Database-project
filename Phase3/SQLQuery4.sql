alter function ManagementFunc()
returns table
as
return
(
	select 
	case grouping(Gender)
	when 0 then Gender
	when 1 then 'All Gender'
	end as Gender, 
	case grouping(Offices.Name)
	when 0 then Offices.Name
	when 1 then 'All Offices'
	end as 'Office Name',
	sum(Salary) as 'Sum Salary'
	from Staff inner join Offices on
	Staff.OfficeID=Offices.OfficeID
	group by rollup(Offices.Name,Gender)
)

select * from ManagementFunc()