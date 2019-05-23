select OfficeID,StaffID,Salary,sum(Salary) over (partition by OfficeID order by StaffID
rows between 3 preceding and current row) as prev3
from Staff
order by OfficeID,StaffID