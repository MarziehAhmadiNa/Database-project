select OfficeID,StaffID,Salary,avg(Salary) over (partition by OfficeID order by StaffID
rows between current row and  3 following ) as next3
from Staff
order by OfficeID,StaffID